require '_h2ph_pre.ph';

no warnings qw(redefine misc);

unless(defined(&_ASM_X86_UNISTD_64_H)) {
    eval 'sub _ASM_X86_UNISTD_64_H () {1;}' unless defined(&_ASM_X86_UNISTD_64_H);
    eval 'sub __NR_read () {0;}' unless defined(&__NR_read);
    eval 'sub __NR_write () {1;}' unless defined(&__NR_write);
    eval 'sub __NR_open () {2;}' unless defined(&__NR_open);
    eval 'sub __NR_close () {3;}' unless defined(&__NR_close);
    eval 'sub __NR_stat () {4;}' unless defined(&__NR_stat);
    eval 'sub __NR_fstat () {5;}' unless defined(&__NR_fstat);
    eval 'sub __NR_lstat () {6;}' unless defined(&__NR_lstat);
    eval 'sub __NR_poll () {7;}' unless defined(&__NR_poll);
    eval 'sub __NR_lseek () {8;}' unless defined(&__NR_lseek);
    eval 'sub __NR_mmap () {9;}' unless defined(&__NR_mmap);
    eval 'sub __NR_mprotect () {10;}' unless defined(&__NR_mprotect);
    eval 'sub __NR_munmap () {11;}' unless defined(&__NR_munmap);
    eval 'sub __NR_brk () {12;}' unless defined(&__NR_brk);
    eval 'sub __NR_rt_sigaction () {13;}' unless defined(&__NR_rt_sigaction);
    eval 'sub __NR_rt_sigprocmask () {14;}' unless defined(&__NR_rt_sigprocmask);
    eval 'sub __NR_rt_sigreturn () {15;}' unless defined(&__NR_rt_sigreturn);
    eval 'sub __NR_ioctl () {16;}' unless defined(&__NR_ioctl);
    eval 'sub __NR_pread64 () {17;}' unless defined(&__NR_pread64);
    eval 'sub __NR_pwrite64 () {18;}' unless defined(&__NR_pwrite64);
    eval 'sub __NR_readv () {19;}' unless defined(&__NR_readv);
    eval 'sub __NR_writev () {20;}' unless defined(&__NR_writev);
    eval 'sub __NR_access () {21;}' unless defined(&__NR_access);
    eval 'sub __NR_pipe () {22;}' unless defined(&__NR_pipe);
    eval 'sub __NR_select () {23;}' unless defined(&__NR_select);
    eval 'sub __NR_sched_yield () {24;}' unless defined(&__NR_sched_yield);
    eval 'sub __NR_mremap () {25;}' unless defined(&__NR_mremap);
    eval 'sub __NR_msync () {26;}' unless defined(&__NR_msync);
    eval 'sub __NR_mincore () {27;}' unless defined(&__NR_mincore);
    eval 'sub __NR_madvise () {28;}' unless defined(&__NR_madvise);
    eval 'sub __NR_shmget () {29;}' unless defined(&__NR_shmget);
    eval 'sub __NR_shmat () {30;}' unless defined(&__NR_shmat);
    eval 'sub __NR_shmctl () {31;}' unless defined(&__NR_shmctl);
    eval 'sub __NR_dup () {32;}' unless defined(&__NR_dup);
    eval 'sub __NR_dup2 () {33;}' unless defined(&__NR_dup2);
    eval 'sub __NR_pause () {34;}' unless defined(&__NR_pause);
    eval 'sub __NR_nanosleep () {35;}' unless defined(&__NR_nanosleep);
    eval 'sub __NR_getitimer () {36;}' unless defined(&__NR_getitimer);
    eval 'sub __NR_alarm () {37;}' unless defined(&__NR_alarm);
    eval 'sub __NR_setitimer () {38;}' unless defined(&__NR_setitimer);
    eval 'sub __NR_getpid () {39;}' unless defined(&__NR_getpid);
    eval 'sub __NR_sendfile () {40;}' unless defined(&__NR_sendfile);
    eval 'sub __NR_socket () {41;}' unless defined(&__NR_socket);
    eval 'sub __NR_connect () {42;}' unless defined(&__NR_connect);
    eval 'sub __NR_accept () {43;}' unless defined(&__NR_accept);
    eval 'sub __NR_sendto () {44;}' unless defined(&__NR_sendto);
    eval 'sub __NR_recvfrom () {45;}' unless defined(&__NR_recvfrom);
    eval 'sub __NR_sendmsg () {46;}' unless defined(&__NR_sendmsg);
    eval 'sub __NR_recvmsg () {47;}' unless defined(&__NR_recvmsg);
    eval 'sub __NR_shutdown () {48;}' unless defined(&__NR_shutdown);
    eval 'sub __NR_bind () {49;}' unless defined(&__NR_bind);
    eval 'sub __NR_listen () {50;}' unless defined(&__NR_listen);
    eval 'sub __NR_getsockname () {51;}' unless defined(&__NR_getsockname);
    eval 'sub __NR_getpeername () {52;}' unless defined(&__NR_getpeername);
    eval 'sub __NR_socketpair () {53;}' unless defined(&__NR_socketpair);
    eval 'sub __NR_setsockopt () {54;}' unless defined(&__NR_setsockopt);
    eval 'sub __NR_getsockopt () {55;}' unless defined(&__NR_getsockopt);
    eval 'sub __NR_clone () {56;}' unless defined(&__NR_clone);
    eval 'sub __NR_fork () {57;}' unless defined(&__NR_fork);
    eval 'sub __NR_vfork () {58;}' unless defined(&__NR_vfork);
    eval 'sub __NR_execve () {59;}' unless defined(&__NR_execve);
    eval 'sub __NR_exit () {60;}' unless defined(&__NR_exit);
    eval 'sub __NR_wait4 () {61;}' unless defined(&__NR_wait4);
    eval 'sub __NR_kill () {62;}' unless defined(&__NR_kill);
    eval 'sub __NR_uname () {63;}' unless defined(&__NR_uname);
    eval 'sub __NR_semget () {64;}' unless defined(&__NR_semget);
    eval 'sub __NR_semop () {65;}' unless defined(&__NR_semop);
    eval 'sub __NR_semctl () {66;}' unless defined(&__NR_semctl);
    eval 'sub __NR_shmdt () {67;}' unless defined(&__NR_shmdt);
    eval 'sub __NR_msgget () {68;}' unless defined(&__NR_msgget);
    eval 'sub __NR_msgsnd () {69;}' unless defined(&__NR_msgsnd);
    eval 'sub __NR_msgrcv () {70;}' unless defined(&__NR_msgrcv);
    eval 'sub __NR_msgctl () {71;}' unless defined(&__NR_msgctl);
    eval 'sub __NR_fcntl () {72;}' unless defined(&__NR_fcntl);
    eval 'sub __NR_flock () {73;}' unless defined(&__NR_flock);
    eval 'sub __NR_fsync () {74;}' unless defined(&__NR_fsync);
    eval 'sub __NR_fdatasync () {75;}' unless defined(&__NR_fdatasync);
    eval 'sub __NR_truncate () {76;}' unless defined(&__NR_truncate);
    eval 'sub __NR_ftruncate () {77;}' unless defined(&__NR_ftruncate);
    eval 'sub __NR_getdents () {78;}' unless defined(&__NR_getdents);
    eval 'sub __NR_getcwd () {79;}' unless defined(&__NR_getcwd);
    eval 'sub __NR_chdir () {80;}' unless defined(&__NR_chdir);
    eval 'sub __NR_fchdir () {81;}' unless defined(&__NR_fchdir);
    eval 'sub __NR_rename () {82;}' unless defined(&__NR_rename);
    eval 'sub __NR_mkdir () {83;}' unless defined(&__NR_mkdir);
    eval 'sub __NR_rmdir () {84;}' unless defined(&__NR_rmdir);
    eval 'sub __NR_creat () {85;}' unless defined(&__NR_creat);
    eval 'sub __NR_link () {86;}' unless defined(&__NR_link);
    eval 'sub __NR_unlink () {87;}' unless defined(&__NR_unlink);
    eval 'sub __NR_symlink () {88;}' unless defined(&__NR_symlink);
    eval 'sub __NR_readlink () {89;}' unless defined(&__NR_readlink);
    eval 'sub __NR_chmod () {90;}' unless defined(&__NR_chmod);
    eval 'sub __NR_fchmod () {91;}' unless defined(&__NR_fchmod);
    eval 'sub __NR_chown () {92;}' unless defined(&__NR_chown);
    eval 'sub __NR_fchown () {93;}' unless defined(&__NR_fchown);
    eval 'sub __NR_lchown () {94;}' unless defined(&__NR_lchown);
    eval 'sub __NR_umask () {95;}' unless defined(&__NR_umask);
    eval 'sub __NR_gettimeofday () {96;}' unless defined(&__NR_gettimeofday);
    eval 'sub __NR_getrlimit () {97;}' unless defined(&__NR_getrlimit);
    eval 'sub __NR_getrusage () {98;}' unless defined(&__NR_getrusage);
    eval 'sub __NR_sysinfo () {99;}' unless defined(&__NR_sysinfo);
    eval 'sub __NR_times () {100;}' unless defined(&__NR_times);
    eval 'sub __NR_ptrace () {101;}' unless defined(&__NR_ptrace);
    eval 'sub __NR_getuid () {102;}' unless defined(&__NR_getuid);
    eval 'sub __NR_syslog () {103;}' unless defined(&__NR_syslog);
    eval 'sub __NR_getgid () {104;}' unless defined(&__NR_getgid);
    eval 'sub __NR_setuid () {105;}' unless defined(&__NR_setuid);
    eval 'sub __NR_setgid () {106;}' unless defined(&__NR_setgid);
    eval 'sub __NR_geteuid () {107;}' unless defined(&__NR_geteuid);
    eval 'sub __NR_getegid () {108;}' unless defined(&__NR_getegid);
    eval 'sub __NR_setpgid () {109;}' unless defined(&__NR_setpgid);
    eval 'sub __NR_getppid () {110;}' unless defined(&__NR_getppid);
    eval 'sub __NR_getpgrp () {111;}' unless defined(&__NR_getpgrp);
    eval 'sub __NR_setsid () {112;}' unless defined(&__NR_setsid);
    eval 'sub __NR_setreuid () {113;}' unless defined(&__NR_setreuid);
    eval 'sub __NR_setregid () {114;}' unless defined(&__NR_setregid);
    eval 'sub __NR_getgroups () {115;}' unless defined(&__NR_getgroups);
    eval 'sub __NR_setgroups () {116;}' unless defined(&__NR_setgroups);
    eval 'sub __NR_setresuid () {117;}' unless defined(&__NR_setresuid);
    eval 'sub __NR_getresuid () {118;}' unless defined(&__NR_getresuid);
    eval 'sub __NR_setresgid () {119;}' unless defined(&__NR_setresgid);
    eval 'sub __NR_getresgid () {120;}' unless defined(&__NR_getresgid);
    eval 'sub __NR_getpgid () {121;}' unless defined(&__NR_getpgid);
    eval 'sub __NR_setfsuid () {122;}' unless defined(&__NR_setfsuid);
    eval 'sub __NR_setfsgid () {123;}' unless defined(&__NR_setfsgid);
    eval 'sub __NR_getsid () {124;}' unless defined(&__NR_getsid);
    eval 'sub __NR_capget () {125;}' unless defined(&__NR_capget);
    eval 'sub __NR_capset () {126;}' unless defined(&__NR_capset);
    eval 'sub __NR_rt_sigpending () {127;}' unless defined(&__NR_rt_sigpending);
    eval 'sub __NR_rt_sigtimedwait () {128;}' unless defined(&__NR_rt_sigtimedwait);
    eval 'sub __NR_rt_sigqueueinfo () {129;}' unless defined(&__NR_rt_sigqueueinfo);
    eval 'sub __NR_rt_sigsuspend () {130;}' unless defined(&__NR_rt_sigsuspend);
    eval 'sub __NR_sigaltstack () {131;}' unless defined(&__NR_sigaltstack);
    eval 'sub __NR_utime () {132;}' unless defined(&__NR_utime);
    eval 'sub __NR_mknod () {133;}' unless defined(&__NR_mknod);
    eval 'sub __NR_uselib () {134;}' unless defined(&__NR_uselib);
    eval 'sub __NR_personality () {135;}' unless defined(&__NR_personality);
    eval 'sub __NR_ustat () {136;}' unless defined(&__NR_ustat);
    eval 'sub __NR_statfs () {137;}' unless defined(&__NR_statfs);
    eval 'sub __NR_fstatfs () {138;}' unless defined(&__NR_fstatfs);
    eval 'sub __NR_sysfs () {139;}' unless defined(&__NR_sysfs);
    eval 'sub __NR_getpriority () {140;}' unless defined(&__NR_getpriority);
    eval 'sub __NR_setpriority () {141;}' unless defined(&__NR_setpriority);
    eval 'sub __NR_sched_setparam () {142;}' unless defined(&__NR_sched_setparam);
    eval 'sub __NR_sched_getparam () {143;}' unless defined(&__NR_sched_getparam);
    eval 'sub __NR_sched_setscheduler () {144;}' unless defined(&__NR_sched_setscheduler);
    eval 'sub __NR_sched_getscheduler () {145;}' unless defined(&__NR_sched_getscheduler);
    eval 'sub __NR_sched_get_priority_max () {146;}' unless defined(&__NR_sched_get_priority_max);
    eval 'sub __NR_sched_get_priority_min () {147;}' unless defined(&__NR_sched_get_priority_min);
    eval 'sub __NR_sched_rr_get_interval () {148;}' unless defined(&__NR_sched_rr_get_interval);
    eval 'sub __NR_mlock () {149;}' unless defined(&__NR_mlock);
    eval 'sub __NR_munlock () {150;}' unless defined(&__NR_munlock);
    eval 'sub __NR_mlockall () {151;}' unless defined(&__NR_mlockall);
    eval 'sub __NR_munlockall () {152;}' unless defined(&__NR_munlockall);
    eval 'sub __NR_vhangup () {153;}' unless defined(&__NR_vhangup);
    eval 'sub __NR_modify_ldt () {154;}' unless defined(&__NR_modify_ldt);
    eval 'sub __NR_pivot_root () {155;}' unless defined(&__NR_pivot_root);
    eval 'sub __NR__sysctl () {156;}' unless defined(&__NR__sysctl);
    eval 'sub __NR_prctl () {157;}' unless defined(&__NR_prctl);
    eval 'sub __NR_arch_prctl () {158;}' unless defined(&__NR_arch_prctl);
    eval 'sub __NR_adjtimex () {159;}' unless defined(&__NR_adjtimex);
    eval 'sub __NR_setrlimit () {160;}' unless defined(&__NR_setrlimit);
    eval 'sub __NR_chroot () {161;}' unless defined(&__NR_chroot);
    eval 'sub __NR_sync () {162;}' unless defined(&__NR_sync);
    eval 'sub __NR_acct () {163;}' unless defined(&__NR_acct);
    eval 'sub __NR_settimeofday () {164;}' unless defined(&__NR_settimeofday);
    eval 'sub __NR_mount () {165;}' unless defined(&__NR_mount);
    eval 'sub __NR_umount2 () {166;}' unless defined(&__NR_umount2);
    eval 'sub __NR_swapon () {167;}' unless defined(&__NR_swapon);
    eval 'sub __NR_swapoff () {168;}' unless defined(&__NR_swapoff);
    eval 'sub __NR_reboot () {169;}' unless defined(&__NR_reboot);
    eval 'sub __NR_sethostname () {170;}' unless defined(&__NR_sethostname);
    eval 'sub __NR_setdomainname () {171;}' unless defined(&__NR_setdomainname);
    eval 'sub __NR_iopl () {172;}' unless defined(&__NR_iopl);
    eval 'sub __NR_ioperm () {173;}' unless defined(&__NR_ioperm);
    eval 'sub __NR_create_module () {174;}' unless defined(&__NR_create_module);
    eval 'sub __NR_init_module () {175;}' unless defined(&__NR_init_module);
    eval 'sub __NR_delete_module () {176;}' unless defined(&__NR_delete_module);
    eval 'sub __NR_get_kernel_syms () {177;}' unless defined(&__NR_get_kernel_syms);
    eval 'sub __NR_query_module () {178;}' unless defined(&__NR_query_module);
    eval 'sub __NR_quotactl () {179;}' unless defined(&__NR_quotactl);
    eval 'sub __NR_nfsservctl () {180;}' unless defined(&__NR_nfsservctl);
    eval 'sub __NR_getpmsg () {181;}' unless defined(&__NR_getpmsg);
    eval 'sub __NR_putpmsg () {182;}' unless defined(&__NR_putpmsg);
    eval 'sub __NR_afs_syscall () {183;}' unless defined(&__NR_afs_syscall);
    eval 'sub __NR_tuxcall () {184;}' unless defined(&__NR_tuxcall);
    eval 'sub __NR_security () {185;}' unless defined(&__NR_security);
    eval 'sub __NR_gettid () {186;}' unless defined(&__NR_gettid);
    eval 'sub __NR_readahead () {187;}' unless defined(&__NR_readahead);
    eval 'sub __NR_setxattr () {188;}' unless defined(&__NR_setxattr);
    eval 'sub __NR_lsetxattr () {189;}' unless defined(&__NR_lsetxattr);
    eval 'sub __NR_fsetxattr () {190;}' unless defined(&__NR_fsetxattr);
    eval 'sub __NR_getxattr () {191;}' unless defined(&__NR_getxattr);
    eval 'sub __NR_lgetxattr () {192;}' unless defined(&__NR_lgetxattr);
    eval 'sub __NR_fgetxattr () {193;}' unless defined(&__NR_fgetxattr);
    eval 'sub __NR_listxattr () {194;}' unless defined(&__NR_listxattr);
    eval 'sub __NR_llistxattr () {195;}' unless defined(&__NR_llistxattr);
    eval 'sub __NR_flistxattr () {196;}' unless defined(&__NR_flistxattr);
    eval 'sub __NR_removexattr () {197;}' unless defined(&__NR_removexattr);
    eval 'sub __NR_lremovexattr () {198;}' unless defined(&__NR_lremovexattr);
    eval 'sub __NR_fremovexattr () {199;}' unless defined(&__NR_fremovexattr);
    eval 'sub __NR_tkill () {200;}' unless defined(&__NR_tkill);
    eval 'sub __NR_time () {201;}' unless defined(&__NR_time);
    eval 'sub __NR_futex () {202;}' unless defined(&__NR_futex);
    eval 'sub __NR_sched_setaffinity () {203;}' unless defined(&__NR_sched_setaffinity);
    eval 'sub __NR_sched_getaffinity () {204;}' unless defined(&__NR_sched_getaffinity);
    eval 'sub __NR_set_thread_area () {205;}' unless defined(&__NR_set_thread_area);
    eval 'sub __NR_io_setup () {206;}' unless defined(&__NR_io_setup);
    eval 'sub __NR_io_destroy () {207;}' unless defined(&__NR_io_destroy);
    eval 'sub __NR_io_getevents () {208;}' unless defined(&__NR_io_getevents);
    eval 'sub __NR_io_submit () {209;}' unless defined(&__NR_io_submit);
    eval 'sub __NR_io_cancel () {210;}' unless defined(&__NR_io_cancel);
    eval 'sub __NR_get_thread_area () {211;}' unless defined(&__NR_get_thread_area);
    eval 'sub __NR_lookup_dcookie () {212;}' unless defined(&__NR_lookup_dcookie);
    eval 'sub __NR_epoll_create () {213;}' unless defined(&__NR_epoll_create);
    eval 'sub __NR_epoll_ctl_old () {214;}' unless defined(&__NR_epoll_ctl_old);
    eval 'sub __NR_epoll_wait_old () {215;}' unless defined(&__NR_epoll_wait_old);
    eval 'sub __NR_remap_file_pages () {216;}' unless defined(&__NR_remap_file_pages);
    eval 'sub __NR_getdents64 () {217;}' unless defined(&__NR_getdents64);
    eval 'sub __NR_set_tid_address () {218;}' unless defined(&__NR_set_tid_address);
    eval 'sub __NR_restart_syscall () {219;}' unless defined(&__NR_restart_syscall);
    eval 'sub __NR_semtimedop () {220;}' unless defined(&__NR_semtimedop);
    eval 'sub __NR_fadvise64 () {221;}' unless defined(&__NR_fadvise64);
    eval 'sub __NR_timer_create () {222;}' unless defined(&__NR_timer_create);
    eval 'sub __NR_timer_settime () {223;}' unless defined(&__NR_timer_settime);
    eval 'sub __NR_timer_gettime () {224;}' unless defined(&__NR_timer_gettime);
    eval 'sub __NR_timer_getoverrun () {225;}' unless defined(&__NR_timer_getoverrun);
    eval 'sub __NR_timer_delete () {226;}' unless defined(&__NR_timer_delete);
    eval 'sub __NR_clock_settime () {227;}' unless defined(&__NR_clock_settime);
    eval 'sub __NR_clock_gettime () {228;}' unless defined(&__NR_clock_gettime);
    eval 'sub __NR_clock_getres () {229;}' unless defined(&__NR_clock_getres);
    eval 'sub __NR_clock_nanosleep () {230;}' unless defined(&__NR_clock_nanosleep);
    eval 'sub __NR_exit_group () {231;}' unless defined(&__NR_exit_group);
    eval 'sub __NR_epoll_wait () {232;}' unless defined(&__NR_epoll_wait);
    eval 'sub __NR_epoll_ctl () {233;}' unless defined(&__NR_epoll_ctl);
    eval 'sub __NR_tgkill () {234;}' unless defined(&__NR_tgkill);
    eval 'sub __NR_utimes () {235;}' unless defined(&__NR_utimes);
    eval 'sub __NR_vserver () {236;}' unless defined(&__NR_vserver);
    eval 'sub __NR_mbind () {237;}' unless defined(&__NR_mbind);
    eval 'sub __NR_set_mempolicy () {238;}' unless defined(&__NR_set_mempolicy);
    eval 'sub __NR_get_mempolicy () {239;}' unless defined(&__NR_get_mempolicy);
    eval 'sub __NR_mq_open () {240;}' unless defined(&__NR_mq_open);
    eval 'sub __NR_mq_unlink () {241;}' unless defined(&__NR_mq_unlink);
    eval 'sub __NR_mq_timedsend () {242;}' unless defined(&__NR_mq_timedsend);
    eval 'sub __NR_mq_timedreceive () {243;}' unless defined(&__NR_mq_timedreceive);
    eval 'sub __NR_mq_notify () {244;}' unless defined(&__NR_mq_notify);
    eval 'sub __NR_mq_getsetattr () {245;}' unless defined(&__NR_mq_getsetattr);
    eval 'sub __NR_kexec_load () {246;}' unless defined(&__NR_kexec_load);
    eval 'sub __NR_waitid () {247;}' unless defined(&__NR_waitid);
    eval 'sub __NR_add_key () {248;}' unless defined(&__NR_add_key);
    eval 'sub __NR_request_key () {249;}' unless defined(&__NR_request_key);
    eval 'sub __NR_keyctl () {250;}' unless defined(&__NR_keyctl);
    eval 'sub __NR_ioprio_set () {251;}' unless defined(&__NR_ioprio_set);
    eval 'sub __NR_ioprio_get () {252;}' unless defined(&__NR_ioprio_get);
    eval 'sub __NR_inotify_init () {253;}' unless defined(&__NR_inotify_init);
    eval 'sub __NR_inotify_add_watch () {254;}' unless defined(&__NR_inotify_add_watch);
    eval 'sub __NR_inotify_rm_watch () {255;}' unless defined(&__NR_inotify_rm_watch);
    eval 'sub __NR_migrate_pages () {256;}' unless defined(&__NR_migrate_pages);
    eval 'sub __NR_openat () {257;}' unless defined(&__NR_openat);
    eval 'sub __NR_mkdirat () {258;}' unless defined(&__NR_mkdirat);
    eval 'sub __NR_mknodat () {259;}' unless defined(&__NR_mknodat);
    eval 'sub __NR_fchownat () {260;}' unless defined(&__NR_fchownat);
    eval 'sub __NR_futimesat () {261;}' unless defined(&__NR_futimesat);
    eval 'sub __NR_newfstatat () {262;}' unless defined(&__NR_newfstatat);
    eval 'sub __NR_unlinkat () {263;}' unless defined(&__NR_unlinkat);
    eval 'sub __NR_renameat () {264;}' unless defined(&__NR_renameat);
    eval 'sub __NR_linkat () {265;}' unless defined(&__NR_linkat);
    eval 'sub __NR_symlinkat () {266;}' unless defined(&__NR_symlinkat);
    eval 'sub __NR_readlinkat () {267;}' unless defined(&__NR_readlinkat);
    eval 'sub __NR_fchmodat () {268;}' unless defined(&__NR_fchmodat);
    eval 'sub __NR_faccessat () {269;}' unless defined(&__NR_faccessat);
    eval 'sub __NR_pselect6 () {270;}' unless defined(&__NR_pselect6);
    eval 'sub __NR_ppoll () {271;}' unless defined(&__NR_ppoll);
    eval 'sub __NR_unshare () {272;}' unless defined(&__NR_unshare);
    eval 'sub __NR_set_robust_list () {273;}' unless defined(&__NR_set_robust_list);
    eval 'sub __NR_get_robust_list () {274;}' unless defined(&__NR_get_robust_list);
    eval 'sub __NR_splice () {275;}' unless defined(&__NR_splice);
    eval 'sub __NR_tee () {276;}' unless defined(&__NR_tee);
    eval 'sub __NR_sync_file_range () {277;}' unless defined(&__NR_sync_file_range);
    eval 'sub __NR_vmsplice () {278;}' unless defined(&__NR_vmsplice);
    eval 'sub __NR_move_pages () {279;}' unless defined(&__NR_move_pages);
    eval 'sub __NR_utimensat () {280;}' unless defined(&__NR_utimensat);
    eval 'sub __NR_epoll_pwait () {281;}' unless defined(&__NR_epoll_pwait);
    eval 'sub __NR_signalfd () {282;}' unless defined(&__NR_signalfd);
    eval 'sub __NR_timerfd_create () {283;}' unless defined(&__NR_timerfd_create);
    eval 'sub __NR_eventfd () {284;}' unless defined(&__NR_eventfd);
    eval 'sub __NR_fallocate () {285;}' unless defined(&__NR_fallocate);
    eval 'sub __NR_timerfd_settime () {286;}' unless defined(&__NR_timerfd_settime);
    eval 'sub __NR_timerfd_gettime () {287;}' unless defined(&__NR_timerfd_gettime);
    eval 'sub __NR_accept4 () {288;}' unless defined(&__NR_accept4);
    eval 'sub __NR_signalfd4 () {289;}' unless defined(&__NR_signalfd4);
    eval 'sub __NR_eventfd2 () {290;}' unless defined(&__NR_eventfd2);
    eval 'sub __NR_epoll_create1 () {291;}' unless defined(&__NR_epoll_create1);
    eval 'sub __NR_dup3 () {292;}' unless defined(&__NR_dup3);
    eval 'sub __NR_pipe2 () {293;}' unless defined(&__NR_pipe2);
    eval 'sub __NR_inotify_init1 () {294;}' unless defined(&__NR_inotify_init1);
    eval 'sub __NR_preadv () {295;}' unless defined(&__NR_preadv);
    eval 'sub __NR_pwritev () {296;}' unless defined(&__NR_pwritev);
    eval 'sub __NR_rt_tgsigqueueinfo () {297;}' unless defined(&__NR_rt_tgsigqueueinfo);
    eval 'sub __NR_perf_event_open () {298;}' unless defined(&__NR_perf_event_open);
    eval 'sub __NR_recvmmsg () {299;}' unless defined(&__NR_recvmmsg);
    eval 'sub __NR_fanotify_init () {300;}' unless defined(&__NR_fanotify_init);
    eval 'sub __NR_fanotify_mark () {301;}' unless defined(&__NR_fanotify_mark);
    eval 'sub __NR_prlimit64 () {302;}' unless defined(&__NR_prlimit64);
    eval 'sub __NR_name_to_handle_at () {303;}' unless defined(&__NR_name_to_handle_at);
    eval 'sub __NR_open_by_handle_at () {304;}' unless defined(&__NR_open_by_handle_at);
    eval 'sub __NR_clock_adjtime () {305;}' unless defined(&__NR_clock_adjtime);
    eval 'sub __NR_syncfs () {306;}' unless defined(&__NR_syncfs);
    eval 'sub __NR_sendmmsg () {307;}' unless defined(&__NR_sendmmsg);
    eval 'sub __NR_setns () {308;}' unless defined(&__NR_setns);
    eval 'sub __NR_getcpu () {309;}' unless defined(&__NR_getcpu);
    eval 'sub __NR_process_vm_readv () {310;}' unless defined(&__NR_process_vm_readv);
    eval 'sub __NR_process_vm_writev () {311;}' unless defined(&__NR_process_vm_writev);
    eval 'sub __NR_kcmp () {312;}' unless defined(&__NR_kcmp);
    eval 'sub __NR_finit_module () {313;}' unless defined(&__NR_finit_module);
    eval 'sub __NR_sched_setattr () {314;}' unless defined(&__NR_sched_setattr);
    eval 'sub __NR_sched_getattr () {315;}' unless defined(&__NR_sched_getattr);
    eval 'sub __NR_renameat2 () {316;}' unless defined(&__NR_renameat2);
    eval 'sub __NR_seccomp () {317;}' unless defined(&__NR_seccomp);
    eval 'sub __NR_getrandom () {318;}' unless defined(&__NR_getrandom);
    eval 'sub __NR_memfd_create () {319;}' unless defined(&__NR_memfd_create);
    eval 'sub __NR_kexec_file_load () {320;}' unless defined(&__NR_kexec_file_load);
    eval 'sub __NR_bpf () {321;}' unless defined(&__NR_bpf);
    eval 'sub __NR_execveat () {322;}' unless defined(&__NR_execveat);
    eval 'sub __NR_userfaultfd () {323;}' unless defined(&__NR_userfaultfd);
    eval 'sub __NR_membarrier () {324;}' unless defined(&__NR_membarrier);
    eval 'sub __NR_mlock2 () {325;}' unless defined(&__NR_mlock2);
    eval 'sub __NR_copy_file_range () {326;}' unless defined(&__NR_copy_file_range);
    eval 'sub __NR_preadv2 () {327;}' unless defined(&__NR_preadv2);
    eval 'sub __NR_pwritev2 () {328;}' unless defined(&__NR_pwritev2);
    eval 'sub __NR_pkey_mprotect () {329;}' unless defined(&__NR_pkey_mprotect);
    eval 'sub __NR_pkey_alloc () {330;}' unless defined(&__NR_pkey_alloc);
    eval 'sub __NR_pkey_free () {331;}' unless defined(&__NR_pkey_free);
    eval 'sub __NR_statx () {332;}' unless defined(&__NR_statx);
    eval 'sub __NR_io_pgetevents () {333;}' unless defined(&__NR_io_pgetevents);
    eval 'sub __NR_rseq () {334;}' unless defined(&__NR_rseq);
    eval 'sub __NR_pidfd_send_signal () {424;}' unless defined(&__NR_pidfd_send_signal);
    eval 'sub __NR_io_uring_setup () {425;}' unless defined(&__NR_io_uring_setup);
    eval 'sub __NR_io_uring_enter () {426;}' unless defined(&__NR_io_uring_enter);
    eval 'sub __NR_io_uring_register () {427;}' unless defined(&__NR_io_uring_register);
    eval 'sub __NR_open_tree () {428;}' unless defined(&__NR_open_tree);
    eval 'sub __NR_move_mount () {429;}' unless defined(&__NR_move_mount);
    eval 'sub __NR_fsopen () {430;}' unless defined(&__NR_fsopen);
    eval 'sub __NR_fsconfig () {431;}' unless defined(&__NR_fsconfig);
    eval 'sub __NR_fsmount () {432;}' unless defined(&__NR_fsmount);
    eval 'sub __NR_fspick () {433;}' unless defined(&__NR_fspick);
    eval 'sub __NR_pidfd_open () {434;}' unless defined(&__NR_pidfd_open);
    eval 'sub __NR_clone3 () {435;}' unless defined(&__NR_clone3);
}
1;
