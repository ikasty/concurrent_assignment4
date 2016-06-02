	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC writer */

	case 3: // STATE 5
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC reader */

	case 4: // STATE 5
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 5: // STATE 1
		;
		readers = trpt->bup.oval;
		;
		goto R999;

	case 6: // STATE 2
		;
		writers = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 3
		;
		pending_writers = trpt->bup.oval;
		;
		goto R999;

	case 8: // STATE 4
		;
		read_write_lock = trpt->bup.oval;
		;
		goto R999;

	case 9: // STATE 5
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 10: // STATE 6
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 11: // STATE 7
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 12: // STATE 8
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 13: // STATE 9
		;
		p_restor(II);
		;
		;
		goto R999;
	}

