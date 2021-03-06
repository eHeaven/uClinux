/* vi: set sw=4 ts=4: */
/*
 * Utility routines.
 *
 * Copyright (C) 2007 Denys Vlasenko
 *
 * Licensed under GPL version 2, see file LICENSE in this tarball for details.
 */

#include "libbb.h"
#include <sys/syscall.h>

#if defined(ENABLE_MONOTONIC_SYSCALL) && defined(__NR_clock_gettime)

/* libc has incredibly messy way of doing this,
 * typically requiring -lrt. We just skip all this mess */
unsigned long long monotonic_us(void)
{
	struct timespec ts;
	if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, &ts))
		bb_error_msg_and_die("clock_gettime(MONOTONIC) failed");
	return ts.tv_sec * 1000000ULL + ts.tv_nsec/1000;
}
unsigned monotonic_sec(void)
{
	struct timespec ts;
	if (syscall(__NR_clock_gettime, CLOCK_MONOTONIC, &ts))
		bb_error_msg_and_die("clock_gettime(MONOTONIC) failed");
	return ts.tv_sec;
}
#else
unsigned long long monotonic_us(void)
{
	struct timeval tv;
	gettimeofday(&tv, NULL);
	return tv.tv_sec * 1000000ULL + tv.tv_usec;
}

unsigned monotonic_sec(void)
{
	return time(NULL);
}
#endif
