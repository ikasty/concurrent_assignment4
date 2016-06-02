/* You may add more variables or labels to model the rwlock algorithm and to
 * check the requirements. Also, you may add necessary asserts and ltl formulas
 * */

typedef cond_var {
	int w;
	int s;
}

int readers ;
int writers ;
cond_var readers_proceed ;
cond_var writer_proceed ;
int pending_writers ;
bool read_write_lock ;

init { // mylib_rwlock_init()
	readers = 0 ;
	writers = 0 ;
	pending_writers = 0 ;

	// Initialization of read_write_lock
	read_write_lock = 0 ;
	// Initialize readers_proceed, and writer_proceed here if necessary 

	// creates 2 readers and 2 writers
	run reader() ;
	run reader() ;
	run writer() ;
	run writer() ;
}

inline rlock() { // mylib_rwlock_rlock()
	lock(read_write_lock);

	do
	:: pending_writers > 0 || writers > 0 ->
		cond_wait(readers_proceed, read_write_lock);
	:: else -> break;
	od

	readers++;

	unlock(read_write_lock);
}

inline wlock() { // mylib_rwlock_wlock()
	lock(read_write_lock);

	do
	:: (writers > 0 || readers > 0) ->
		pending_writers++;
		cond_wait(writer_proceed, read_write_lock);
	:: else -> break;
	od

	pending_writers--;
	writers++

	unlock(read_write_lock);
}

inline rwunlock() { // mylib_rwlock_unlock()
	lock(read_write_lock);

	if
	:: writers > 0 -> writers = 0;
	:: readers > 0 -> readers--;
	:: else -> assert(false);
	fi

	unlock(read_write_lock);

	if
	:: readers == 0 && pending_writers > 0 ->
		cond_signal(writer_proceed);
	:: readers > 0 ->
		cond_broadcast(readers_proceed);
	:: else -> skip;
	fi
}


inline lock(m) { // pthread_mutex_lock()
skip;
again:	m == 0;
	atomic {
		if
		:: m != 0 -> goto again;
		:: else -> m = 1;
		fi
	}
}

inline unlock(m) { // pthread_mutex_unlock()
	atomic {
		assert(m == 1);
		m = 0;
	}
}

inline cond_wait(cv, m) { // pthread_cond_wait()
	atomic {
		unlock(m);
		cv.w++;
	}

again:	cv.w == cv.s;
	atomic {
		if
		:: m != 0 -> goto again;
		:: else -> m = 1;
		fi
	}
}

inline cond_signal(cv) { // pthread_cond_signal()
	cv.s = cv.w;
}

inline cond_broadcast(cv) {// pthread_cond_broadcast()
	cv.s = cv.w;
}


proctype reader() {
	rlock() ;
	/* critical section */
	rwunlock() ;
}

proctype writer() {
	wlock() ;
	/* critical section */
	rwunlock() ;
}
