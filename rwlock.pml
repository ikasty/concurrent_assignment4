/* You may add more variables or labels to model the rwlock algorithm and to
 * check the requirements. Also, you may add necessary asserts and ltl formulas
 * */

typedef cond_var {
	/* Implement this */
int x;
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
	/* Implement this */
}

inline wlock() { // mylib_rwlock_wlock()
	/* Implement this */
}

inline rwunlock() { // mylib_rwlock_unlock()
	/* Implement this */
}


inline lock(m) { // pthread_mutex_lock()
	/* Implement this */
}

inline unlock(m) { // pthread_mutex_unlock()
	/* Implement this */
}

inline cond_wait(cv, m) { // pthread_cond_wait()
	/* Implement this */
}

inline cond_signal(cv) { // pthread_cond_signal()
	/* Implement this */
}

inline cond_broadcast(cv) {// pthread_cond_broadcast()
	/* Implement this */
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
