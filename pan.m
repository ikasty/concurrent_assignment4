#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC writer */
	case 3: // STATE 5 - rwlock.pml:77 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC reader */
	case 4: // STATE 5 - rwlock.pml:71 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC :init: */
	case 5: // STATE 1 - rwlock.pml:18 - [readers = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = readers;
		readers = 0;
#ifdef VAR_RANGES
		logval("readers", readers);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 2 - rwlock.pml:19 - [writers = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = writers;
		writers = 0;
#ifdef VAR_RANGES
		logval("writers", writers);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 3 - rwlock.pml:20 - [pending_writers = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = pending_writers;
		pending_writers = 0;
#ifdef VAR_RANGES
		logval("pending_writers", pending_writers);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 4 - rwlock.pml:23 - [read_write_lock = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		(trpt+1)->bup.oval = ((int)read_write_lock);
		read_write_lock = 0;
#ifdef VAR_RANGES
		logval("read_write_lock", ((int)read_write_lock));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 5 - rwlock.pml:27 - [(run reader())] (0:0:0 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!(addproc(II, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 6 - rwlock.pml:28 - [(run reader())] (0:0:0 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		if (!(addproc(II, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 7 - rwlock.pml:29 - [(run writer())] (0:0:0 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		if (!(addproc(II, 1, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 8 - rwlock.pml:30 - [(run writer())] (0:0:0 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		if (!(addproc(II, 1, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 9 - rwlock.pml:31 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

