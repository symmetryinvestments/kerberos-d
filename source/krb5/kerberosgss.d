


        import core.stdc.config;
        import core.stdc.stdarg: va_list;
        static import core.simd;
        static import std.conv;

        struct Int128 { long lower; long upper; }
        struct UInt128 { ulong lower; ulong upper; }

        struct __locale_data { int dummy; }



alias _Bool = bool;
struct dpp {
    static struct Opaque(int N) {
        void[N] bytes;
    }

    static bool isEmpty(T)() {
        return T.tupleof.length == 0;
    }
    static struct Move(T) {
        T* ptr;
    }


    static auto move(T)(ref T value) {
        return Move!T(&value);
    }
    mixin template EnumD(string name, T, string prefix) if(is(T == enum)) {
        private static string _memberMixinStr(string member) {
            import std.conv: text;
            import std.array: replace;
            return text(` `, member.replace(prefix, ""), ` = `, T.stringof, `.`, member, `,`);
        }
        private static string _enumMixinStr() {
            import std.array: join;
            string[] ret;
            ret ~= "enum " ~ name ~ "{";
            static foreach(member; __traits(allMembers, T)) {
                ret ~= _memberMixinStr(member);
            }
            ret ~= "}";
            return ret.join("\n");
        }
        mixin(_enumMixinStr());
    }
}

extern(C)
{
    alias wchar_t = int;
    alias size_t = c_ulong;
    alias ptrdiff_t = c_long;
    struct max_align_t
    {
        long __clang_max_align_nonce1;
        real __clang_max_align_nonce2;
    }
    int getentropy(void*, c_ulong) @nogc nothrow;
    char* crypt(const(char)*, const(char)*) @nogc nothrow;
    int fdatasync(int) @nogc nothrow;
    int lockf(int, int, c_long) @nogc nothrow;
    c_long syscall(c_long, ...) @nogc nothrow;
    void* sbrk(c_long) @nogc nothrow;
    int brk(void*) @nogc nothrow;
    int ftruncate(int, c_long) @nogc nothrow;
    int truncate(const(char)*, c_long) @nogc nothrow;
    int getdtablesize() @nogc nothrow;
    int getpagesize() @nogc nothrow;
    void sync() @nogc nothrow;
    c_long gethostid() @nogc nothrow;
    int fsync(int) @nogc nothrow;
    char* getpass(const(char)*) @nogc nothrow;
    int chroot(const(char)*) @nogc nothrow;
    int daemon(int, int) @nogc nothrow;
    void setusershell() @nogc nothrow;
    void endusershell() @nogc nothrow;
    char* getusershell() @nogc nothrow;
    int acct(const(char)*) @nogc nothrow;
    int profil(ushort*, c_ulong, c_ulong, uint) @nogc nothrow;
    int revoke(const(char)*) @nogc nothrow;
    int vhangup() @nogc nothrow;
    int setdomainname(const(char)*, c_ulong) @nogc nothrow;
    int getdomainname(char*, c_ulong) @nogc nothrow;
    int sethostid(c_long) @nogc nothrow;
    int sethostname(const(char)*, c_ulong) @nogc nothrow;
    int gethostname(char*, c_ulong) @nogc nothrow;
    int setlogin(const(char)*) @nogc nothrow;
    int getlogin_r(char*, c_ulong) @nogc nothrow;
    char* getlogin() @nogc nothrow;
    int tcsetpgrp(int, int) @nogc nothrow;
    int tcgetpgrp(int) @nogc nothrow;
    int rmdir(const(char)*) @nogc nothrow;
    int unlinkat(int, const(char)*, int) @nogc nothrow;
    int unlink(const(char)*) @nogc nothrow;
    c_long readlinkat(int, const(char)*, char*, c_ulong) @nogc nothrow;
    int symlinkat(const(char)*, int, const(char)*) @nogc nothrow;
    c_long readlink(const(char)*, char*, c_ulong) @nogc nothrow;
    int symlink(const(char)*, const(char)*) @nogc nothrow;
    int linkat(int, const(char)*, int, const(char)*, int) @nogc nothrow;
    int link(const(char)*, const(char)*) @nogc nothrow;
    int ttyslot() @nogc nothrow;
    int isatty(int) @nogc nothrow;
    int ttyname_r(int, char*, c_ulong) @nogc nothrow;
    char* ttyname(int) @nogc nothrow;
    int vfork() @nogc nothrow;
    int fork() @nogc nothrow;
    int setegid(uint) @nogc nothrow;
    int setregid(uint, uint) @nogc nothrow;
    int setgid(uint) @nogc nothrow;
    int seteuid(uint) @nogc nothrow;
    int setreuid(uint, uint) @nogc nothrow;
    int setuid(uint) @nogc nothrow;
    int getgroups(int, uint*) @nogc nothrow;
    uint getegid() @nogc nothrow;
    uint getgid() @nogc nothrow;
    uint geteuid() @nogc nothrow;
    uint getuid() @nogc nothrow;
    int getsid(int) @nogc nothrow;
    int setsid() @nogc nothrow;
    int setpgrp() @nogc nothrow;
    int setpgid(int, int) @nogc nothrow;
    int getpgid(int) @nogc nothrow;
    int __getpgid(int) @nogc nothrow;
    int getpgrp() @nogc nothrow;
    int getppid() @nogc nothrow;
    int getpid() @nogc nothrow;
    c_ulong confstr(int, char*, c_ulong) @nogc nothrow;
    c_long sysconf(int) @nogc nothrow;
    c_long fpathconf(int, int) @nogc nothrow;
    c_long pathconf(const(char)*, int) @nogc nothrow;
    void _exit(int) @nogc nothrow;
    int nice(int) @nogc nothrow;
    int execlp(const(char)*, const(char)*, ...) @nogc nothrow;
    int execvp(const(char)*, char**) @nogc nothrow;
    int execl(const(char)*, const(char)*, ...) @nogc nothrow;
    int execle(const(char)*, const(char)*, ...) @nogc nothrow;
    int execv(const(char)*, char**) @nogc nothrow;
    pragma(mangle, "alloca") void* alloca_(c_ulong) @nogc nothrow;
    int fexecve(int, char**, char**) @nogc nothrow;
    int execve(const(char)*, char**, char**) @nogc nothrow;
    extern __gshared char** __environ;
    int dup2(int, int) @nogc nothrow;
    int dup(int) @nogc nothrow;
    char* getwd(char*) @nogc nothrow;
    char* getcwd(char*, c_ulong) @nogc nothrow;
    int fchdir(int) @nogc nothrow;
    int chdir(const(char)*) @nogc nothrow;
    int fchownat(int, const(char)*, uint, uint, int) @nogc nothrow;
    int lchown(const(char)*, uint, uint) @nogc nothrow;
    int fchown(int, uint, uint) @nogc nothrow;
    int chown(const(char)*, uint, uint) @nogc nothrow;
    int pause() @nogc nothrow;
    int usleep(uint) @nogc nothrow;
    uint ualarm(uint, uint) @nogc nothrow;
    uint sleep(uint) @nogc nothrow;
    uint alarm(uint) @nogc nothrow;
    int pipe(int*) @nogc nothrow;
    c_long pwrite(int, const(void)*, c_ulong, c_long) @nogc nothrow;
    c_long pread(int, void*, c_ulong, c_long) @nogc nothrow;
    c_long write(int, const(void)*, c_ulong) @nogc nothrow;
    c_long read(int, void*, c_ulong) @nogc nothrow;
    int close(int) @nogc nothrow;
    c_long lseek(int, c_long, int) @nogc nothrow;
    int faccessat(int, const(char)*, int, int) @nogc nothrow;
    int access(const(char)*, int) @nogc nothrow;
    alias socklen_t = uint;
    alias intptr_t = c_long;
    alias pid_t = int;
    alias useconds_t = uint;
    alias off_t = c_long;
    alias uid_t = uint;
    alias gid_t = uint;
    alias ssize_t = c_long;
    alias fsfilcnt_t = c_ulong;
    alias fsblkcnt_t = c_ulong;
    alias blkcnt_t = c_long;
    alias blksize_t = c_long;
    alias register_t = c_long;
    alias u_int64_t = c_ulong;
    alias u_int32_t = uint;
    alias u_int16_t = ushort;
    alias u_int8_t = ubyte;
    alias key_t = int;
    alias caddr_t = char*;
    alias daddr_t = int;
    alias id_t = uint;
    static ushort __bswap_16(ushort) @nogc nothrow;
    static uint __bswap_32(uint) @nogc nothrow;
    static c_ulong __bswap_64(c_ulong) @nogc nothrow;
    enum _Anonymous_0
    {
        _PC_LINK_MAX = 0,
        _PC_MAX_CANON = 1,
        _PC_MAX_INPUT = 2,
        _PC_NAME_MAX = 3,
        _PC_PATH_MAX = 4,
        _PC_PIPE_BUF = 5,
        _PC_CHOWN_RESTRICTED = 6,
        _PC_NO_TRUNC = 7,
        _PC_VDISABLE = 8,
        _PC_SYNC_IO = 9,
        _PC_ASYNC_IO = 10,
        _PC_PRIO_IO = 11,
        _PC_SOCK_MAXBUF = 12,
        _PC_FILESIZEBITS = 13,
        _PC_REC_INCR_XFER_SIZE = 14,
        _PC_REC_MAX_XFER_SIZE = 15,
        _PC_REC_MIN_XFER_SIZE = 16,
        _PC_REC_XFER_ALIGN = 17,
        _PC_ALLOC_SIZE_MIN = 18,
        _PC_SYMLINK_MAX = 19,
        _PC_2_SYMLINKS = 20,
    }
    enum _PC_LINK_MAX = _Anonymous_0._PC_LINK_MAX;
    enum _PC_MAX_CANON = _Anonymous_0._PC_MAX_CANON;
    enum _PC_MAX_INPUT = _Anonymous_0._PC_MAX_INPUT;
    enum _PC_NAME_MAX = _Anonymous_0._PC_NAME_MAX;
    enum _PC_PATH_MAX = _Anonymous_0._PC_PATH_MAX;
    enum _PC_PIPE_BUF = _Anonymous_0._PC_PIPE_BUF;
    enum _PC_CHOWN_RESTRICTED = _Anonymous_0._PC_CHOWN_RESTRICTED;
    enum _PC_NO_TRUNC = _Anonymous_0._PC_NO_TRUNC;
    enum _PC_VDISABLE = _Anonymous_0._PC_VDISABLE;
    enum _PC_SYNC_IO = _Anonymous_0._PC_SYNC_IO;
    enum _PC_ASYNC_IO = _Anonymous_0._PC_ASYNC_IO;
    enum _PC_PRIO_IO = _Anonymous_0._PC_PRIO_IO;
    enum _PC_SOCK_MAXBUF = _Anonymous_0._PC_SOCK_MAXBUF;
    enum _PC_FILESIZEBITS = _Anonymous_0._PC_FILESIZEBITS;
    enum _PC_REC_INCR_XFER_SIZE = _Anonymous_0._PC_REC_INCR_XFER_SIZE;
    enum _PC_REC_MAX_XFER_SIZE = _Anonymous_0._PC_REC_MAX_XFER_SIZE;
    enum _PC_REC_MIN_XFER_SIZE = _Anonymous_0._PC_REC_MIN_XFER_SIZE;
    enum _PC_REC_XFER_ALIGN = _Anonymous_0._PC_REC_XFER_ALIGN;
    enum _PC_ALLOC_SIZE_MIN = _Anonymous_0._PC_ALLOC_SIZE_MIN;
    enum _PC_SYMLINK_MAX = _Anonymous_0._PC_SYMLINK_MAX;
    enum _PC_2_SYMLINKS = _Anonymous_0._PC_2_SYMLINKS;
    alias nlink_t = c_ulong;
    alias mode_t = uint;
    alias dev_t = c_ulong;
    alias ino_t = c_ulong;
    alias loff_t = c_long;
    alias fsid_t = __fsid_t;
    alias u_quad_t = c_ulong;
    alias quad_t = c_long;
    alias u_long = c_ulong;
    alias u_int = uint;
    alias u_short = ushort;
    alias u_char = ubyte;
    enum _Anonymous_1
    {
        _SC_ARG_MAX = 0,
        _SC_CHILD_MAX = 1,
        _SC_CLK_TCK = 2,
        _SC_NGROUPS_MAX = 3,
        _SC_OPEN_MAX = 4,
        _SC_STREAM_MAX = 5,
        _SC_TZNAME_MAX = 6,
        _SC_JOB_CONTROL = 7,
        _SC_SAVED_IDS = 8,
        _SC_REALTIME_SIGNALS = 9,
        _SC_PRIORITY_SCHEDULING = 10,
        _SC_TIMERS = 11,
        _SC_ASYNCHRONOUS_IO = 12,
        _SC_PRIORITIZED_IO = 13,
        _SC_SYNCHRONIZED_IO = 14,
        _SC_FSYNC = 15,
        _SC_MAPPED_FILES = 16,
        _SC_MEMLOCK = 17,
        _SC_MEMLOCK_RANGE = 18,
        _SC_MEMORY_PROTECTION = 19,
        _SC_MESSAGE_PASSING = 20,
        _SC_SEMAPHORES = 21,
        _SC_SHARED_MEMORY_OBJECTS = 22,
        _SC_AIO_LISTIO_MAX = 23,
        _SC_AIO_MAX = 24,
        _SC_AIO_PRIO_DELTA_MAX = 25,
        _SC_DELAYTIMER_MAX = 26,
        _SC_MQ_OPEN_MAX = 27,
        _SC_MQ_PRIO_MAX = 28,
        _SC_VERSION = 29,
        _SC_PAGESIZE = 30,
        _SC_RTSIG_MAX = 31,
        _SC_SEM_NSEMS_MAX = 32,
        _SC_SEM_VALUE_MAX = 33,
        _SC_SIGQUEUE_MAX = 34,
        _SC_TIMER_MAX = 35,
        _SC_BC_BASE_MAX = 36,
        _SC_BC_DIM_MAX = 37,
        _SC_BC_SCALE_MAX = 38,
        _SC_BC_STRING_MAX = 39,
        _SC_COLL_WEIGHTS_MAX = 40,
        _SC_EQUIV_CLASS_MAX = 41,
        _SC_EXPR_NEST_MAX = 42,
        _SC_LINE_MAX = 43,
        _SC_RE_DUP_MAX = 44,
        _SC_CHARCLASS_NAME_MAX = 45,
        _SC_2_VERSION = 46,
        _SC_2_C_BIND = 47,
        _SC_2_C_DEV = 48,
        _SC_2_FORT_DEV = 49,
        _SC_2_FORT_RUN = 50,
        _SC_2_SW_DEV = 51,
        _SC_2_LOCALEDEF = 52,
        _SC_PII = 53,
        _SC_PII_XTI = 54,
        _SC_PII_SOCKET = 55,
        _SC_PII_INTERNET = 56,
        _SC_PII_OSI = 57,
        _SC_POLL = 58,
        _SC_SELECT = 59,
        _SC_UIO_MAXIOV = 60,
        _SC_IOV_MAX = 60,
        _SC_PII_INTERNET_STREAM = 61,
        _SC_PII_INTERNET_DGRAM = 62,
        _SC_PII_OSI_COTS = 63,
        _SC_PII_OSI_CLTS = 64,
        _SC_PII_OSI_M = 65,
        _SC_T_IOV_MAX = 66,
        _SC_THREADS = 67,
        _SC_THREAD_SAFE_FUNCTIONS = 68,
        _SC_GETGR_R_SIZE_MAX = 69,
        _SC_GETPW_R_SIZE_MAX = 70,
        _SC_LOGIN_NAME_MAX = 71,
        _SC_TTY_NAME_MAX = 72,
        _SC_THREAD_DESTRUCTOR_ITERATIONS = 73,
        _SC_THREAD_KEYS_MAX = 74,
        _SC_THREAD_STACK_MIN = 75,
        _SC_THREAD_THREADS_MAX = 76,
        _SC_THREAD_ATTR_STACKADDR = 77,
        _SC_THREAD_ATTR_STACKSIZE = 78,
        _SC_THREAD_PRIORITY_SCHEDULING = 79,
        _SC_THREAD_PRIO_INHERIT = 80,
        _SC_THREAD_PRIO_PROTECT = 81,
        _SC_THREAD_PROCESS_SHARED = 82,
        _SC_NPROCESSORS_CONF = 83,
        _SC_NPROCESSORS_ONLN = 84,
        _SC_PHYS_PAGES = 85,
        _SC_AVPHYS_PAGES = 86,
        _SC_ATEXIT_MAX = 87,
        _SC_PASS_MAX = 88,
        _SC_XOPEN_VERSION = 89,
        _SC_XOPEN_XCU_VERSION = 90,
        _SC_XOPEN_UNIX = 91,
        _SC_XOPEN_CRYPT = 92,
        _SC_XOPEN_ENH_I18N = 93,
        _SC_XOPEN_SHM = 94,
        _SC_2_CHAR_TERM = 95,
        _SC_2_C_VERSION = 96,
        _SC_2_UPE = 97,
        _SC_XOPEN_XPG2 = 98,
        _SC_XOPEN_XPG3 = 99,
        _SC_XOPEN_XPG4 = 100,
        _SC_CHAR_BIT = 101,
        _SC_CHAR_MAX = 102,
        _SC_CHAR_MIN = 103,
        _SC_INT_MAX = 104,
        _SC_INT_MIN = 105,
        _SC_LONG_BIT = 106,
        _SC_WORD_BIT = 107,
        _SC_MB_LEN_MAX = 108,
        _SC_NZERO = 109,
        _SC_SSIZE_MAX = 110,
        _SC_SCHAR_MAX = 111,
        _SC_SCHAR_MIN = 112,
        _SC_SHRT_MAX = 113,
        _SC_SHRT_MIN = 114,
        _SC_UCHAR_MAX = 115,
        _SC_UINT_MAX = 116,
        _SC_ULONG_MAX = 117,
        _SC_USHRT_MAX = 118,
        _SC_NL_ARGMAX = 119,
        _SC_NL_LANGMAX = 120,
        _SC_NL_MSGMAX = 121,
        _SC_NL_NMAX = 122,
        _SC_NL_SETMAX = 123,
        _SC_NL_TEXTMAX = 124,
        _SC_XBS5_ILP32_OFF32 = 125,
        _SC_XBS5_ILP32_OFFBIG = 126,
        _SC_XBS5_LP64_OFF64 = 127,
        _SC_XBS5_LPBIG_OFFBIG = 128,
        _SC_XOPEN_LEGACY = 129,
        _SC_XOPEN_REALTIME = 130,
        _SC_XOPEN_REALTIME_THREADS = 131,
        _SC_ADVISORY_INFO = 132,
        _SC_BARRIERS = 133,
        _SC_BASE = 134,
        _SC_C_LANG_SUPPORT = 135,
        _SC_C_LANG_SUPPORT_R = 136,
        _SC_CLOCK_SELECTION = 137,
        _SC_CPUTIME = 138,
        _SC_THREAD_CPUTIME = 139,
        _SC_DEVICE_IO = 140,
        _SC_DEVICE_SPECIFIC = 141,
        _SC_DEVICE_SPECIFIC_R = 142,
        _SC_FD_MGMT = 143,
        _SC_FIFO = 144,
        _SC_PIPE = 145,
        _SC_FILE_ATTRIBUTES = 146,
        _SC_FILE_LOCKING = 147,
        _SC_FILE_SYSTEM = 148,
        _SC_MONOTONIC_CLOCK = 149,
        _SC_MULTI_PROCESS = 150,
        _SC_SINGLE_PROCESS = 151,
        _SC_NETWORKING = 152,
        _SC_READER_WRITER_LOCKS = 153,
        _SC_SPIN_LOCKS = 154,
        _SC_REGEXP = 155,
        _SC_REGEX_VERSION = 156,
        _SC_SHELL = 157,
        _SC_SIGNALS = 158,
        _SC_SPAWN = 159,
        _SC_SPORADIC_SERVER = 160,
        _SC_THREAD_SPORADIC_SERVER = 161,
        _SC_SYSTEM_DATABASE = 162,
        _SC_SYSTEM_DATABASE_R = 163,
        _SC_TIMEOUTS = 164,
        _SC_TYPED_MEMORY_OBJECTS = 165,
        _SC_USER_GROUPS = 166,
        _SC_USER_GROUPS_R = 167,
        _SC_2_PBS = 168,
        _SC_2_PBS_ACCOUNTING = 169,
        _SC_2_PBS_LOCATE = 170,
        _SC_2_PBS_MESSAGE = 171,
        _SC_2_PBS_TRACK = 172,
        _SC_SYMLOOP_MAX = 173,
        _SC_STREAMS = 174,
        _SC_2_PBS_CHECKPOINT = 175,
        _SC_V6_ILP32_OFF32 = 176,
        _SC_V6_ILP32_OFFBIG = 177,
        _SC_V6_LP64_OFF64 = 178,
        _SC_V6_LPBIG_OFFBIG = 179,
        _SC_HOST_NAME_MAX = 180,
        _SC_TRACE = 181,
        _SC_TRACE_EVENT_FILTER = 182,
        _SC_TRACE_INHERIT = 183,
        _SC_TRACE_LOG = 184,
        _SC_LEVEL1_ICACHE_SIZE = 185,
        _SC_LEVEL1_ICACHE_ASSOC = 186,
        _SC_LEVEL1_ICACHE_LINESIZE = 187,
        _SC_LEVEL1_DCACHE_SIZE = 188,
        _SC_LEVEL1_DCACHE_ASSOC = 189,
        _SC_LEVEL1_DCACHE_LINESIZE = 190,
        _SC_LEVEL2_CACHE_SIZE = 191,
        _SC_LEVEL2_CACHE_ASSOC = 192,
        _SC_LEVEL2_CACHE_LINESIZE = 193,
        _SC_LEVEL3_CACHE_SIZE = 194,
        _SC_LEVEL3_CACHE_ASSOC = 195,
        _SC_LEVEL3_CACHE_LINESIZE = 196,
        _SC_LEVEL4_CACHE_SIZE = 197,
        _SC_LEVEL4_CACHE_ASSOC = 198,
        _SC_LEVEL4_CACHE_LINESIZE = 199,
        _SC_IPV6 = 235,
        _SC_RAW_SOCKETS = 236,
        _SC_V7_ILP32_OFF32 = 237,
        _SC_V7_ILP32_OFFBIG = 238,
        _SC_V7_LP64_OFF64 = 239,
        _SC_V7_LPBIG_OFFBIG = 240,
        _SC_SS_REPL_MAX = 241,
        _SC_TRACE_EVENT_NAME_MAX = 242,
        _SC_TRACE_NAME_MAX = 243,
        _SC_TRACE_SYS_MAX = 244,
        _SC_TRACE_USER_EVENT_MAX = 245,
        _SC_XOPEN_STREAMS = 246,
        _SC_THREAD_ROBUST_PRIO_INHERIT = 247,
        _SC_THREAD_ROBUST_PRIO_PROTECT = 248,
    }
    enum _SC_ARG_MAX = _Anonymous_1._SC_ARG_MAX;
    enum _SC_CHILD_MAX = _Anonymous_1._SC_CHILD_MAX;
    enum _SC_CLK_TCK = _Anonymous_1._SC_CLK_TCK;
    enum _SC_NGROUPS_MAX = _Anonymous_1._SC_NGROUPS_MAX;
    enum _SC_OPEN_MAX = _Anonymous_1._SC_OPEN_MAX;
    enum _SC_STREAM_MAX = _Anonymous_1._SC_STREAM_MAX;
    enum _SC_TZNAME_MAX = _Anonymous_1._SC_TZNAME_MAX;
    enum _SC_JOB_CONTROL = _Anonymous_1._SC_JOB_CONTROL;
    enum _SC_SAVED_IDS = _Anonymous_1._SC_SAVED_IDS;
    enum _SC_REALTIME_SIGNALS = _Anonymous_1._SC_REALTIME_SIGNALS;
    enum _SC_PRIORITY_SCHEDULING = _Anonymous_1._SC_PRIORITY_SCHEDULING;
    enum _SC_TIMERS = _Anonymous_1._SC_TIMERS;
    enum _SC_ASYNCHRONOUS_IO = _Anonymous_1._SC_ASYNCHRONOUS_IO;
    enum _SC_PRIORITIZED_IO = _Anonymous_1._SC_PRIORITIZED_IO;
    enum _SC_SYNCHRONIZED_IO = _Anonymous_1._SC_SYNCHRONIZED_IO;
    enum _SC_FSYNC = _Anonymous_1._SC_FSYNC;
    enum _SC_MAPPED_FILES = _Anonymous_1._SC_MAPPED_FILES;
    enum _SC_MEMLOCK = _Anonymous_1._SC_MEMLOCK;
    enum _SC_MEMLOCK_RANGE = _Anonymous_1._SC_MEMLOCK_RANGE;
    enum _SC_MEMORY_PROTECTION = _Anonymous_1._SC_MEMORY_PROTECTION;
    enum _SC_MESSAGE_PASSING = _Anonymous_1._SC_MESSAGE_PASSING;
    enum _SC_SEMAPHORES = _Anonymous_1._SC_SEMAPHORES;
    enum _SC_SHARED_MEMORY_OBJECTS = _Anonymous_1._SC_SHARED_MEMORY_OBJECTS;
    enum _SC_AIO_LISTIO_MAX = _Anonymous_1._SC_AIO_LISTIO_MAX;
    enum _SC_AIO_MAX = _Anonymous_1._SC_AIO_MAX;
    enum _SC_AIO_PRIO_DELTA_MAX = _Anonymous_1._SC_AIO_PRIO_DELTA_MAX;
    enum _SC_DELAYTIMER_MAX = _Anonymous_1._SC_DELAYTIMER_MAX;
    enum _SC_MQ_OPEN_MAX = _Anonymous_1._SC_MQ_OPEN_MAX;
    enum _SC_MQ_PRIO_MAX = _Anonymous_1._SC_MQ_PRIO_MAX;
    enum _SC_VERSION = _Anonymous_1._SC_VERSION;
    enum _SC_PAGESIZE = _Anonymous_1._SC_PAGESIZE;
    enum _SC_RTSIG_MAX = _Anonymous_1._SC_RTSIG_MAX;
    enum _SC_SEM_NSEMS_MAX = _Anonymous_1._SC_SEM_NSEMS_MAX;
    enum _SC_SEM_VALUE_MAX = _Anonymous_1._SC_SEM_VALUE_MAX;
    enum _SC_SIGQUEUE_MAX = _Anonymous_1._SC_SIGQUEUE_MAX;
    enum _SC_TIMER_MAX = _Anonymous_1._SC_TIMER_MAX;
    enum _SC_BC_BASE_MAX = _Anonymous_1._SC_BC_BASE_MAX;
    enum _SC_BC_DIM_MAX = _Anonymous_1._SC_BC_DIM_MAX;
    enum _SC_BC_SCALE_MAX = _Anonymous_1._SC_BC_SCALE_MAX;
    enum _SC_BC_STRING_MAX = _Anonymous_1._SC_BC_STRING_MAX;
    enum _SC_COLL_WEIGHTS_MAX = _Anonymous_1._SC_COLL_WEIGHTS_MAX;
    enum _SC_EQUIV_CLASS_MAX = _Anonymous_1._SC_EQUIV_CLASS_MAX;
    enum _SC_EXPR_NEST_MAX = _Anonymous_1._SC_EXPR_NEST_MAX;
    enum _SC_LINE_MAX = _Anonymous_1._SC_LINE_MAX;
    enum _SC_RE_DUP_MAX = _Anonymous_1._SC_RE_DUP_MAX;
    enum _SC_CHARCLASS_NAME_MAX = _Anonymous_1._SC_CHARCLASS_NAME_MAX;
    enum _SC_2_VERSION = _Anonymous_1._SC_2_VERSION;
    enum _SC_2_C_BIND = _Anonymous_1._SC_2_C_BIND;
    enum _SC_2_C_DEV = _Anonymous_1._SC_2_C_DEV;
    enum _SC_2_FORT_DEV = _Anonymous_1._SC_2_FORT_DEV;
    enum _SC_2_FORT_RUN = _Anonymous_1._SC_2_FORT_RUN;
    enum _SC_2_SW_DEV = _Anonymous_1._SC_2_SW_DEV;
    enum _SC_2_LOCALEDEF = _Anonymous_1._SC_2_LOCALEDEF;
    enum _SC_PII = _Anonymous_1._SC_PII;
    enum _SC_PII_XTI = _Anonymous_1._SC_PII_XTI;
    enum _SC_PII_SOCKET = _Anonymous_1._SC_PII_SOCKET;
    enum _SC_PII_INTERNET = _Anonymous_1._SC_PII_INTERNET;
    enum _SC_PII_OSI = _Anonymous_1._SC_PII_OSI;
    enum _SC_POLL = _Anonymous_1._SC_POLL;
    enum _SC_SELECT = _Anonymous_1._SC_SELECT;
    enum _SC_UIO_MAXIOV = _Anonymous_1._SC_UIO_MAXIOV;
    enum _SC_IOV_MAX = _Anonymous_1._SC_IOV_MAX;
    enum _SC_PII_INTERNET_STREAM = _Anonymous_1._SC_PII_INTERNET_STREAM;
    enum _SC_PII_INTERNET_DGRAM = _Anonymous_1._SC_PII_INTERNET_DGRAM;
    enum _SC_PII_OSI_COTS = _Anonymous_1._SC_PII_OSI_COTS;
    enum _SC_PII_OSI_CLTS = _Anonymous_1._SC_PII_OSI_CLTS;
    enum _SC_PII_OSI_M = _Anonymous_1._SC_PII_OSI_M;
    enum _SC_T_IOV_MAX = _Anonymous_1._SC_T_IOV_MAX;
    enum _SC_THREADS = _Anonymous_1._SC_THREADS;
    enum _SC_THREAD_SAFE_FUNCTIONS = _Anonymous_1._SC_THREAD_SAFE_FUNCTIONS;
    enum _SC_GETGR_R_SIZE_MAX = _Anonymous_1._SC_GETGR_R_SIZE_MAX;
    enum _SC_GETPW_R_SIZE_MAX = _Anonymous_1._SC_GETPW_R_SIZE_MAX;
    enum _SC_LOGIN_NAME_MAX = _Anonymous_1._SC_LOGIN_NAME_MAX;
    enum _SC_TTY_NAME_MAX = _Anonymous_1._SC_TTY_NAME_MAX;
    enum _SC_THREAD_DESTRUCTOR_ITERATIONS = _Anonymous_1._SC_THREAD_DESTRUCTOR_ITERATIONS;
    enum _SC_THREAD_KEYS_MAX = _Anonymous_1._SC_THREAD_KEYS_MAX;
    enum _SC_THREAD_STACK_MIN = _Anonymous_1._SC_THREAD_STACK_MIN;
    enum _SC_THREAD_THREADS_MAX = _Anonymous_1._SC_THREAD_THREADS_MAX;
    enum _SC_THREAD_ATTR_STACKADDR = _Anonymous_1._SC_THREAD_ATTR_STACKADDR;
    enum _SC_THREAD_ATTR_STACKSIZE = _Anonymous_1._SC_THREAD_ATTR_STACKSIZE;
    enum _SC_THREAD_PRIORITY_SCHEDULING = _Anonymous_1._SC_THREAD_PRIORITY_SCHEDULING;
    enum _SC_THREAD_PRIO_INHERIT = _Anonymous_1._SC_THREAD_PRIO_INHERIT;
    enum _SC_THREAD_PRIO_PROTECT = _Anonymous_1._SC_THREAD_PRIO_PROTECT;
    enum _SC_THREAD_PROCESS_SHARED = _Anonymous_1._SC_THREAD_PROCESS_SHARED;
    enum _SC_NPROCESSORS_CONF = _Anonymous_1._SC_NPROCESSORS_CONF;
    enum _SC_NPROCESSORS_ONLN = _Anonymous_1._SC_NPROCESSORS_ONLN;
    enum _SC_PHYS_PAGES = _Anonymous_1._SC_PHYS_PAGES;
    enum _SC_AVPHYS_PAGES = _Anonymous_1._SC_AVPHYS_PAGES;
    enum _SC_ATEXIT_MAX = _Anonymous_1._SC_ATEXIT_MAX;
    enum _SC_PASS_MAX = _Anonymous_1._SC_PASS_MAX;
    enum _SC_XOPEN_VERSION = _Anonymous_1._SC_XOPEN_VERSION;
    enum _SC_XOPEN_XCU_VERSION = _Anonymous_1._SC_XOPEN_XCU_VERSION;
    enum _SC_XOPEN_UNIX = _Anonymous_1._SC_XOPEN_UNIX;
    enum _SC_XOPEN_CRYPT = _Anonymous_1._SC_XOPEN_CRYPT;
    enum _SC_XOPEN_ENH_I18N = _Anonymous_1._SC_XOPEN_ENH_I18N;
    enum _SC_XOPEN_SHM = _Anonymous_1._SC_XOPEN_SHM;
    enum _SC_2_CHAR_TERM = _Anonymous_1._SC_2_CHAR_TERM;
    enum _SC_2_C_VERSION = _Anonymous_1._SC_2_C_VERSION;
    enum _SC_2_UPE = _Anonymous_1._SC_2_UPE;
    enum _SC_XOPEN_XPG2 = _Anonymous_1._SC_XOPEN_XPG2;
    enum _SC_XOPEN_XPG3 = _Anonymous_1._SC_XOPEN_XPG3;
    enum _SC_XOPEN_XPG4 = _Anonymous_1._SC_XOPEN_XPG4;
    enum _SC_CHAR_BIT = _Anonymous_1._SC_CHAR_BIT;
    enum _SC_CHAR_MAX = _Anonymous_1._SC_CHAR_MAX;
    enum _SC_CHAR_MIN = _Anonymous_1._SC_CHAR_MIN;
    enum _SC_INT_MAX = _Anonymous_1._SC_INT_MAX;
    enum _SC_INT_MIN = _Anonymous_1._SC_INT_MIN;
    enum _SC_LONG_BIT = _Anonymous_1._SC_LONG_BIT;
    enum _SC_WORD_BIT = _Anonymous_1._SC_WORD_BIT;
    enum _SC_MB_LEN_MAX = _Anonymous_1._SC_MB_LEN_MAX;
    enum _SC_NZERO = _Anonymous_1._SC_NZERO;
    enum _SC_SSIZE_MAX = _Anonymous_1._SC_SSIZE_MAX;
    enum _SC_SCHAR_MAX = _Anonymous_1._SC_SCHAR_MAX;
    enum _SC_SCHAR_MIN = _Anonymous_1._SC_SCHAR_MIN;
    enum _SC_SHRT_MAX = _Anonymous_1._SC_SHRT_MAX;
    enum _SC_SHRT_MIN = _Anonymous_1._SC_SHRT_MIN;
    enum _SC_UCHAR_MAX = _Anonymous_1._SC_UCHAR_MAX;
    enum _SC_UINT_MAX = _Anonymous_1._SC_UINT_MAX;
    enum _SC_ULONG_MAX = _Anonymous_1._SC_ULONG_MAX;
    enum _SC_USHRT_MAX = _Anonymous_1._SC_USHRT_MAX;
    enum _SC_NL_ARGMAX = _Anonymous_1._SC_NL_ARGMAX;
    enum _SC_NL_LANGMAX = _Anonymous_1._SC_NL_LANGMAX;
    enum _SC_NL_MSGMAX = _Anonymous_1._SC_NL_MSGMAX;
    enum _SC_NL_NMAX = _Anonymous_1._SC_NL_NMAX;
    enum _SC_NL_SETMAX = _Anonymous_1._SC_NL_SETMAX;
    enum _SC_NL_TEXTMAX = _Anonymous_1._SC_NL_TEXTMAX;
    enum _SC_XBS5_ILP32_OFF32 = _Anonymous_1._SC_XBS5_ILP32_OFF32;
    enum _SC_XBS5_ILP32_OFFBIG = _Anonymous_1._SC_XBS5_ILP32_OFFBIG;
    enum _SC_XBS5_LP64_OFF64 = _Anonymous_1._SC_XBS5_LP64_OFF64;
    enum _SC_XBS5_LPBIG_OFFBIG = _Anonymous_1._SC_XBS5_LPBIG_OFFBIG;
    enum _SC_XOPEN_LEGACY = _Anonymous_1._SC_XOPEN_LEGACY;
    enum _SC_XOPEN_REALTIME = _Anonymous_1._SC_XOPEN_REALTIME;
    enum _SC_XOPEN_REALTIME_THREADS = _Anonymous_1._SC_XOPEN_REALTIME_THREADS;
    enum _SC_ADVISORY_INFO = _Anonymous_1._SC_ADVISORY_INFO;
    enum _SC_BARRIERS = _Anonymous_1._SC_BARRIERS;
    enum _SC_BASE = _Anonymous_1._SC_BASE;
    enum _SC_C_LANG_SUPPORT = _Anonymous_1._SC_C_LANG_SUPPORT;
    enum _SC_C_LANG_SUPPORT_R = _Anonymous_1._SC_C_LANG_SUPPORT_R;
    enum _SC_CLOCK_SELECTION = _Anonymous_1._SC_CLOCK_SELECTION;
    enum _SC_CPUTIME = _Anonymous_1._SC_CPUTIME;
    enum _SC_THREAD_CPUTIME = _Anonymous_1._SC_THREAD_CPUTIME;
    enum _SC_DEVICE_IO = _Anonymous_1._SC_DEVICE_IO;
    enum _SC_DEVICE_SPECIFIC = _Anonymous_1._SC_DEVICE_SPECIFIC;
    enum _SC_DEVICE_SPECIFIC_R = _Anonymous_1._SC_DEVICE_SPECIFIC_R;
    enum _SC_FD_MGMT = _Anonymous_1._SC_FD_MGMT;
    enum _SC_FIFO = _Anonymous_1._SC_FIFO;
    enum _SC_PIPE = _Anonymous_1._SC_PIPE;
    enum _SC_FILE_ATTRIBUTES = _Anonymous_1._SC_FILE_ATTRIBUTES;
    enum _SC_FILE_LOCKING = _Anonymous_1._SC_FILE_LOCKING;
    enum _SC_FILE_SYSTEM = _Anonymous_1._SC_FILE_SYSTEM;
    enum _SC_MONOTONIC_CLOCK = _Anonymous_1._SC_MONOTONIC_CLOCK;
    enum _SC_MULTI_PROCESS = _Anonymous_1._SC_MULTI_PROCESS;
    enum _SC_SINGLE_PROCESS = _Anonymous_1._SC_SINGLE_PROCESS;
    enum _SC_NETWORKING = _Anonymous_1._SC_NETWORKING;
    enum _SC_READER_WRITER_LOCKS = _Anonymous_1._SC_READER_WRITER_LOCKS;
    enum _SC_SPIN_LOCKS = _Anonymous_1._SC_SPIN_LOCKS;
    enum _SC_REGEXP = _Anonymous_1._SC_REGEXP;
    enum _SC_REGEX_VERSION = _Anonymous_1._SC_REGEX_VERSION;
    enum _SC_SHELL = _Anonymous_1._SC_SHELL;
    enum _SC_SIGNALS = _Anonymous_1._SC_SIGNALS;
    enum _SC_SPAWN = _Anonymous_1._SC_SPAWN;
    enum _SC_SPORADIC_SERVER = _Anonymous_1._SC_SPORADIC_SERVER;
    enum _SC_THREAD_SPORADIC_SERVER = _Anonymous_1._SC_THREAD_SPORADIC_SERVER;
    enum _SC_SYSTEM_DATABASE = _Anonymous_1._SC_SYSTEM_DATABASE;
    enum _SC_SYSTEM_DATABASE_R = _Anonymous_1._SC_SYSTEM_DATABASE_R;
    enum _SC_TIMEOUTS = _Anonymous_1._SC_TIMEOUTS;
    enum _SC_TYPED_MEMORY_OBJECTS = _Anonymous_1._SC_TYPED_MEMORY_OBJECTS;
    enum _SC_USER_GROUPS = _Anonymous_1._SC_USER_GROUPS;
    enum _SC_USER_GROUPS_R = _Anonymous_1._SC_USER_GROUPS_R;
    enum _SC_2_PBS = _Anonymous_1._SC_2_PBS;
    enum _SC_2_PBS_ACCOUNTING = _Anonymous_1._SC_2_PBS_ACCOUNTING;
    enum _SC_2_PBS_LOCATE = _Anonymous_1._SC_2_PBS_LOCATE;
    enum _SC_2_PBS_MESSAGE = _Anonymous_1._SC_2_PBS_MESSAGE;
    enum _SC_2_PBS_TRACK = _Anonymous_1._SC_2_PBS_TRACK;
    enum _SC_SYMLOOP_MAX = _Anonymous_1._SC_SYMLOOP_MAX;
    enum _SC_STREAMS = _Anonymous_1._SC_STREAMS;
    enum _SC_2_PBS_CHECKPOINT = _Anonymous_1._SC_2_PBS_CHECKPOINT;
    enum _SC_V6_ILP32_OFF32 = _Anonymous_1._SC_V6_ILP32_OFF32;
    enum _SC_V6_ILP32_OFFBIG = _Anonymous_1._SC_V6_ILP32_OFFBIG;
    enum _SC_V6_LP64_OFF64 = _Anonymous_1._SC_V6_LP64_OFF64;
    enum _SC_V6_LPBIG_OFFBIG = _Anonymous_1._SC_V6_LPBIG_OFFBIG;
    enum _SC_HOST_NAME_MAX = _Anonymous_1._SC_HOST_NAME_MAX;
    enum _SC_TRACE = _Anonymous_1._SC_TRACE;
    enum _SC_TRACE_EVENT_FILTER = _Anonymous_1._SC_TRACE_EVENT_FILTER;
    enum _SC_TRACE_INHERIT = _Anonymous_1._SC_TRACE_INHERIT;
    enum _SC_TRACE_LOG = _Anonymous_1._SC_TRACE_LOG;
    enum _SC_LEVEL1_ICACHE_SIZE = _Anonymous_1._SC_LEVEL1_ICACHE_SIZE;
    enum _SC_LEVEL1_ICACHE_ASSOC = _Anonymous_1._SC_LEVEL1_ICACHE_ASSOC;
    enum _SC_LEVEL1_ICACHE_LINESIZE = _Anonymous_1._SC_LEVEL1_ICACHE_LINESIZE;
    enum _SC_LEVEL1_DCACHE_SIZE = _Anonymous_1._SC_LEVEL1_DCACHE_SIZE;
    enum _SC_LEVEL1_DCACHE_ASSOC = _Anonymous_1._SC_LEVEL1_DCACHE_ASSOC;
    enum _SC_LEVEL1_DCACHE_LINESIZE = _Anonymous_1._SC_LEVEL1_DCACHE_LINESIZE;
    enum _SC_LEVEL2_CACHE_SIZE = _Anonymous_1._SC_LEVEL2_CACHE_SIZE;
    enum _SC_LEVEL2_CACHE_ASSOC = _Anonymous_1._SC_LEVEL2_CACHE_ASSOC;
    enum _SC_LEVEL2_CACHE_LINESIZE = _Anonymous_1._SC_LEVEL2_CACHE_LINESIZE;
    enum _SC_LEVEL3_CACHE_SIZE = _Anonymous_1._SC_LEVEL3_CACHE_SIZE;
    enum _SC_LEVEL3_CACHE_ASSOC = _Anonymous_1._SC_LEVEL3_CACHE_ASSOC;
    enum _SC_LEVEL3_CACHE_LINESIZE = _Anonymous_1._SC_LEVEL3_CACHE_LINESIZE;
    enum _SC_LEVEL4_CACHE_SIZE = _Anonymous_1._SC_LEVEL4_CACHE_SIZE;
    enum _SC_LEVEL4_CACHE_ASSOC = _Anonymous_1._SC_LEVEL4_CACHE_ASSOC;
    enum _SC_LEVEL4_CACHE_LINESIZE = _Anonymous_1._SC_LEVEL4_CACHE_LINESIZE;
    enum _SC_IPV6 = _Anonymous_1._SC_IPV6;
    enum _SC_RAW_SOCKETS = _Anonymous_1._SC_RAW_SOCKETS;
    enum _SC_V7_ILP32_OFF32 = _Anonymous_1._SC_V7_ILP32_OFF32;
    enum _SC_V7_ILP32_OFFBIG = _Anonymous_1._SC_V7_ILP32_OFFBIG;
    enum _SC_V7_LP64_OFF64 = _Anonymous_1._SC_V7_LP64_OFF64;
    enum _SC_V7_LPBIG_OFFBIG = _Anonymous_1._SC_V7_LPBIG_OFFBIG;
    enum _SC_SS_REPL_MAX = _Anonymous_1._SC_SS_REPL_MAX;
    enum _SC_TRACE_EVENT_NAME_MAX = _Anonymous_1._SC_TRACE_EVENT_NAME_MAX;
    enum _SC_TRACE_NAME_MAX = _Anonymous_1._SC_TRACE_NAME_MAX;
    enum _SC_TRACE_SYS_MAX = _Anonymous_1._SC_TRACE_SYS_MAX;
    enum _SC_TRACE_USER_EVENT_MAX = _Anonymous_1._SC_TRACE_USER_EVENT_MAX;
    enum _SC_XOPEN_STREAMS = _Anonymous_1._SC_XOPEN_STREAMS;
    enum _SC_THREAD_ROBUST_PRIO_INHERIT = _Anonymous_1._SC_THREAD_ROBUST_PRIO_INHERIT;
    enum _SC_THREAD_ROBUST_PRIO_PROTECT = _Anonymous_1._SC_THREAD_ROBUST_PRIO_PROTECT;
    int pselect(int, fd_set*, fd_set*, fd_set*, const(timespec)*, const(__sigset_t)*) @nogc nothrow;
    int select(int, fd_set*, fd_set*, fd_set*, timeval*) @nogc nothrow;
    alias fd_mask = c_long;
    struct fd_set
    {
        c_long[16] __fds_bits;
    }
    alias __fd_mask = c_long;
    alias suseconds_t = c_long;
    int strncasecmp_l(const(char)*, const(char)*, c_ulong, __locale_struct*) @nogc nothrow;
    int strcasecmp_l(const(char)*, const(char)*, __locale_struct*) @nogc nothrow;
    int strncasecmp(const(char)*, const(char)*, c_ulong) @nogc nothrow;
    int strcasecmp(const(char)*, const(char)*) @nogc nothrow;
    int ffsll(long) @nogc nothrow;
    int ffsl(c_long) @nogc nothrow;
    int ffs(int) @nogc nothrow;
    char* rindex(const(char)*, int) @nogc nothrow;
    char* index(const(char)*, int) @nogc nothrow;
    void bzero(void*, c_ulong) @nogc nothrow;
    void bcopy(const(void)*, void*, c_ulong) @nogc nothrow;
    int bcmp(const(void)*, const(void)*, c_ulong) @nogc nothrow;
    char* stpncpy(char*, const(char)*, c_ulong) @nogc nothrow;
    char* __stpncpy(char*, const(char)*, c_ulong) @nogc nothrow;
    char* stpcpy(char*, const(char)*) @nogc nothrow;
    char* __stpcpy(char*, const(char)*) @nogc nothrow;
    char* strsignal(int) @nogc nothrow;
    char* strsep(char**, const(char)*) @nogc nothrow;
    void explicit_bzero(void*, c_ulong) @nogc nothrow;
    char* strerror_l(int, __locale_struct*) @nogc nothrow;
    int strerror_r(int, char*, c_ulong) @nogc nothrow;
    char* strerror(int) @nogc nothrow;
    c_ulong strnlen(const(char)*, c_ulong) @nogc nothrow;
    c_ulong strlen(const(char)*) @nogc nothrow;
    char* strtok_r(char*, const(char)*, char**) @nogc nothrow;
    char* __strtok_r(char*, const(char)*, char**) @nogc nothrow;
    char* strtok(char*, const(char)*) @nogc nothrow;
    char* strstr(const(char)*, const(char)*) @nogc nothrow;
    char* strpbrk(const(char)*, const(char)*) @nogc nothrow;
    c_ulong strspn(const(char)*, const(char)*) @nogc nothrow;
    c_ulong strcspn(const(char)*, const(char)*) @nogc nothrow;
    char* strrchr(const(char)*, int) @nogc nothrow;
    enum _Anonymous_2
    {
        _CS_PATH = 0,
        _CS_V6_WIDTH_RESTRICTED_ENVS = 1,
        _CS_GNU_LIBC_VERSION = 2,
        _CS_GNU_LIBPTHREAD_VERSION = 3,
        _CS_V5_WIDTH_RESTRICTED_ENVS = 4,
        _CS_V7_WIDTH_RESTRICTED_ENVS = 5,
        _CS_LFS_CFLAGS = 1000,
        _CS_LFS_LDFLAGS = 1001,
        _CS_LFS_LIBS = 1002,
        _CS_LFS_LINTFLAGS = 1003,
        _CS_LFS64_CFLAGS = 1004,
        _CS_LFS64_LDFLAGS = 1005,
        _CS_LFS64_LIBS = 1006,
        _CS_LFS64_LINTFLAGS = 1007,
        _CS_XBS5_ILP32_OFF32_CFLAGS = 1100,
        _CS_XBS5_ILP32_OFF32_LDFLAGS = 1101,
        _CS_XBS5_ILP32_OFF32_LIBS = 1102,
        _CS_XBS5_ILP32_OFF32_LINTFLAGS = 1103,
        _CS_XBS5_ILP32_OFFBIG_CFLAGS = 1104,
        _CS_XBS5_ILP32_OFFBIG_LDFLAGS = 1105,
        _CS_XBS5_ILP32_OFFBIG_LIBS = 1106,
        _CS_XBS5_ILP32_OFFBIG_LINTFLAGS = 1107,
        _CS_XBS5_LP64_OFF64_CFLAGS = 1108,
        _CS_XBS5_LP64_OFF64_LDFLAGS = 1109,
        _CS_XBS5_LP64_OFF64_LIBS = 1110,
        _CS_XBS5_LP64_OFF64_LINTFLAGS = 1111,
        _CS_XBS5_LPBIG_OFFBIG_CFLAGS = 1112,
        _CS_XBS5_LPBIG_OFFBIG_LDFLAGS = 1113,
        _CS_XBS5_LPBIG_OFFBIG_LIBS = 1114,
        _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS = 1115,
        _CS_POSIX_V6_ILP32_OFF32_CFLAGS = 1116,
        _CS_POSIX_V6_ILP32_OFF32_LDFLAGS = 1117,
        _CS_POSIX_V6_ILP32_OFF32_LIBS = 1118,
        _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS = 1119,
        _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS = 1120,
        _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS = 1121,
        _CS_POSIX_V6_ILP32_OFFBIG_LIBS = 1122,
        _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS = 1123,
        _CS_POSIX_V6_LP64_OFF64_CFLAGS = 1124,
        _CS_POSIX_V6_LP64_OFF64_LDFLAGS = 1125,
        _CS_POSIX_V6_LP64_OFF64_LIBS = 1126,
        _CS_POSIX_V6_LP64_OFF64_LINTFLAGS = 1127,
        _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS = 1128,
        _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS = 1129,
        _CS_POSIX_V6_LPBIG_OFFBIG_LIBS = 1130,
        _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS = 1131,
        _CS_POSIX_V7_ILP32_OFF32_CFLAGS = 1132,
        _CS_POSIX_V7_ILP32_OFF32_LDFLAGS = 1133,
        _CS_POSIX_V7_ILP32_OFF32_LIBS = 1134,
        _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS = 1135,
        _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS = 1136,
        _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS = 1137,
        _CS_POSIX_V7_ILP32_OFFBIG_LIBS = 1138,
        _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS = 1139,
        _CS_POSIX_V7_LP64_OFF64_CFLAGS = 1140,
        _CS_POSIX_V7_LP64_OFF64_LDFLAGS = 1141,
        _CS_POSIX_V7_LP64_OFF64_LIBS = 1142,
        _CS_POSIX_V7_LP64_OFF64_LINTFLAGS = 1143,
        _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS = 1144,
        _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS = 1145,
        _CS_POSIX_V7_LPBIG_OFFBIG_LIBS = 1146,
        _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS = 1147,
        _CS_V6_ENV = 1148,
        _CS_V7_ENV = 1149,
    }
    enum _CS_PATH = _Anonymous_2._CS_PATH;
    enum _CS_V6_WIDTH_RESTRICTED_ENVS = _Anonymous_2._CS_V6_WIDTH_RESTRICTED_ENVS;
    enum _CS_GNU_LIBC_VERSION = _Anonymous_2._CS_GNU_LIBC_VERSION;
    enum _CS_GNU_LIBPTHREAD_VERSION = _Anonymous_2._CS_GNU_LIBPTHREAD_VERSION;
    enum _CS_V5_WIDTH_RESTRICTED_ENVS = _Anonymous_2._CS_V5_WIDTH_RESTRICTED_ENVS;
    enum _CS_V7_WIDTH_RESTRICTED_ENVS = _Anonymous_2._CS_V7_WIDTH_RESTRICTED_ENVS;
    enum _CS_LFS_CFLAGS = _Anonymous_2._CS_LFS_CFLAGS;
    enum _CS_LFS_LDFLAGS = _Anonymous_2._CS_LFS_LDFLAGS;
    enum _CS_LFS_LIBS = _Anonymous_2._CS_LFS_LIBS;
    enum _CS_LFS_LINTFLAGS = _Anonymous_2._CS_LFS_LINTFLAGS;
    enum _CS_LFS64_CFLAGS = _Anonymous_2._CS_LFS64_CFLAGS;
    enum _CS_LFS64_LDFLAGS = _Anonymous_2._CS_LFS64_LDFLAGS;
    enum _CS_LFS64_LIBS = _Anonymous_2._CS_LFS64_LIBS;
    enum _CS_LFS64_LINTFLAGS = _Anonymous_2._CS_LFS64_LINTFLAGS;
    enum _CS_XBS5_ILP32_OFF32_CFLAGS = _Anonymous_2._CS_XBS5_ILP32_OFF32_CFLAGS;
    enum _CS_XBS5_ILP32_OFF32_LDFLAGS = _Anonymous_2._CS_XBS5_ILP32_OFF32_LDFLAGS;
    enum _CS_XBS5_ILP32_OFF32_LIBS = _Anonymous_2._CS_XBS5_ILP32_OFF32_LIBS;
    enum _CS_XBS5_ILP32_OFF32_LINTFLAGS = _Anonymous_2._CS_XBS5_ILP32_OFF32_LINTFLAGS;
    enum _CS_XBS5_ILP32_OFFBIG_CFLAGS = _Anonymous_2._CS_XBS5_ILP32_OFFBIG_CFLAGS;
    enum _CS_XBS5_ILP32_OFFBIG_LDFLAGS = _Anonymous_2._CS_XBS5_ILP32_OFFBIG_LDFLAGS;
    enum _CS_XBS5_ILP32_OFFBIG_LIBS = _Anonymous_2._CS_XBS5_ILP32_OFFBIG_LIBS;
    enum _CS_XBS5_ILP32_OFFBIG_LINTFLAGS = _Anonymous_2._CS_XBS5_ILP32_OFFBIG_LINTFLAGS;
    enum _CS_XBS5_LP64_OFF64_CFLAGS = _Anonymous_2._CS_XBS5_LP64_OFF64_CFLAGS;
    enum _CS_XBS5_LP64_OFF64_LDFLAGS = _Anonymous_2._CS_XBS5_LP64_OFF64_LDFLAGS;
    enum _CS_XBS5_LP64_OFF64_LIBS = _Anonymous_2._CS_XBS5_LP64_OFF64_LIBS;
    enum _CS_XBS5_LP64_OFF64_LINTFLAGS = _Anonymous_2._CS_XBS5_LP64_OFF64_LINTFLAGS;
    enum _CS_XBS5_LPBIG_OFFBIG_CFLAGS = _Anonymous_2._CS_XBS5_LPBIG_OFFBIG_CFLAGS;
    enum _CS_XBS5_LPBIG_OFFBIG_LDFLAGS = _Anonymous_2._CS_XBS5_LPBIG_OFFBIG_LDFLAGS;
    enum _CS_XBS5_LPBIG_OFFBIG_LIBS = _Anonymous_2._CS_XBS5_LPBIG_OFFBIG_LIBS;
    enum _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS = _Anonymous_2._CS_XBS5_LPBIG_OFFBIG_LINTFLAGS;
    enum _CS_POSIX_V6_ILP32_OFF32_CFLAGS = _Anonymous_2._CS_POSIX_V6_ILP32_OFF32_CFLAGS;
    enum _CS_POSIX_V6_ILP32_OFF32_LDFLAGS = _Anonymous_2._CS_POSIX_V6_ILP32_OFF32_LDFLAGS;
    enum _CS_POSIX_V6_ILP32_OFF32_LIBS = _Anonymous_2._CS_POSIX_V6_ILP32_OFF32_LIBS;
    enum _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS = _Anonymous_2._CS_POSIX_V6_ILP32_OFF32_LINTFLAGS;
    enum _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS = _Anonymous_2._CS_POSIX_V6_ILP32_OFFBIG_CFLAGS;
    enum _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS = _Anonymous_2._CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS;
    enum _CS_POSIX_V6_ILP32_OFFBIG_LIBS = _Anonymous_2._CS_POSIX_V6_ILP32_OFFBIG_LIBS;
    enum _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS = _Anonymous_2._CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS;
    enum _CS_POSIX_V6_LP64_OFF64_CFLAGS = _Anonymous_2._CS_POSIX_V6_LP64_OFF64_CFLAGS;
    enum _CS_POSIX_V6_LP64_OFF64_LDFLAGS = _Anonymous_2._CS_POSIX_V6_LP64_OFF64_LDFLAGS;
    enum _CS_POSIX_V6_LP64_OFF64_LIBS = _Anonymous_2._CS_POSIX_V6_LP64_OFF64_LIBS;
    enum _CS_POSIX_V6_LP64_OFF64_LINTFLAGS = _Anonymous_2._CS_POSIX_V6_LP64_OFF64_LINTFLAGS;
    enum _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS = _Anonymous_2._CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS;
    enum _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS = _Anonymous_2._CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS;
    enum _CS_POSIX_V6_LPBIG_OFFBIG_LIBS = _Anonymous_2._CS_POSIX_V6_LPBIG_OFFBIG_LIBS;
    enum _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS = _Anonymous_2._CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS;
    enum _CS_POSIX_V7_ILP32_OFF32_CFLAGS = _Anonymous_2._CS_POSIX_V7_ILP32_OFF32_CFLAGS;
    enum _CS_POSIX_V7_ILP32_OFF32_LDFLAGS = _Anonymous_2._CS_POSIX_V7_ILP32_OFF32_LDFLAGS;
    enum _CS_POSIX_V7_ILP32_OFF32_LIBS = _Anonymous_2._CS_POSIX_V7_ILP32_OFF32_LIBS;
    enum _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS = _Anonymous_2._CS_POSIX_V7_ILP32_OFF32_LINTFLAGS;
    enum _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS = _Anonymous_2._CS_POSIX_V7_ILP32_OFFBIG_CFLAGS;
    enum _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS = _Anonymous_2._CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS;
    enum _CS_POSIX_V7_ILP32_OFFBIG_LIBS = _Anonymous_2._CS_POSIX_V7_ILP32_OFFBIG_LIBS;
    enum _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS = _Anonymous_2._CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS;
    enum _CS_POSIX_V7_LP64_OFF64_CFLAGS = _Anonymous_2._CS_POSIX_V7_LP64_OFF64_CFLAGS;
    enum _CS_POSIX_V7_LP64_OFF64_LDFLAGS = _Anonymous_2._CS_POSIX_V7_LP64_OFF64_LDFLAGS;
    enum _CS_POSIX_V7_LP64_OFF64_LIBS = _Anonymous_2._CS_POSIX_V7_LP64_OFF64_LIBS;
    enum _CS_POSIX_V7_LP64_OFF64_LINTFLAGS = _Anonymous_2._CS_POSIX_V7_LP64_OFF64_LINTFLAGS;
    enum _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS = _Anonymous_2._CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS;
    enum _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS = _Anonymous_2._CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS;
    enum _CS_POSIX_V7_LPBIG_OFFBIG_LIBS = _Anonymous_2._CS_POSIX_V7_LPBIG_OFFBIG_LIBS;
    enum _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS = _Anonymous_2._CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS;
    enum _CS_V6_ENV = _Anonymous_2._CS_V6_ENV;
    enum _CS_V7_ENV = _Anonymous_2._CS_V7_ENV;
    char* strchr(const(char)*, int) @nogc nothrow;
    char* strndup(const(char)*, c_ulong) @nogc nothrow;
    char* strdup(const(char)*) @nogc nothrow;
    c_ulong strxfrm_l(char*, const(char)*, c_ulong, __locale_struct*) @nogc nothrow;
    int strcoll_l(const(char)*, const(char)*, __locale_struct*) @nogc nothrow;
    c_ulong strxfrm(char*, const(char)*, c_ulong) @nogc nothrow;
    int strcoll(const(char)*, const(char)*) @nogc nothrow;
    int strncmp(const(char)*, const(char)*, c_ulong) @nogc nothrow;
    int strcmp(const(char)*, const(char)*) @nogc nothrow;
    char* strncat(char*, const(char)*, c_ulong) @nogc nothrow;
    char* strcat(char*, const(char)*) @nogc nothrow;
    char* strncpy(char*, const(char)*, c_ulong) @nogc nothrow;
    char* strcpy(char*, const(char)*) @nogc nothrow;
    void* memchr(const(void)*, int, c_ulong) @nogc nothrow;
    int memcmp(const(void)*, const(void)*, c_ulong) @nogc nothrow;
    void* memset(void*, int, c_ulong) @nogc nothrow;
    void* memccpy(void*, const(void)*, int, c_ulong) @nogc nothrow;
    void* memmove(void*, const(void)*, c_ulong) @nogc nothrow;
    void* memcpy(void*, const(void)*, c_ulong) @nogc nothrow;
    int getloadavg(double*, int) @nogc nothrow;
    int getsubopt(char**, char**, char**) @nogc nothrow;
    int rpmatch(const(char)*) @nogc nothrow;
    c_ulong wcstombs(char*, const(int)*, c_ulong) @nogc nothrow;
    c_ulong mbstowcs(int*, const(char)*, c_ulong) @nogc nothrow;
    int wctomb(char*, int) @nogc nothrow;
    alias _Float32 = float;
    int mbtowc(int*, const(char)*, c_ulong) @nogc nothrow;
    int mblen(const(char)*, c_ulong) @nogc nothrow;
    alias _Float64 = double;
    int qfcvt_r(real, int, int*, int*, char*, c_ulong) @nogc nothrow;
    alias _Float32x = double;
    int qecvt_r(real, int, int*, int*, char*, c_ulong) @nogc nothrow;
    int fcvt_r(double, int, int*, int*, char*, c_ulong) @nogc nothrow;
    alias _Float64x = real;
    int ecvt_r(double, int, int*, int*, char*, c_ulong) @nogc nothrow;
    char* qgcvt(real, int, char*) @nogc nothrow;
    extern __gshared char* optarg;
    extern __gshared int optind;
    extern __gshared int opterr;
    extern __gshared int optopt;
    int getopt(int, char**, const(char)*) @nogc nothrow;
    char* qfcvt(real, int, int*, int*) @nogc nothrow;
    char* qecvt(real, int, int*, int*) @nogc nothrow;
    char* gcvt(double, int, char*) @nogc nothrow;
    char* fcvt(double, int, int*, int*) @nogc nothrow;
    char* ecvt(double, int, int*, int*) @nogc nothrow;
    lldiv_t lldiv(long, long) @nogc nothrow;
    ldiv_t ldiv(c_long, c_long) @nogc nothrow;
    div_t div(int, int) @nogc nothrow;
    long llabs(long) @nogc nothrow;
    c_long labs(c_long) @nogc nothrow;
    int abs(int) @nogc nothrow;
    void qsort(void*, c_ulong, c_ulong, int function(const(void)*, const(void)*)) @nogc nothrow;
    void* bsearch(const(void)*, const(void)*, c_ulong, c_ulong, int function(const(void)*, const(void)*)) @nogc nothrow;
    alias __compar_fn_t = int function(const(void)*, const(void)*);
    char* realpath(const(char)*, char*) @nogc nothrow;
    int system(const(char)*) @nogc nothrow;
    char* mkdtemp(char*) @nogc nothrow;
    int mkstemps(char*, int) @nogc nothrow;
    int mkstemp(char*) @nogc nothrow;
    char* mktemp(char*) @nogc nothrow;
    int clearenv() @nogc nothrow;
    int unsetenv(const(char)*) @nogc nothrow;
    int setenv(const(char)*, const(char)*, int) @nogc nothrow;
    int putenv(char*) @nogc nothrow;
    char* getenv(const(char)*) @nogc nothrow;
    void _Exit(int) @nogc nothrow;
    void quick_exit(int) @nogc nothrow;
    void exit(int) @nogc nothrow;
    int on_exit(void function(int, void*), void*) @nogc nothrow;
    int at_quick_exit(void function()) @nogc nothrow;
    int atexit(void function()) @nogc nothrow;
    void abort() @nogc nothrow;
    void* aligned_alloc(c_ulong, c_ulong) @nogc nothrow;
    int posix_memalign(void**, c_ulong, c_ulong) @nogc nothrow;
    void* valloc(c_ulong) @nogc nothrow;
    void free(void*) @nogc nothrow;
    void* reallocarray(void*, c_ulong, c_ulong) @nogc nothrow;
    void* realloc(void*, c_ulong) @nogc nothrow;
    void* calloc(c_ulong, c_ulong) @nogc nothrow;
    void* malloc(c_ulong) @nogc nothrow;
    int lcong48_r(ushort*, drand48_data*) @nogc nothrow;
    int seed48_r(ushort*, drand48_data*) @nogc nothrow;
    int srand48_r(c_long, drand48_data*) @nogc nothrow;
    int jrand48_r(ushort*, drand48_data*, c_long*) @nogc nothrow;
    int mrand48_r(drand48_data*, c_long*) @nogc nothrow;
    int nrand48_r(ushort*, drand48_data*, c_long*) @nogc nothrow;
    struct __pthread_rwlock_arch_t
    {
        uint __readers;
        uint __writers;
        uint __wrphase_futex;
        uint __writers_futex;
        uint __pad3;
        uint __pad4;
        int __cur_writer;
        int __shared;
        byte __rwelision;
        ubyte[7] __pad1;
        c_ulong __pad2;
        uint __flags;
    }
    int lrand48_r(drand48_data*, c_long*) @nogc nothrow;
    alias pthread_t = c_ulong;
    union pthread_mutexattr_t
    {
        char[4] __size;
        int __align;
    }
    union pthread_condattr_t
    {
        char[4] __size;
        int __align;
    }
    alias pthread_key_t = uint;
    alias pthread_once_t = int;
    union pthread_attr_t
    {
        char[56] __size;
        c_long __align;
    }
    union pthread_mutex_t
    {
        __pthread_mutex_s __data;
        char[40] __size;
        c_long __align;
    }
    union pthread_cond_t
    {
        __pthread_cond_s __data;
        char[48] __size;
        long __align;
    }
    union pthread_rwlock_t
    {
        __pthread_rwlock_arch_t __data;
        char[56] __size;
        c_long __align;
    }
    union pthread_rwlockattr_t
    {
        char[8] __size;
        c_long __align;
    }
    alias pthread_spinlock_t = int;
    union pthread_barrier_t
    {
        char[32] __size;
        c_long __align;
    }
    union pthread_barrierattr_t
    {
        char[4] __size;
        int __align;
    }
    int erand48_r(ushort*, drand48_data*, double*) @nogc nothrow;
    int drand48_r(drand48_data*, double*) @nogc nothrow;
    struct drand48_data
    {
        ushort[3] __x;
        ushort[3] __old_x;
        ushort __c;
        ushort __init;
        ulong __a;
    }
    alias int8_t = byte;
    alias int16_t = short;
    alias int32_t = int;
    alias int64_t = c_long;
    alias uint8_t = ubyte;
    alias uint16_t = ushort;
    alias uint32_t = uint;
    alias uint64_t = ulong;
    void lcong48(ushort*) @nogc nothrow;
    ushort* seed48(ushort*) @nogc nothrow;
    extern __gshared int sys_nerr;
    extern __gshared const(const(char)*)[0] sys_errlist;
    void srand48(c_long) @nogc nothrow;
    alias __pthread_list_t = __pthread_internal_list;
    struct __pthread_internal_list
    {
        __pthread_internal_list* __prev;
        __pthread_internal_list* __next;
    }
    struct __pthread_mutex_s
    {
        int __lock;
        uint __count;
        int __owner;
        uint __nusers;
        int __kind;
        short __spins;
        short __elision;
        __pthread_internal_list __list;
    }
    c_long jrand48(ushort*) @nogc nothrow;
    struct __pthread_cond_s
    {
        static union _Anonymous_3
        {
            ulong __wseq;
            static struct _Anonymous_4
            {
                uint __low;
                uint __high;
            }
            _Anonymous_4 __wseq32;
        }
        _Anonymous_3 _anonymous_5;
        auto __wseq() @property @nogc pure nothrow { return _anonymous_5.__wseq; }
        void __wseq(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_5.__wseq = val; }
        auto __wseq32() @property @nogc pure nothrow { return _anonymous_5.__wseq32; }
        void __wseq32(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_5.__wseq32 = val; }
        static union _Anonymous_6
        {
            ulong __g1_start;
            static struct _Anonymous_7
            {
                uint __low;
                uint __high;
            }
            _Anonymous_7 __g1_start32;
        }
        _Anonymous_6 _anonymous_8;
        auto __g1_start() @property @nogc pure nothrow { return _anonymous_8.__g1_start; }
        void __g1_start(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_8.__g1_start = val; }
        auto __g1_start32() @property @nogc pure nothrow { return _anonymous_8.__g1_start32; }
        void __g1_start32(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_8.__g1_start32 = val; }
        uint[2] __g_refs;
        uint[2] __g_size;
        uint __g1_orig_size;
        uint __wrefs;
        uint[2] __g_signals;
    }
    c_long mrand48() @nogc nothrow;
    alias __u_char = ubyte;
    alias __u_short = ushort;
    alias __u_int = uint;
    alias __u_long = c_ulong;
    alias __int8_t = byte;
    alias __uint8_t = ubyte;
    alias __int16_t = short;
    alias __uint16_t = ushort;
    alias __int32_t = int;
    alias __uint32_t = uint;
    alias __int64_t = c_long;
    alias __uint64_t = c_ulong;
    alias __int_least8_t = byte;
    alias __uint_least8_t = ubyte;
    alias __int_least16_t = short;
    alias __uint_least16_t = ushort;
    alias __int_least32_t = int;
    alias __uint_least32_t = uint;
    alias __int_least64_t = c_long;
    alias __uint_least64_t = c_ulong;
    alias __quad_t = c_long;
    alias __u_quad_t = c_ulong;
    alias __intmax_t = c_long;
    alias __uintmax_t = c_ulong;
    c_long nrand48(ushort*) @nogc nothrow;
    c_long lrand48() @nogc nothrow;
    double erand48(ushort*) @nogc nothrow;
    double drand48() @nogc nothrow;
    int rand_r(uint*) @nogc nothrow;
    void srand(uint) @nogc nothrow;
    alias __dev_t = c_ulong;
    alias __uid_t = uint;
    alias __gid_t = uint;
    alias __ino_t = c_ulong;
    alias __ino64_t = c_ulong;
    alias __mode_t = uint;
    alias __nlink_t = c_ulong;
    alias __off_t = c_long;
    alias __off64_t = c_long;
    alias __pid_t = int;
    struct __fsid_t
    {
        int[2] __val;
    }
    alias __clock_t = c_long;
    alias __rlim_t = c_ulong;
    alias __rlim64_t = c_ulong;
    alias __id_t = uint;
    alias __time_t = c_long;
    alias __useconds_t = uint;
    alias __suseconds_t = c_long;
    alias __daddr_t = int;
    alias __key_t = int;
    alias __clockid_t = int;
    alias __timer_t = void*;
    alias __blksize_t = c_long;
    alias __blkcnt_t = c_long;
    alias __blkcnt64_t = c_long;
    alias __fsblkcnt_t = c_ulong;
    alias __fsblkcnt64_t = c_ulong;
    alias __fsfilcnt_t = c_ulong;
    alias __fsfilcnt64_t = c_ulong;
    alias __fsword_t = c_long;
    alias __ssize_t = c_long;
    alias __syscall_slong_t = c_long;
    alias __syscall_ulong_t = c_ulong;
    alias __loff_t = c_long;
    alias __caddr_t = char*;
    alias __intptr_t = c_long;
    alias __socklen_t = uint;
    alias __sig_atomic_t = int;
    int rand() @nogc nothrow;
    alias FILE = _IO_FILE;
    struct _IO_FILE
    {
        int _flags;
        char* _IO_read_ptr;
        char* _IO_read_end;
        char* _IO_read_base;
        char* _IO_write_base;
        char* _IO_write_ptr;
        char* _IO_write_end;
        char* _IO_buf_base;
        char* _IO_buf_end;
        char* _IO_save_base;
        char* _IO_backup_base;
        char* _IO_save_end;
        _IO_marker* _markers;
        _IO_FILE* _chain;
        int _fileno;
        int _flags2;
        c_long _old_offset;
        ushort _cur_column;
        byte _vtable_offset;
        char[1] _shortbuf;
        void* _lock;
        c_long _offset;
        _IO_codecvt* _codecvt;
        _IO_wide_data* _wide_data;
        _IO_FILE* _freeres_list;
        void* _freeres_buf;
        c_ulong __pad5;
        int _mode;
        char[20] _unused2;
    }
    alias __FILE = _IO_FILE;
    alias __fpos64_t = _G_fpos64_t;
    struct _G_fpos64_t
    {
        c_long __pos;
        __mbstate_t __state;
    }
    int setstate_r(char*, random_data*) @nogc nothrow;
    alias __fpos_t = _G_fpos_t;
    struct _G_fpos_t
    {
        c_long __pos;
        __mbstate_t __state;
    }
    struct __locale_struct
    {
        __locale_data*[13] __locales;
        const(ushort)* __ctype_b;
        const(int)* __ctype_tolower;
        const(int)* __ctype_toupper;
        const(char)*[13] __names;
    }
    alias __locale_t = __locale_struct*;
    struct __mbstate_t
    {
        int __count;
        static union _Anonymous_9
        {
            uint __wch;
            char[4] __wchb;
        }
        _Anonymous_9 __value;
    }
    int initstate_r(uint, char*, c_ulong, random_data*) @nogc nothrow;
    struct __sigset_t
    {
        c_ulong[16] __val;
    }
    alias clock_t = c_long;
    int srandom_r(uint, random_data*) @nogc nothrow;
    alias clockid_t = int;
    alias locale_t = __locale_struct*;
    alias sigset_t = __sigset_t;
    int random_r(random_data*, int*) @nogc nothrow;
    struct _IO_marker;
    struct _IO_codecvt;
    struct _IO_wide_data;
    alias _IO_lock_t = void;
    struct random_data
    {
        int* fptr;
        int* rptr;
        int* state;
        int rand_type;
        int rand_deg;
        int rand_sep;
        int* end_ptr;
    }
    char* setstate(char*) @nogc nothrow;
    char* initstate(uint, char*, c_ulong) @nogc nothrow;
    struct timespec
    {
        c_long tv_sec;
        c_long tv_nsec;
    }
    struct timeval
    {
        c_long tv_sec;
        c_long tv_usec;
    }
    void srandom(uint) @nogc nothrow;
    alias time_t = c_long;
    alias timer_t = void*;
    c_long random() @nogc nothrow;
    c_long a64l(const(char)*) @nogc nothrow;
    char* l64a(c_long) @nogc nothrow;
    ulong strtoull(const(char)*, char**, int) @nogc nothrow;
    long strtoll(const(char)*, char**, int) @nogc nothrow;
    ulong strtouq(const(char)*, char**, int) @nogc nothrow;
    long strtoq(const(char)*, char**, int) @nogc nothrow;
    static ushort __uint16_identity(ushort) @nogc nothrow;
    static uint __uint32_identity(uint) @nogc nothrow;
    static c_ulong __uint64_identity(c_ulong) @nogc nothrow;
    c_ulong strtoul(const(char)*, char**, int) @nogc nothrow;
    c_long strtol(const(char)*, char**, int) @nogc nothrow;
    real strtold(const(char)*, char**) @nogc nothrow;
    float strtof(const(char)*, char**) @nogc nothrow;
    double strtod(const(char)*, char**) @nogc nothrow;
    long atoll(const(char)*) @nogc nothrow;
    c_long atol(const(char)*) @nogc nothrow;
    int atoi(const(char)*) @nogc nothrow;
    double atof(const(char)*) @nogc nothrow;
    c_ulong __ctype_get_mb_cur_max() @nogc nothrow;
    struct lldiv_t
    {
        long quot;
        long rem;
    }
    struct ldiv_t
    {
        c_long quot;
        c_long rem;
    }
    struct div_t
    {
        int quot;
        int rem;
    }
    int* __errno_location() @nogc nothrow;
    alias errcode_t = c_long;
    struct error_table
    {
        const(const(char)*)* msgs;
        c_long base;
        int n_msgs;
    }
    struct et_list;
    void com_err(const(char)*, c_long, const(char)*, ...) @nogc nothrow;
    void com_err_va(const(char)*, c_long, const(char)*, va_list*) @nogc nothrow;
    const(char)* error_message(c_long) @nogc nothrow;
    extern __gshared void function(const(char)*, c_long, const(char)*, va_list[1]) com_err_hook;
    void function(const(char)*, c_long, const(char)*, va_list[1]) set_com_err_hook(void function(const(char)*, c_long, const(char)*, va_list[1])) @nogc nothrow;
    void function(const(char)*, c_long, const(char)*, va_list[1]) reset_com_err_hook() @nogc nothrow;
    int init_error_table(const(const(char)*)*, c_long, int) @nogc nothrow;
    char* function(const(char)*) set_com_err_gettext(char* function(const(char)*)) @nogc nothrow;
    c_long add_error_table(const(error_table)*) @nogc nothrow;
    c_long remove_error_table(const(error_table)*) @nogc nothrow;
    void add_to_error_table(et_list*) @nogc nothrow;
    const(char)* com_right(et_list*, c_long) @nogc nothrow;
    const(char)* com_right_r(et_list*, c_long, char*, c_ulong) @nogc nothrow;
    void initialize_error_table_r(et_list**, const(char)**, int, c_long) @nogc nothrow;
    void free_error_table(et_list*) @nogc nothrow;
    int et_list_lock() @nogc nothrow;
    int et_list_unlock() @nogc nothrow;
    int __overflow(_IO_FILE*, int) @nogc nothrow;
    int __uflow(_IO_FILE*) @nogc nothrow;
    void funlockfile(_IO_FILE*) @nogc nothrow;
    int ftrylockfile(_IO_FILE*) @nogc nothrow;
    void flockfile(_IO_FILE*) @nogc nothrow;
    char* ctermid(char*) @nogc nothrow;
    int pclose(_IO_FILE*) @nogc nothrow;
    _IO_FILE* popen(const(char)*, const(char)*) @nogc nothrow;
    int fileno_unlocked(_IO_FILE*) @nogc nothrow;
    int fileno(_IO_FILE*) @nogc nothrow;
    void perror(const(char)*) @nogc nothrow;
    int ferror_unlocked(_IO_FILE*) @nogc nothrow;
    int feof_unlocked(_IO_FILE*) @nogc nothrow;
    void clearerr_unlocked(_IO_FILE*) @nogc nothrow;
    int ferror(_IO_FILE*) @nogc nothrow;
    struct gss_name_struct;
    alias gss_name_t = gss_name_struct*;
    struct gss_cred_id_struct;
    alias gss_cred_id_t = gss_cred_id_struct*;
    struct gss_ctx_id_struct;
    alias gss_ctx_id_t = gss_ctx_id_struct*;
    alias gss_uint32 = uint;
    alias gss_int32 = int;
    alias OM_uint32 = uint;
    alias gss_OID_desc = gss_OID_desc_struct;
    alias gss_OID = gss_OID_desc_struct*;
    struct gss_OID_desc_struct
    {
        uint length;
        void* elements;
    }
    alias gss_OID_set_desc = gss_OID_set_desc_struct;
    alias gss_OID_set = gss_OID_set_desc_struct*;
    struct gss_OID_set_desc_struct
    {
        c_ulong count;
        gss_OID_desc_struct* elements;
    }
    alias gss_buffer_desc = gss_buffer_desc_struct;
    alias gss_buffer_t = gss_buffer_desc_struct*;
    struct gss_buffer_desc_struct
    {
        c_ulong length;
        void* value;
    }
    alias gss_channel_bindings_t = gss_channel_bindings_struct*;
    struct gss_channel_bindings_struct
    {
        uint initiator_addrtype;
        gss_buffer_desc_struct initiator_address;
        uint acceptor_addrtype;
        gss_buffer_desc_struct acceptor_address;
        gss_buffer_desc_struct application_data;
    }
    alias gss_qop_t = uint;
    alias gss_cred_usage_t = int;
    int feof(_IO_FILE*) @nogc nothrow;
    void clearerr(_IO_FILE*) @nogc nothrow;
    int fsetpos(_IO_FILE*, const(_G_fpos_t)*) @nogc nothrow;
    int fgetpos(_IO_FILE*, _G_fpos_t*) @nogc nothrow;
    c_long ftello(_IO_FILE*) @nogc nothrow;
    int fseeko(_IO_FILE*, c_long, int) @nogc nothrow;
    void rewind(_IO_FILE*) @nogc nothrow;
    c_long ftell(_IO_FILE*) @nogc nothrow;
    int fseek(_IO_FILE*, c_long, int) @nogc nothrow;
    c_ulong fwrite_unlocked(const(void)*, c_ulong, c_ulong, _IO_FILE*) @nogc nothrow;
    c_ulong fread_unlocked(void*, c_ulong, c_ulong, _IO_FILE*) @nogc nothrow;
    c_ulong fwrite(const(void)*, c_ulong, c_ulong, _IO_FILE*) @nogc nothrow;
    c_ulong fread(void*, c_ulong, c_ulong, _IO_FILE*) @nogc nothrow;
    int ungetc(int, _IO_FILE*) @nogc nothrow;
    int puts(const(char)*) @nogc nothrow;
    int fputs(const(char)*, _IO_FILE*) @nogc nothrow;
    c_long getline(char**, c_ulong*, _IO_FILE*) @nogc nothrow;
    c_long getdelim(char**, c_ulong*, int, _IO_FILE*) @nogc nothrow;
    c_long __getdelim(char**, c_ulong*, int, _IO_FILE*) @nogc nothrow;
    char* fgets(char*, int, _IO_FILE*) @nogc nothrow;
    int putw(int, _IO_FILE*) @nogc nothrow;
    int getw(_IO_FILE*) @nogc nothrow;
    int putchar_unlocked(int) @nogc nothrow;
    int putc_unlocked(int, _IO_FILE*) @nogc nothrow;
    int fputc_unlocked(int, _IO_FILE*) @nogc nothrow;
    int putchar(int) @nogc nothrow;
    int putc(int, _IO_FILE*) @nogc nothrow;
    int fputc(int, _IO_FILE*) @nogc nothrow;
    int fgetc_unlocked(_IO_FILE*) @nogc nothrow;
    int getchar_unlocked() @nogc nothrow;
    int getc_unlocked(_IO_FILE*) @nogc nothrow;
    int getchar() @nogc nothrow;
    int getc(_IO_FILE*) @nogc nothrow;
    int fgetc(_IO_FILE*) @nogc nothrow;
    int vsscanf(const(char)*, const(char)*, va_list*) @nogc nothrow;
    int vscanf(const(char)*, va_list*) @nogc nothrow;
    int vfscanf(_IO_FILE*, const(char)*, va_list*) @nogc nothrow;
    int sscanf(const(char)*, const(char)*, ...) @nogc nothrow;
    int scanf(const(char)*, ...) @nogc nothrow;
    int fscanf(_IO_FILE*, const(char)*, ...) @nogc nothrow;
    int dprintf(int, const(char)*, ...) @nogc nothrow;
    int vdprintf(int, const(char)*, va_list*) @nogc nothrow;
    int vsnprintf(char*, c_ulong, const(char)*, va_list*) @nogc nothrow;
    int snprintf(char*, c_ulong, const(char)*, ...) @nogc nothrow;
    extern __gshared gss_OID_desc_struct* GSS_C_NT_USER_NAME;
    extern __gshared gss_OID_desc_struct* GSS_C_NT_MACHINE_UID_NAME;
    extern __gshared gss_OID_desc_struct* GSS_C_NT_STRING_UID_NAME;
    extern __gshared gss_OID_desc_struct* GSS_C_NT_HOSTBASED_SERVICE_X;
    extern __gshared gss_OID_desc_struct* GSS_C_NT_HOSTBASED_SERVICE;
    extern __gshared gss_OID_desc_struct* GSS_C_NT_ANONYMOUS;
    extern __gshared gss_OID_desc_struct* GSS_C_NT_EXPORT_NAME;
    uint gss_acquire_cred(uint*, gss_name_struct*, uint, gss_OID_set_desc_struct*, int, gss_cred_id_struct**, gss_OID_set_desc_struct**, uint*) @nogc nothrow;
    uint gss_release_cred(uint*, gss_cred_id_struct**) @nogc nothrow;
    uint gss_init_sec_context(uint*, gss_cred_id_struct*, gss_ctx_id_struct**, gss_name_struct*, gss_OID_desc_struct*, uint, uint, gss_channel_bindings_struct*, gss_buffer_desc_struct*, gss_OID_desc_struct**, gss_buffer_desc_struct*, uint*, uint*) @nogc nothrow;
    uint gss_accept_sec_context(uint*, gss_ctx_id_struct**, gss_cred_id_struct*, gss_buffer_desc_struct*, gss_channel_bindings_struct*, gss_name_struct**, gss_OID_desc_struct**, gss_buffer_desc_struct*, uint*, uint*, gss_cred_id_struct**) @nogc nothrow;
    uint gss_process_context_token(uint*, gss_ctx_id_struct*, gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_delete_sec_context(uint*, gss_ctx_id_struct**, gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_context_time(uint*, gss_ctx_id_struct*, uint*) @nogc nothrow;
    uint gss_get_mic(uint*, gss_ctx_id_struct*, uint, gss_buffer_desc_struct*, gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_verify_mic(uint*, gss_ctx_id_struct*, gss_buffer_desc_struct*, gss_buffer_desc_struct*, uint*) @nogc nothrow;
    uint gss_wrap(uint*, gss_ctx_id_struct*, int, uint, gss_buffer_desc_struct*, int*, gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_unwrap(uint*, gss_ctx_id_struct*, gss_buffer_desc_struct*, gss_buffer_desc_struct*, int*, uint*) @nogc nothrow;
    uint gss_display_status(uint*, uint, int, gss_OID_desc_struct*, uint*, gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_indicate_mechs(uint*, gss_OID_set_desc_struct**) @nogc nothrow;
    uint gss_compare_name(uint*, gss_name_struct*, gss_name_struct*, int*) @nogc nothrow;
    uint gss_display_name(uint*, gss_name_struct*, gss_buffer_desc_struct*, gss_OID_desc_struct**) @nogc nothrow;
    uint gss_import_name(uint*, gss_buffer_desc_struct*, gss_OID_desc_struct*, gss_name_struct**) @nogc nothrow;
    uint gss_release_name(uint*, gss_name_struct**) @nogc nothrow;
    uint gss_release_buffer(uint*, gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_release_oid_set(uint*, gss_OID_set_desc_struct**) @nogc nothrow;
    uint gss_inquire_cred(uint*, gss_cred_id_struct*, gss_name_struct**, uint*, int*, gss_OID_set_desc_struct**) @nogc nothrow;
    uint gss_inquire_context(uint*, gss_ctx_id_struct*, gss_name_struct**, gss_name_struct**, uint*, gss_OID_desc_struct**, uint*, int*, int*) @nogc nothrow;
    uint gss_wrap_size_limit(uint*, gss_ctx_id_struct*, int, uint, uint, uint*) @nogc nothrow;
    uint gss_import_name_object(uint*, void*, gss_OID_desc_struct*, gss_name_struct**) @nogc nothrow;
    uint gss_export_name_object(uint*, gss_name_struct*, gss_OID_desc_struct*, void**) @nogc nothrow;
    uint gss_add_cred(uint*, gss_cred_id_struct*, gss_name_struct*, gss_OID_desc_struct*, int, uint, uint, gss_cred_id_struct**, gss_OID_set_desc_struct**, uint*, uint*) @nogc nothrow;
    uint gss_inquire_cred_by_mech(uint*, gss_cred_id_struct*, gss_OID_desc_struct*, gss_name_struct**, uint*, uint*, int*) @nogc nothrow;
    uint gss_export_sec_context(uint*, gss_ctx_id_struct**, gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_import_sec_context(uint*, gss_buffer_desc_struct*, gss_ctx_id_struct**) @nogc nothrow;
    uint gss_release_oid(uint*, gss_OID_desc_struct**) @nogc nothrow;
    uint gss_create_empty_oid_set(uint*, gss_OID_set_desc_struct**) @nogc nothrow;
    uint gss_add_oid_set_member(uint*, gss_OID_desc_struct*, gss_OID_set_desc_struct**) @nogc nothrow;
    uint gss_test_oid_set_member(uint*, gss_OID_desc_struct*, gss_OID_set_desc_struct*, int*) @nogc nothrow;
    uint gss_str_to_oid(uint*, gss_buffer_desc_struct*, gss_OID_desc_struct**) @nogc nothrow;
    uint gss_oid_to_str(uint*, gss_OID_desc_struct*, gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_inquire_names_for_mech(uint*, gss_OID_desc_struct*, gss_OID_set_desc_struct**) @nogc nothrow;
    uint gss_inquire_mechs_for_name(uint*, const(gss_name_struct*), gss_OID_set_desc_struct**) @nogc nothrow;
    uint gss_sign(uint*, gss_ctx_id_struct*, int, gss_buffer_desc_struct*, gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_verify(uint*, gss_ctx_id_struct*, gss_buffer_desc_struct*, gss_buffer_desc_struct*, int*) @nogc nothrow;
    uint gss_seal(uint*, gss_ctx_id_struct*, int, int, gss_buffer_desc_struct*, int*, gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_unseal(uint*, gss_ctx_id_struct*, gss_buffer_desc_struct*, gss_buffer_desc_struct*, int*, int*) @nogc nothrow;
    uint gss_export_name(uint*, const(gss_name_struct*), gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_duplicate_name(uint*, const(gss_name_struct*), gss_name_struct**) @nogc nothrow;
    uint gss_canonicalize_name(uint*, const(gss_name_struct*), const(gss_OID_desc_struct*), gss_name_struct**) @nogc nothrow;
    uint gss_pseudo_random(uint*, gss_ctx_id_struct*, int, const(gss_buffer_desc_struct*), c_long, gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_store_cred(uint*, const(gss_cred_id_struct*), int, const(gss_OID_desc_struct*), uint, uint, gss_OID_set_desc_struct**, int*) @nogc nothrow;
    uint gss_set_neg_mechs(uint*, gss_cred_id_struct*, const(gss_OID_set_desc_struct*)) @nogc nothrow;
    int vsprintf(char*, const(char)*, va_list*) @nogc nothrow;
    int vprintf(const(char)*, va_list*) @nogc nothrow;
    int vfprintf(_IO_FILE*, const(char)*, va_list*) @nogc nothrow;
    alias gss_const_buffer_t = const(gss_buffer_desc_struct)*;
    alias gss_const_channel_bindings_t = const(gss_channel_bindings_struct)*;
    alias gss_const_ctx_id_t = const(gss_ctx_id_struct)*;
    alias gss_const_cred_id_t = const(gss_cred_id_struct)*;
    alias gss_const_name_t = const(gss_name_struct)*;
    alias gss_const_OID = const(gss_OID_desc_struct)*;
    alias gss_const_OID_set = const(gss_OID_set_desc_struct)*;
    uint gss_indicate_mechs_by_attrs(uint*, const(gss_OID_set_desc_struct)*, const(gss_OID_set_desc_struct)*, const(gss_OID_set_desc_struct)*, gss_OID_set_desc_struct**) @nogc nothrow;
    uint gss_inquire_attrs_for_mech(uint*, const(gss_OID_desc_struct)*, gss_OID_set_desc_struct**, gss_OID_set_desc_struct**) @nogc nothrow;
    uint gss_display_mech_attr(uint*, const(gss_OID_desc_struct)*, gss_buffer_desc_struct*, gss_buffer_desc_struct*, gss_buffer_desc_struct*) @nogc nothrow;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_MECH_CONCRETE;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_MECH_PSEUDO;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_MECH_COMPOSITE;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_MECH_NEGO;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_MECH_GLUE;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_NOT_MECH;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_DEPRECATED;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_NOT_DFLT_MECH;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_ITOK_FRAMED;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_AUTH_INIT;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_AUTH_TARG;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_AUTH_INIT_INIT;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_AUTH_TARG_INIT;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_AUTH_INIT_ANON;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_AUTH_TARG_ANON;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_DELEG_CRED;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_INTEG_PROT;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_CONF_PROT;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_MIC;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_WRAP;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_PROT_READY;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_REPLAY_DET;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_OOS_DET;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_CBINDINGS;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_PFS;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_COMPRESS;
    extern __gshared const(gss_OID_desc_struct)* GSS_C_MA_CTX_TRANS;
    uint gss_inquire_saslname_for_mech(uint*, const(gss_OID_desc_struct*), gss_buffer_desc_struct*, gss_buffer_desc_struct*, gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_inquire_mech_for_saslname(uint*, const(gss_buffer_desc_struct*), gss_OID_desc_struct**) @nogc nothrow;
    int sprintf(char*, const(char)*, ...) @nogc nothrow;
    uint gss_pname_to_uid(uint*, const(gss_name_struct*), const(gss_OID_desc_struct*), uint*) @nogc nothrow;
    uint gss_localname(uint*, const(gss_name_struct*), const(gss_OID_desc_struct)*, gss_buffer_desc_struct*) @nogc nothrow;
    int gss_userok(const(gss_name_struct*), const(char)*) @nogc nothrow;
    uint gss_authorize_localname(uint*, const(gss_name_struct*), const(gss_name_struct*)) @nogc nothrow;
    uint gss_acquire_cred_with_password(uint*, const(gss_name_struct*), const(gss_buffer_desc_struct*), uint, const(gss_OID_set_desc_struct*), int, gss_cred_id_struct**, gss_OID_set_desc_struct**, uint*) @nogc nothrow;
    uint gss_add_cred_with_password(uint*, const(gss_cred_id_struct*), const(gss_name_struct*), const(gss_OID_desc_struct*), const(gss_buffer_desc_struct*), int, uint, uint, gss_cred_id_struct**, gss_OID_set_desc_struct**, uint*, uint*) @nogc nothrow;
    alias gss_buffer_set_desc = gss_buffer_set_desc_struct;
    alias gss_buffer_set_t = gss_buffer_set_desc_struct*;
    struct gss_buffer_set_desc_struct
    {
        c_ulong count;
        gss_buffer_desc_struct* elements;
    }
    int printf(const(char)*, ...) @nogc nothrow;
    uint gss_create_empty_buffer_set(uint*, gss_buffer_set_desc_struct**) @nogc nothrow;
    uint gss_add_buffer_set_member(uint*, const(gss_buffer_desc_struct*), gss_buffer_set_desc_struct**) @nogc nothrow;
    uint gss_release_buffer_set(uint*, gss_buffer_set_desc_struct**) @nogc nothrow;
    uint gss_inquire_sec_context_by_oid(uint*, const(gss_ctx_id_struct*), const(gss_OID_desc_struct*), gss_buffer_set_desc_struct**) @nogc nothrow;
    uint gss_inquire_cred_by_oid(uint*, const(gss_cred_id_struct*), const(gss_OID_desc_struct*), gss_buffer_set_desc_struct**) @nogc nothrow;
    uint gss_set_sec_context_option(uint*, gss_ctx_id_struct**, const(gss_OID_desc_struct*), const(gss_buffer_desc_struct*)) @nogc nothrow;
    uint gss_export_cred(uint*, gss_cred_id_struct*, gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_import_cred(uint*, gss_buffer_desc_struct*, gss_cred_id_struct**) @nogc nothrow;
    uint gss_set_cred_option(uint*, gss_cred_id_struct**, const(gss_OID_desc_struct*), const(gss_buffer_desc_struct*)) @nogc nothrow;
    uint gssspi_mech_invoke(uint*, const(gss_OID_desc_struct*), const(gss_OID_desc_struct*), gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_wrap_aead(uint*, gss_ctx_id_struct*, int, uint, gss_buffer_desc_struct*, gss_buffer_desc_struct*, int*, gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_unwrap_aead(uint*, gss_ctx_id_struct*, gss_buffer_desc_struct*, gss_buffer_desc_struct*, gss_buffer_desc_struct*, int*, uint*) @nogc nothrow;
    int fprintf(_IO_FILE*, const(char)*, ...) @nogc nothrow;
    void setlinebuf(_IO_FILE*) @nogc nothrow;
    extern __gshared gss_OID_desc_struct* GSS_C_INQ_SSPI_SESSION_KEY;
    uint gss_complete_auth_token(uint*, const(gss_ctx_id_struct*), gss_buffer_desc_struct*) @nogc nothrow;
    alias gss_iov_buffer_desc = gss_iov_buffer_desc_struct;
    alias gss_iov_buffer_t = gss_iov_buffer_desc_struct*;
    struct gss_iov_buffer_desc_struct
    {
        uint type;
        gss_buffer_desc_struct buffer;
    }
    void setbuffer(_IO_FILE*, char*, c_ulong) @nogc nothrow;
    int setvbuf(_IO_FILE*, char*, int, c_ulong) @nogc nothrow;
    void setbuf(_IO_FILE*, char*) @nogc nothrow;
    _IO_FILE* open_memstream(char**, c_ulong*) @nogc nothrow;
    _IO_FILE* fmemopen(void*, c_ulong, const(char)*) @nogc nothrow;
    uint gss_wrap_iov(uint*, gss_ctx_id_struct*, int, uint, int*, gss_iov_buffer_desc_struct*, int) @nogc nothrow;
    uint gss_unwrap_iov(uint*, gss_ctx_id_struct*, int*, uint*, gss_iov_buffer_desc_struct*, int) @nogc nothrow;
    uint gss_wrap_iov_length(uint*, gss_ctx_id_struct*, int, uint, int*, gss_iov_buffer_desc_struct*, int) @nogc nothrow;
    uint gss_get_mic_iov(uint*, gss_ctx_id_struct*, uint, gss_iov_buffer_desc_struct*, int) @nogc nothrow;
    uint gss_get_mic_iov_length(uint*, gss_ctx_id_struct*, uint, gss_iov_buffer_desc_struct*, int) @nogc nothrow;
    uint gss_verify_mic_iov(uint*, gss_ctx_id_struct*, uint*, gss_iov_buffer_desc_struct*, int) @nogc nothrow;
    uint gss_release_iov_buffer(uint*, gss_iov_buffer_desc_struct*, int) @nogc nothrow;
    uint gss_acquire_cred_impersonate_name(uint*, const(gss_cred_id_struct*), const(gss_name_struct*), uint, const(gss_OID_set_desc_struct*), int, gss_cred_id_struct**, gss_OID_set_desc_struct**, uint*) @nogc nothrow;
    uint gss_add_cred_impersonate_name(uint*, gss_cred_id_struct*, const(gss_cred_id_struct*), const(gss_name_struct*), const(gss_OID_desc_struct*), int, uint, uint, gss_cred_id_struct**, gss_OID_set_desc_struct**, uint*, uint*) @nogc nothrow;
    extern __gshared gss_buffer_desc_struct* GSS_C_ATTR_LOCAL_LOGIN_USER;
    extern __gshared gss_OID_desc_struct* GSS_C_NT_COMPOSITE_EXPORT;
    uint gss_display_name_ext(uint*, gss_name_struct*, gss_OID_desc_struct*, gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_inquire_name(uint*, gss_name_struct*, int*, gss_OID_desc_struct**, gss_buffer_set_desc_struct**) @nogc nothrow;
    uint gss_get_name_attribute(uint*, gss_name_struct*, gss_buffer_desc_struct*, int*, int*, gss_buffer_desc_struct*, gss_buffer_desc_struct*, int*) @nogc nothrow;
    uint gss_set_name_attribute(uint*, gss_name_struct*, int, gss_buffer_desc_struct*, gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_delete_name_attribute(uint*, gss_name_struct*, gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_export_name_composite(uint*, gss_name_struct*, gss_buffer_desc_struct*) @nogc nothrow;
    alias gss_any_t = gss_any*;
    struct gss_any;
    uint gss_map_name_to_any(uint*, gss_name_struct*, int, gss_buffer_desc_struct*, gss_any**) @nogc nothrow;
    uint gss_release_any_name_mapping(uint*, gss_name_struct*, gss_buffer_desc_struct*, gss_any**) @nogc nothrow;
    uint gss_encapsulate_token(const(gss_buffer_desc_struct)*, const(gss_OID_desc_struct)*, gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_decapsulate_token(const(gss_buffer_desc_struct)*, const(gss_OID_desc_struct)*, gss_buffer_desc_struct*) @nogc nothrow;
    int gss_oid_equal(const(gss_OID_desc_struct)*, const(gss_OID_desc_struct)*) @nogc nothrow;
    struct gss_key_value_element_struct
    {
        const(char)* key;
        const(char)* value;
    }
    alias gss_key_value_element_desc = gss_key_value_element_struct;
    struct gss_key_value_set_struct
    {
        uint count;
        gss_key_value_element_struct* elements;
    }
    alias gss_key_value_set_desc = gss_key_value_set_struct;
    alias gss_const_key_value_set_t = const(gss_key_value_set_struct)*;
    uint gss_acquire_cred_from(uint*, gss_name_struct*, uint, gss_OID_set_desc_struct*, int, const(gss_key_value_set_struct)*, gss_cred_id_struct**, gss_OID_set_desc_struct**, uint*) @nogc nothrow;
    uint gss_add_cred_from(uint*, gss_cred_id_struct*, gss_name_struct*, gss_OID_desc_struct*, int, uint, uint, const(gss_key_value_set_struct)*, gss_cred_id_struct**, gss_OID_set_desc_struct**, uint*, uint*) @nogc nothrow;
    uint gss_store_cred_into(uint*, gss_cred_id_struct*, int, gss_OID_desc_struct*, uint, uint, const(gss_key_value_set_struct)*, gss_OID_set_desc_struct**, int*) @nogc nothrow;
    extern __gshared gss_OID_desc_struct* GSS_C_SEC_CONTEXT_SASL_SSF;
    _IO_FILE* fdopen(int, const(char)*) @nogc nothrow;
    extern __gshared gss_OID_desc_struct* gss_nt_user_name;
    extern __gshared gss_OID_desc_struct* gss_nt_machine_uid_name;
    extern __gshared gss_OID_desc_struct* gss_nt_string_uid_name;
    extern __gshared gss_OID_desc_struct* gss_nt_service_name_v2;
    extern __gshared gss_OID_desc_struct* gss_nt_service_name;
    extern __gshared gss_OID_desc_struct* gss_nt_exported_name;
    _IO_FILE* freopen(const(char)*, const(char)*, _IO_FILE*) @nogc nothrow;
    extern __gshared const(gss_OID_desc_struct*) GSS_KRB5_NT_PRINCIPAL_NAME;
    _IO_FILE* fopen(const(char)*, const(char)*) @nogc nothrow;
    int fflush_unlocked(_IO_FILE*) @nogc nothrow;
    extern __gshared const(gss_OID_desc_struct*) GSS_KRB5_NT_ENTERPRISE_NAME;
    extern __gshared const(gss_OID_desc_struct*) gss_mech_krb5;
    extern __gshared const(gss_OID_desc_struct*) gss_mech_krb5_old;
    extern __gshared const(gss_OID_desc_struct*) gss_mech_krb5_wrong;
    extern __gshared const(gss_OID_desc_struct*) gss_mech_iakerb;
    extern __gshared const(gss_OID_set_desc_struct*) gss_mech_set_krb5;
    extern __gshared const(gss_OID_set_desc_struct*) gss_mech_set_krb5_old;
    extern __gshared const(gss_OID_set_desc_struct*) gss_mech_set_krb5_both;
    extern __gshared const(gss_OID_desc_struct*) gss_nt_krb5_name;
    extern __gshared const(gss_OID_desc_struct*) gss_nt_krb5_principal;
    extern __gshared const(gss_OID_desc_struct)[0] krb5_gss_oid_array;
    extern __gshared const(gss_OID_desc_struct*) GSS_KRB5_CRED_NO_CI_FLAGS_X;
    extern __gshared const(gss_OID_desc_struct*) GSS_KRB5_GET_CRED_IMPERSONATOR;
    int fflush(_IO_FILE*) @nogc nothrow;
    int fclose(_IO_FILE*) @nogc nothrow;
    char* tempnam(const(char)*, const(char)*) @nogc nothrow;
    alias gss_krb5_lucid_key_t = gss_krb5_lucid_key;
    struct gss_krb5_lucid_key
    {
        uint type;
        uint length;
        void* data;
    }
    alias gss_krb5_rfc1964_keydata_t = gss_krb5_rfc1964_keydata;
    struct gss_krb5_rfc1964_keydata
    {
        uint sign_alg;
        uint seal_alg;
        gss_krb5_lucid_key ctx_key;
    }
    alias gss_krb5_cfx_keydata_t = gss_krb5_cfx_keydata;
    struct gss_krb5_cfx_keydata
    {
        uint have_acceptor_subkey;
        gss_krb5_lucid_key ctx_key;
        gss_krb5_lucid_key acceptor_subkey;
    }
    alias gss_krb5_lucid_context_v1_t = gss_krb5_lucid_context_v1;
    struct gss_krb5_lucid_context_v1
    {
        uint version_;
        uint initiate;
        uint endtime;
        c_ulong send_seq;
        c_ulong recv_seq;
        uint protocol;
        gss_krb5_rfc1964_keydata rfc1964_kd;
        gss_krb5_cfx_keydata cfx_kd;
    }
    alias gss_krb5_lucid_context_version_t = gss_krb5_lucid_context_version;
    struct gss_krb5_lucid_context_version
    {
        uint version_;
    }
    uint krb5_gss_register_acceptor_identity(const(char)*) @nogc nothrow;
    uint gss_krb5_get_tkt_flags(uint*, gss_ctx_id_struct*, int*) @nogc nothrow;
    uint gss_krb5_copy_ccache(uint*, gss_cred_id_struct*, _krb5_ccache*) @nogc nothrow;
    uint gss_krb5_ccache_name(uint*, const(char)*, const(char)**) @nogc nothrow;
    uint gss_krb5_set_allowable_enctypes(uint*, gss_cred_id_struct*, uint, int*) @nogc nothrow;
    uint gss_krb5_export_lucid_sec_context(uint*, gss_ctx_id_struct**, uint, void**) @nogc nothrow;
    uint gss_krb5_free_lucid_sec_context(uint*, void*) @nogc nothrow;
    uint gsskrb5_extract_authz_data_from_sec_context(uint*, const(gss_ctx_id_struct*), int, gss_buffer_desc_struct*) @nogc nothrow;
    uint gss_krb5_set_cred_rcache(uint*, gss_cred_id_struct*, krb5_rc_st*) @nogc nothrow;
    uint gsskrb5_extract_authtime_from_sec_context(uint*, gss_ctx_id_struct*, int*) @nogc nothrow;
    uint gss_krb5_import_cred(uint*, _krb5_ccache*, krb5_principal_data*, _krb5_kt*, gss_cred_id_struct**) @nogc nothrow;
    char* tmpnam_r(char*) @nogc nothrow;
    char* tmpnam(char*) @nogc nothrow;
    _IO_FILE* tmpfile() @nogc nothrow;
    struct _profile_t;
    alias krb5_octet = ubyte;
    alias krb5_int16 = short;
    alias krb5_ui_2 = ushort;
    alias krb5_int32 = int;
    alias krb5_ui_4 = uint;
    int renameat(int, const(char)*, int, const(char)*) @nogc nothrow;
    int rename(const(char)*, const(char)*) @nogc nothrow;
    int remove(const(char)*) @nogc nothrow;
    extern __gshared _IO_FILE* stderr;
    alias krb5_boolean = uint;
    alias krb5_msgtype = uint;
    alias krb5_kvno = uint;
    alias krb5_addrtype = int;
    alias krb5_enctype = int;
    alias krb5_cksumtype = int;
    alias krb5_authdatatype = int;
    alias krb5_keyusage = int;
    alias krb5_cryptotype = int;
    alias krb5_preauthtype = int;
    alias krb5_flags = int;
    alias krb5_timestamp = int;
    alias krb5_deltat = int;
    alias krb5_error_code = int;
    alias krb5_magic = int;
    alias krb5_data = _krb5_data;
    struct _krb5_data
    {
        int magic;
        uint length;
        char* data;
    }
    alias krb5_octet_data = _krb5_octet_data;
    struct _krb5_octet_data
    {
        int magic;
        uint length;
        ubyte* data;
    }
    extern __gshared _IO_FILE* stdout;
    extern __gshared _IO_FILE* stdin;
    alias krb5_pointer = void*;
    alias krb5_const_pointer = const(void)*;
    struct krb5_principal_data
    {
        int magic;
        _krb5_data realm;
        _krb5_data* data;
        int length;
        int type;
    }
    alias krb5_principal = krb5_principal_data*;
    alias fpos_t = _G_fpos_t;
    alias krb5_const_principal = const(krb5_principal_data)*;
    uint krb5_is_referral_realm(const(_krb5_data)*) @nogc nothrow;
    const(_krb5_data)* krb5_anonymous_realm() @nogc nothrow;
    const(krb5_principal_data)* krb5_anonymous_principal() @nogc nothrow;
    alias krb5_address = _krb5_address;
    struct _krb5_address
    {
        int magic;
        int addrtype;
        uint length;
        ubyte* contents;
    }
    alias uintmax_t = c_ulong;
    alias intmax_t = c_long;
    alias uintptr_t = c_ulong;
    struct _krb5_context;
    alias krb5_context = _krb5_context*;
    struct _krb5_auth_context;
    alias krb5_auth_context = _krb5_auth_context*;
    struct _krb5_cryptosystem_entry;
    alias krb5_keyblock = _krb5_keyblock;
    struct _krb5_keyblock
    {
        int magic;
        int enctype;
        uint length;
        ubyte* contents;
    }
    struct krb5_key_st;
    alias krb5_key = krb5_key_st*;
    alias krb5_encrypt_block = _krb5_encrypt_block;
    struct _krb5_encrypt_block
    {
        int magic;
        int crypto_entry;
        _krb5_keyblock* key;
    }
    alias krb5_checksum = _krb5_checksum;
    struct _krb5_checksum
    {
        int magic;
        int checksum_type;
        uint length;
        ubyte* contents;
    }
    alias krb5_enc_data = _krb5_enc_data;
    struct _krb5_enc_data
    {
        int magic;
        int enctype;
        uint kvno;
        _krb5_data ciphertext;
    }
    alias krb5_crypto_iov = _krb5_crypto_iov;
    struct _krb5_crypto_iov
    {
        int flags;
        _krb5_data data;
    }
    alias uint_fast64_t = c_ulong;
    alias uint_fast32_t = c_ulong;
    alias uint_fast16_t = c_ulong;
    alias uint_fast8_t = ubyte;
    alias int_fast64_t = c_long;
    alias int_fast32_t = c_long;
    alias int_fast16_t = c_long;
    alias int_fast8_t = byte;
    alias uint_least64_t = c_ulong;
    alias uint_least32_t = uint;
    alias uint_least16_t = ushort;
    alias uint_least8_t = ubyte;
    alias int_least64_t = c_long;
    alias int_least32_t = int;
    alias int_least16_t = short;
    alias int_least8_t = byte;
    void initialize_asn1_error_table_r(et_list**) @nogc nothrow;
    void initialize_asn1_error_table() @nogc nothrow;
    extern __gshared const(error_table) et_asn1_error_table;
    enum _Anonymous_10
    {
        KRB5_C_RANDSOURCE_OLDAPI = 0,
        KRB5_C_RANDSOURCE_OSRAND = 1,
        KRB5_C_RANDSOURCE_TRUSTEDPARTY = 2,
        KRB5_C_RANDSOURCE_TIMING = 3,
        KRB5_C_RANDSOURCE_EXTERNAL_PROTOCOL = 4,
        KRB5_C_RANDSOURCE_MAX = 5,
    }
    enum KRB5_C_RANDSOURCE_OLDAPI = _Anonymous_10.KRB5_C_RANDSOURCE_OLDAPI;
    enum KRB5_C_RANDSOURCE_OSRAND = _Anonymous_10.KRB5_C_RANDSOURCE_OSRAND;
    enum KRB5_C_RANDSOURCE_TRUSTEDPARTY = _Anonymous_10.KRB5_C_RANDSOURCE_TRUSTEDPARTY;
    enum KRB5_C_RANDSOURCE_TIMING = _Anonymous_10.KRB5_C_RANDSOURCE_TIMING;
    enum KRB5_C_RANDSOURCE_EXTERNAL_PROTOCOL = _Anonymous_10.KRB5_C_RANDSOURCE_EXTERNAL_PROTOCOL;
    enum KRB5_C_RANDSOURCE_MAX = _Anonymous_10.KRB5_C_RANDSOURCE_MAX;
    void initialize_k524_error_table_r(et_list**) @nogc nothrow;
    void initialize_k524_error_table() @nogc nothrow;
    extern __gshared const(error_table) et_k524_error_table;
    int krb5_c_encrypt(_krb5_context*, const(_krb5_keyblock)*, int, const(_krb5_data)*, const(_krb5_data)*, _krb5_enc_data*) @nogc nothrow;
    int krb5_c_decrypt(_krb5_context*, const(_krb5_keyblock)*, int, const(_krb5_data)*, const(_krb5_enc_data)*, _krb5_data*) @nogc nothrow;
    int krb5_c_encrypt_length(_krb5_context*, int, c_ulong, c_ulong*) @nogc nothrow;
    int krb5_c_block_size(_krb5_context*, int, c_ulong*) @nogc nothrow;
    int krb5_c_keylengths(_krb5_context*, int, c_ulong*, c_ulong*) @nogc nothrow;
    int krb5_c_init_state(_krb5_context*, const(_krb5_keyblock)*, int, _krb5_data*) @nogc nothrow;
    int krb5_c_free_state(_krb5_context*, const(_krb5_keyblock)*, _krb5_data*) @nogc nothrow;
    int krb5_c_prf(_krb5_context*, const(_krb5_keyblock)*, _krb5_data*, _krb5_data*) @nogc nothrow;
    int krb5_c_prf_length(_krb5_context*, int, c_ulong*) @nogc nothrow;
    int krb5_c_prfplus(_krb5_context*, const(_krb5_keyblock)*, const(_krb5_data)*, _krb5_data*) @nogc nothrow;
    int krb5_c_derive_prfplus(_krb5_context*, const(_krb5_keyblock)*, const(_krb5_data)*, int, _krb5_keyblock**) @nogc nothrow;
    int krb5_c_fx_cf2_simple(_krb5_context*, const(_krb5_keyblock)*, const(char)*, const(_krb5_keyblock)*, const(char)*, _krb5_keyblock**) @nogc nothrow;
    int krb5_c_make_random_key(_krb5_context*, int, _krb5_keyblock*) @nogc nothrow;
    int krb5_c_random_to_key(_krb5_context*, int, _krb5_data*, _krb5_keyblock*) @nogc nothrow;
    int krb5_c_random_add_entropy(_krb5_context*, uint, const(_krb5_data)*) @nogc nothrow;
    int krb5_c_random_make_octets(_krb5_context*, _krb5_data*) @nogc nothrow;
    int krb5_c_random_os_entropy(_krb5_context*, int, int*) @nogc nothrow;
    int krb5_c_random_seed(_krb5_context*, _krb5_data*) @nogc nothrow;
    int krb5_c_string_to_key(_krb5_context*, int, const(_krb5_data)*, const(_krb5_data)*, _krb5_keyblock*) @nogc nothrow;
    int krb5_c_string_to_key_with_params(_krb5_context*, int, const(_krb5_data)*, const(_krb5_data)*, const(_krb5_data)*, _krb5_keyblock*) @nogc nothrow;
    int krb5_c_enctype_compare(_krb5_context*, int, int, uint*) @nogc nothrow;
    int krb5_c_make_checksum(_krb5_context*, int, const(_krb5_keyblock)*, int, const(_krb5_data)*, _krb5_checksum*) @nogc nothrow;
    int krb5_c_verify_checksum(_krb5_context*, const(_krb5_keyblock)*, int, const(_krb5_data)*, const(_krb5_checksum)*, uint*) @nogc nothrow;
    int krb5_c_checksum_length(_krb5_context*, int, c_ulong*) @nogc nothrow;
    int krb5_c_keyed_checksum_types(_krb5_context*, int, uint*, int**) @nogc nothrow;
    void initialize_kv5m_error_table_r(et_list**) @nogc nothrow;
    void initialize_kv5m_error_table() @nogc nothrow;
    extern __gshared const(error_table) et_kv5m_error_table;
    void initialize_kdb5_error_table_r(et_list**) @nogc nothrow;
    void initialize_kdb5_error_table() @nogc nothrow;
    extern __gshared const(error_table) et_kdb5_error_table;
    void initialize_k5e1_error_table_r(et_list**) @nogc nothrow;
    void initialize_k5e1_error_table() @nogc nothrow;
    extern __gshared const(error_table) et_k5e1_error_table;
    void initialize_krb5_error_table_r(et_list**) @nogc nothrow;
    void initialize_krb5_error_table() @nogc nothrow;
    extern __gshared const(error_table) et_krb5_error_table;
    void krb5_set_kdc_recv_hook(_krb5_context*, int function(_krb5_context*, void*, int, const(_krb5_data)*, const(_krb5_data)*, const(_krb5_data)*, _krb5_data**), void*) @nogc nothrow;
    void krb5_set_kdc_send_hook(_krb5_context*, int function(_krb5_context*, void*, const(_krb5_data)*, const(_krb5_data)*, _krb5_data**, _krb5_data**), void*) @nogc nothrow;
    alias krb5_post_recv_fn = int function(_krb5_context*, void*, int, const(_krb5_data)*, const(_krb5_data)*, const(_krb5_data)*, _krb5_data**);
    alias krb5_pre_send_fn = int function(_krb5_context*, void*, const(_krb5_data)*, const(_krb5_data)*, _krb5_data**, _krb5_data**);
    int krb5_set_trace_filename(_krb5_context*, const(char)*) @nogc nothrow;
    int krb5_set_trace_callback(_krb5_context*, void function(_krb5_context*, const(_krb5_trace_info)*, void*), void*) @nogc nothrow;
    alias krb5_trace_callback = void function(_krb5_context*, const(_krb5_trace_info)*, void*);
    struct _krb5_trace_info
    {
        const(char)* message;
    }
    alias krb5_trace_info = _krb5_trace_info;
    int krb5_allow_weak_crypto(_krb5_context*, uint) @nogc nothrow;
    int krb5_pac_sign_ext(_krb5_context*, krb5_pac_data*, int, const(krb5_principal_data)*, const(_krb5_keyblock)*, const(_krb5_keyblock)*, uint, _krb5_data*) @nogc nothrow;
    int krb5_pac_sign(_krb5_context*, krb5_pac_data*, int, const(krb5_principal_data)*, const(_krb5_keyblock)*, const(_krb5_keyblock)*, _krb5_data*) @nogc nothrow;
    int krb5_pac_verify_ext(_krb5_context*, const(krb5_pac_data*), int, const(krb5_principal_data)*, const(_krb5_keyblock)*, const(_krb5_keyblock)*, uint) @nogc nothrow;
    int krb5_pac_verify(_krb5_context*, const(krb5_pac_data*), int, const(krb5_principal_data)*, const(_krb5_keyblock)*, const(_krb5_keyblock)*) @nogc nothrow;
    uint krb5_c_valid_enctype(int) @nogc nothrow;
    uint krb5_c_valid_cksumtype(int) @nogc nothrow;
    uint krb5_c_is_coll_proof_cksum(int) @nogc nothrow;
    uint krb5_c_is_keyed_cksum(int) @nogc nothrow;
    int krb5_pac_parse(_krb5_context*, const(void)*, c_ulong, krb5_pac_data**) @nogc nothrow;
    int krb5_pac_init(_krb5_context*, krb5_pac_data**) @nogc nothrow;
    int krb5_pac_get_types(_krb5_context*, krb5_pac_data*, c_ulong*, uint**) @nogc nothrow;
    int krb5_pac_get_buffer(_krb5_context*, krb5_pac_data*, uint, _krb5_data*) @nogc nothrow;
    int krb5_c_make_checksum_iov(_krb5_context*, int, const(_krb5_keyblock)*, int, _krb5_crypto_iov*, c_ulong) @nogc nothrow;
    int krb5_c_verify_checksum_iov(_krb5_context*, int, const(_krb5_keyblock)*, int, const(_krb5_crypto_iov)*, c_ulong, uint*) @nogc nothrow;
    int krb5_c_encrypt_iov(_krb5_context*, const(_krb5_keyblock)*, int, const(_krb5_data)*, _krb5_crypto_iov*, c_ulong) @nogc nothrow;
    int krb5_c_decrypt_iov(_krb5_context*, const(_krb5_keyblock)*, int, const(_krb5_data)*, _krb5_crypto_iov*, c_ulong) @nogc nothrow;
    int krb5_c_crypto_length(_krb5_context*, int, int, uint*) @nogc nothrow;
    int krb5_c_crypto_length_iov(_krb5_context*, int, _krb5_crypto_iov*, c_ulong) @nogc nothrow;
    int krb5_c_padding_length(_krb5_context*, int, c_ulong, uint*) @nogc nothrow;
    int krb5_k_create_key(_krb5_context*, const(_krb5_keyblock)*, krb5_key_st**) @nogc nothrow;
    void krb5_k_reference_key(_krb5_context*, krb5_key_st*) @nogc nothrow;
    void krb5_k_free_key(_krb5_context*, krb5_key_st*) @nogc nothrow;
    int krb5_k_key_keyblock(_krb5_context*, krb5_key_st*, _krb5_keyblock**) @nogc nothrow;
    int krb5_k_key_enctype(_krb5_context*, krb5_key_st*) @nogc nothrow;
    int krb5_k_encrypt(_krb5_context*, krb5_key_st*, int, const(_krb5_data)*, const(_krb5_data)*, _krb5_enc_data*) @nogc nothrow;
    int krb5_k_encrypt_iov(_krb5_context*, krb5_key_st*, int, const(_krb5_data)*, _krb5_crypto_iov*, c_ulong) @nogc nothrow;
    int krb5_k_decrypt(_krb5_context*, krb5_key_st*, int, const(_krb5_data)*, const(_krb5_enc_data)*, _krb5_data*) @nogc nothrow;
    int krb5_k_decrypt_iov(_krb5_context*, krb5_key_st*, int, const(_krb5_data)*, _krb5_crypto_iov*, c_ulong) @nogc nothrow;
    int krb5_k_make_checksum(_krb5_context*, int, krb5_key_st*, int, const(_krb5_data)*, _krb5_checksum*) @nogc nothrow;
    int krb5_k_make_checksum_iov(_krb5_context*, int, krb5_key_st*, int, _krb5_crypto_iov*, c_ulong) @nogc nothrow;
    int krb5_k_verify_checksum(_krb5_context*, krb5_key_st*, int, const(_krb5_data)*, const(_krb5_checksum)*, uint*) @nogc nothrow;
    int krb5_k_verify_checksum_iov(_krb5_context*, int, krb5_key_st*, int, const(_krb5_crypto_iov)*, c_ulong, uint*) @nogc nothrow;
    int krb5_k_prf(_krb5_context*, krb5_key_st*, _krb5_data*, _krb5_data*) @nogc nothrow;
    int krb5_encrypt(_krb5_context*, const(void)*, void*, c_ulong, _krb5_encrypt_block*, void*) @nogc nothrow;
    int krb5_decrypt(_krb5_context*, const(void)*, void*, c_ulong, _krb5_encrypt_block*, void*) @nogc nothrow;
    int krb5_process_key(_krb5_context*, _krb5_encrypt_block*, const(_krb5_keyblock)*) @nogc nothrow;
    int krb5_finish_key(_krb5_context*, _krb5_encrypt_block*) @nogc nothrow;
    int krb5_string_to_key(_krb5_context*, const(_krb5_encrypt_block)*, _krb5_keyblock*, const(_krb5_data)*, const(_krb5_data)*) @nogc nothrow;
    int krb5_init_random_key(_krb5_context*, const(_krb5_encrypt_block)*, const(_krb5_keyblock)*, void**) @nogc nothrow;
    int krb5_finish_random_key(_krb5_context*, const(_krb5_encrypt_block)*, void**) @nogc nothrow;
    int krb5_random_key(_krb5_context*, const(_krb5_encrypt_block)*, void*, _krb5_keyblock**) @nogc nothrow;
    int krb5_eblock_enctype(_krb5_context*, const(_krb5_encrypt_block)*) @nogc nothrow;
    int krb5_use_enctype(_krb5_context*, _krb5_encrypt_block*, int) @nogc nothrow;
    c_ulong krb5_encrypt_size(c_ulong, int) @nogc nothrow;
    c_ulong krb5_checksum_size(_krb5_context*, int) @nogc nothrow;
    int krb5_calculate_checksum(_krb5_context*, int, const(void)*, c_ulong, const(void)*, c_ulong, _krb5_checksum*) @nogc nothrow;
    int krb5_verify_checksum(_krb5_context*, int, const(_krb5_checksum)*, const(void)*, c_ulong, const(void)*, c_ulong) @nogc nothrow;
    void krb5_pac_free(_krb5_context*, krb5_pac_data*) @nogc nothrow;
    int krb5_pac_add_buffer(_krb5_context*, krb5_pac_data*, uint, const(_krb5_data)*) @nogc nothrow;
    alias krb5_pac = krb5_pac_data*;
    struct krb5_pac_data;
    int krb5_verify_authdata_kdc_issued(_krb5_context*, const(_krb5_keyblock)*, const(_krb5_authdata)*, krb5_principal_data**, _krb5_authdata***) @nogc nothrow;
    int krb5_make_authdata_kdc_issued(_krb5_context*, const(_krb5_keyblock)*, const(krb5_principal_data)*, _krb5_authdata**, _krb5_authdata***) @nogc nothrow;
    int krb5_encode_authdata_container(_krb5_context*, int, _krb5_authdata**, _krb5_authdata***) @nogc nothrow;
    int krb5_decode_authdata_container(_krb5_context*, int, const(_krb5_authdata)*, _krb5_authdata***) @nogc nothrow;
    void krb5_clear_error_message(_krb5_context*) @nogc nothrow;
    void krb5_free_error_message(_krb5_context*, const(char)*) @nogc nothrow;
    const(char)* krb5_get_error_message(_krb5_context*, int) @nogc nothrow;
    void krb5_copy_error_message(_krb5_context*, _krb5_context*) @nogc nothrow;
    void krb5_vwrap_error_message(_krb5_context*, int, int, const(char)*, va_list*) @nogc nothrow;
    void krb5_wrap_error_message(_krb5_context*, int, int, const(char)*, ...) @nogc nothrow;
    void krb5_vprepend_error_message(_krb5_context*, int, const(char)*, va_list*) @nogc nothrow;
    void krb5_prepend_error_message(_krb5_context*, int, const(char)*, ...) @nogc nothrow;
    void krb5_vset_error_message(_krb5_context*, int, const(char)*, va_list*) @nogc nothrow;
    void krb5_set_error_message(_krb5_context*, int, const(char)*, ...) @nogc nothrow;
    int* krb5_get_prompt_types(_krb5_context*) @nogc nothrow;
    alias krb5_prompt_type = int;
    void krb5_appdefault_boolean(_krb5_context*, const(char)*, const(_krb5_data)*, const(char)*, int, int*) @nogc nothrow;
    void krb5_appdefault_string(_krb5_context*, const(char)*, const(_krb5_data)*, const(char)*, const(char)*, char**) @nogc nothrow;
    int krb5_decode_ticket(const(_krb5_data)*, _krb5_ticket**) @nogc nothrow;
    int krb5_get_renewed_creds(_krb5_context*, _krb5_creds*, krb5_principal_data*, _krb5_ccache*, const(char)*) @nogc nothrow;
    int krb5_get_validated_creds(_krb5_context*, _krb5_creds*, krb5_principal_data*, _krb5_ccache*, const(char)*) @nogc nothrow;
    int krb5_verify_init_creds(_krb5_context*, _krb5_creds*, krb5_principal_data*, _krb5_kt*, _krb5_ccache**, _krb5_verify_init_creds_opt*) @nogc nothrow;
    void krb5_verify_init_creds_opt_set_ap_req_nofail(_krb5_verify_init_creds_opt*, int) @nogc nothrow;
    void krb5_verify_init_creds_opt_init(_krb5_verify_init_creds_opt*) @nogc nothrow;
    struct _krb5_verify_init_creds_opt
    {
        int flags;
        int ap_req_nofail;
    }
    alias krb5_verify_init_creds_opt = _krb5_verify_init_creds_opt;
    int krb5_get_init_creds_keytab(_krb5_context*, _krb5_creds*, krb5_principal_data*, _krb5_kt*, int, const(char)*, _krb5_get_init_creds_opt*) @nogc nothrow;
    int krb5_tkt_creds_get_times(_krb5_context*, _krb5_tkt_creds_context*, _krb5_ticket_times*) @nogc nothrow;
    int krb5_tkt_creds_step(_krb5_context*, _krb5_tkt_creds_context*, _krb5_data*, _krb5_data*, _krb5_data*, uint*) @nogc nothrow;
    void krb5_tkt_creds_free(_krb5_context*, _krb5_tkt_creds_context*) @nogc nothrow;
    int krb5_tkt_creds_get_creds(_krb5_context*, _krb5_tkt_creds_context*, _krb5_creds*) @nogc nothrow;
    int krb5_tkt_creds_get(_krb5_context*, _krb5_tkt_creds_context*) @nogc nothrow;
    int krb5_tkt_creds_init(_krb5_context*, _krb5_ccache*, _krb5_creds*, int, _krb5_tkt_creds_context**) @nogc nothrow;
    alias krb5_tkt_creds_context = _krb5_tkt_creds_context*;
    struct _krb5_tkt_creds_context;
    int krb5_init_creds_get_times(_krb5_context*, _krb5_init_creds_context*, _krb5_ticket_times*) @nogc nothrow;
    int krb5_init_creds_set_service(_krb5_context*, _krb5_init_creds_context*, const(char)*) @nogc nothrow;
    int krb5_init_creds_set_password(_krb5_context*, _krb5_init_creds_context*, const(char)*) @nogc nothrow;
    int krb5_init_creds_step(_krb5_context*, _krb5_init_creds_context*, _krb5_data*, _krb5_data*, _krb5_data*, uint*) @nogc nothrow;
    int krb5_init_creds_set_keytab(_krb5_context*, _krb5_init_creds_context*, _krb5_kt*) @nogc nothrow;
    int krb5_init_creds_init(_krb5_context*, krb5_principal_data*, int function(_krb5_context*, void*, const(char)*, const(char)*, int, _krb5_prompt[0]), void*, int, _krb5_get_init_creds_opt*, _krb5_init_creds_context**) @nogc nothrow;
    int krb5_init_creds_get_error(_krb5_context*, _krb5_init_creds_context*, _krb5_error**) @nogc nothrow;
    int krb5_init_creds_get_creds(_krb5_context*, _krb5_init_creds_context*, _krb5_creds*) @nogc nothrow;
    int krb5_init_creds_get(_krb5_context*, _krb5_init_creds_context*) @nogc nothrow;
    void krb5_init_creds_free(_krb5_context*, _krb5_init_creds_context*) @nogc nothrow;
    alias krb5_init_creds_context = _krb5_init_creds_context*;
    struct _krb5_init_creds_context;
    int krb5_get_etype_info(_krb5_context*, krb5_principal_data*, _krb5_get_init_creds_opt*, int*, _krb5_data*, _krb5_data*) @nogc nothrow;
    int krb5_get_init_creds_password(_krb5_context*, _krb5_creds*, krb5_principal_data*, const(char)*, int function(_krb5_context*, void*, const(char)*, const(char)*, int, _krb5_prompt[0]), void*, int, const(char)*, _krb5_get_init_creds_opt*) @nogc nothrow;
    int krb5_get_init_creds_opt_set_responder(_krb5_context*, _krb5_get_init_creds_opt*, int function(_krb5_context*, void*, krb5_responder_context_st*), void*) @nogc nothrow;
    int krb5_get_init_creds_opt_set_expire_callback(_krb5_context*, _krb5_get_init_creds_opt*, void function(_krb5_context*, void*, int, int, uint), void*) @nogc nothrow;
    alias krb5_expire_callback_func = void function(_krb5_context*, void*, int, int, uint);
    int krb5_get_init_creds_opt_get_fast_flags(_krb5_context*, _krb5_get_init_creds_opt*, int*) @nogc nothrow;
    int krb5_get_init_creds_opt_set_fast_flags(_krb5_context*, _krb5_get_init_creds_opt*, int) @nogc nothrow;
    int krb5_get_init_creds_opt_set_pac_request(_krb5_context*, _krb5_get_init_creds_opt*, uint) @nogc nothrow;
    int krb5_get_init_creds_opt_set_out_ccache(_krb5_context*, _krb5_get_init_creds_opt*, _krb5_ccache*) @nogc nothrow;
    int krb5_get_init_creds_opt_set_in_ccache(_krb5_context*, _krb5_get_init_creds_opt*, _krb5_ccache*) @nogc nothrow;
    int krb5_get_init_creds_opt_set_fast_ccache(_krb5_context*, _krb5_get_init_creds_opt*, _krb5_ccache*) @nogc nothrow;
    int krb5_get_init_creds_opt_set_fast_ccache_name(_krb5_context*, _krb5_get_init_creds_opt*, const(char)*) @nogc nothrow;
    int krb5_get_init_creds_opt_set_pa(_krb5_context*, _krb5_get_init_creds_opt*, const(char)*, const(char)*) @nogc nothrow;
    struct _krb5_gic_opt_pa_data
    {
        char* attr;
        char* value;
    }
    alias krb5_gic_opt_pa_data = _krb5_gic_opt_pa_data;
    void krb5_get_init_creds_opt_set_change_password_prompt(_krb5_get_init_creds_opt*, int) @nogc nothrow;
    void krb5_get_init_creds_opt_set_salt(_krb5_get_init_creds_opt*, _krb5_data*) @nogc nothrow;
    void krb5_get_init_creds_opt_set_preauth_list(_krb5_get_init_creds_opt*, int*, int) @nogc nothrow;
    void krb5_get_init_creds_opt_set_address_list(_krb5_get_init_creds_opt*, _krb5_address**) @nogc nothrow;
    void krb5_get_init_creds_opt_set_etype_list(_krb5_get_init_creds_opt*, int*, int) @nogc nothrow;
    void krb5_get_init_creds_opt_set_anonymous(_krb5_get_init_creds_opt*, int) @nogc nothrow;
    alias krb5_ticket_times = _krb5_ticket_times;
    struct _krb5_ticket_times
    {
        int authtime;
        int starttime;
        int endtime;
        int renew_till;
    }
    alias krb5_authdata = _krb5_authdata;
    struct _krb5_authdata
    {
        int magic;
        int ad_type;
        uint length;
        ubyte* contents;
    }
    alias krb5_transited = _krb5_transited;
    struct _krb5_transited
    {
        int magic;
        ubyte tr_type;
        _krb5_data tr_contents;
    }
    alias krb5_enc_tkt_part = _krb5_enc_tkt_part;
    struct _krb5_enc_tkt_part
    {
        int magic;
        int flags;
        _krb5_keyblock* session;
        krb5_principal_data* client;
        _krb5_transited transited;
        _krb5_ticket_times times;
        _krb5_address** caddrs;
        _krb5_authdata** authorization_data;
    }
    alias krb5_ticket = _krb5_ticket;
    struct _krb5_ticket
    {
        int magic;
        krb5_principal_data* server;
        _krb5_enc_data enc_part;
        _krb5_enc_tkt_part* enc_part2;
    }
    alias krb5_authenticator = _krb5_authenticator;
    struct _krb5_authenticator
    {
        int magic;
        krb5_principal_data* client;
        _krb5_checksum* checksum;
        int cusec;
        int ctime;
        _krb5_keyblock* subkey;
        uint seq_number;
        _krb5_authdata** authorization_data;
    }
    alias krb5_tkt_authent = _krb5_tkt_authent;
    struct _krb5_tkt_authent
    {
        int magic;
        _krb5_ticket* ticket;
        _krb5_authenticator* authenticator;
        int ap_options;
    }
    alias krb5_creds = _krb5_creds;
    struct _krb5_creds
    {
        int magic;
        krb5_principal_data* client;
        krb5_principal_data* server;
        _krb5_keyblock keyblock;
        _krb5_ticket_times times;
        uint is_skey;
        int ticket_flags;
        _krb5_address** addresses;
        _krb5_data ticket;
        _krb5_data second_ticket;
        _krb5_authdata** authdata;
    }
    alias krb5_last_req_entry = _krb5_last_req_entry;
    struct _krb5_last_req_entry
    {
        int magic;
        int lr_type;
        int value;
    }
    alias krb5_pa_data = _krb5_pa_data;
    struct _krb5_pa_data
    {
        int magic;
        int pa_type;
        uint length;
        ubyte* contents;
    }
    alias krb5_typed_data = _krb5_typed_data;
    struct _krb5_typed_data
    {
        int magic;
        int type;
        uint length;
        ubyte* data;
    }
    alias krb5_kdc_req = _krb5_kdc_req;
    struct _krb5_kdc_req
    {
        int magic;
        uint msg_type;
        _krb5_pa_data** padata;
        int kdc_options;
        krb5_principal_data* client;
        krb5_principal_data* server;
        int from;
        int till;
        int rtime;
        int nonce;
        int nktypes;
        int* ktype;
        _krb5_address** addresses;
        _krb5_enc_data authorization_data;
        _krb5_authdata** unenc_authdata;
        _krb5_ticket** second_ticket;
    }
    alias krb5_enc_kdc_rep_part = _krb5_enc_kdc_rep_part;
    struct _krb5_enc_kdc_rep_part
    {
        int magic;
        uint msg_type;
        _krb5_keyblock* session;
        _krb5_last_req_entry** last_req;
        int nonce;
        int key_exp;
        int flags;
        _krb5_ticket_times times;
        krb5_principal_data* server;
        _krb5_address** caddrs;
        _krb5_pa_data** enc_padata;
    }
    alias krb5_kdc_rep = _krb5_kdc_rep;
    struct _krb5_kdc_rep
    {
        int magic;
        uint msg_type;
        _krb5_pa_data** padata;
        krb5_principal_data* client;
        _krb5_ticket* ticket;
        _krb5_enc_data enc_part;
        _krb5_enc_kdc_rep_part* enc_part2;
    }
    alias krb5_error = _krb5_error;
    struct _krb5_error
    {
        int magic;
        int ctime;
        int cusec;
        int susec;
        int stime;
        uint error;
        krb5_principal_data* client;
        krb5_principal_data* server;
        _krb5_data text;
        _krb5_data e_data;
    }
    alias krb5_ap_req = _krb5_ap_req;
    struct _krb5_ap_req
    {
        int magic;
        int ap_options;
        _krb5_ticket* ticket;
        _krb5_enc_data authenticator;
    }
    alias krb5_ap_rep = _krb5_ap_rep;
    struct _krb5_ap_rep
    {
        int magic;
        _krb5_enc_data enc_part;
    }
    alias krb5_ap_rep_enc_part = _krb5_ap_rep_enc_part;
    struct _krb5_ap_rep_enc_part
    {
        int magic;
        int ctime;
        int cusec;
        _krb5_keyblock* subkey;
        uint seq_number;
    }
    alias krb5_response = _krb5_response;
    struct _krb5_response
    {
        int magic;
        ubyte message_type;
        _krb5_data response;
        int expected_nonce;
        int request_time;
    }
    alias krb5_cred_info = _krb5_cred_info;
    struct _krb5_cred_info
    {
        int magic;
        _krb5_keyblock* session;
        krb5_principal_data* client;
        krb5_principal_data* server;
        int flags;
        _krb5_ticket_times times;
        _krb5_address** caddrs;
    }
    alias krb5_cred_enc_part = _krb5_cred_enc_part;
    struct _krb5_cred_enc_part
    {
        int magic;
        int nonce;
        int timestamp;
        int usec;
        _krb5_address* s_address;
        _krb5_address* r_address;
        _krb5_cred_info** ticket_info;
    }
    alias krb5_cred = _krb5_cred;
    struct _krb5_cred
    {
        int magic;
        _krb5_ticket** tickets;
        _krb5_enc_data enc_part;
        _krb5_cred_enc_part* enc_part2;
    }
    alias passwd_phrase_element = _passwd_phrase_element;
    struct _passwd_phrase_element
    {
        int magic;
        _krb5_data* passwd;
        _krb5_data* phrase;
    }
    alias krb5_pwd_data = _krb5_pwd_data;
    struct _krb5_pwd_data
    {
        int magic;
        int sequence_count;
        _passwd_phrase_element** element;
    }
    alias krb5_pa_svr_referral_data = _krb5_pa_svr_referral_data;
    struct _krb5_pa_svr_referral_data
    {
        krb5_principal_data* principal;
    }
    alias krb5_pa_server_referral_data = _krb5_pa_server_referral_data;
    struct _krb5_pa_server_referral_data
    {
        _krb5_data* referred_realm;
        krb5_principal_data* true_principal_name;
        krb5_principal_data* requested_principal_name;
        int referral_valid_until;
        _krb5_checksum rep_cksum;
    }
    alias krb5_pa_pac_req = _krb5_pa_pac_req;
    struct _krb5_pa_pac_req
    {
        uint include_pac;
    }
    void krb5_get_init_creds_opt_set_canonicalize(_krb5_get_init_creds_opt*, int) @nogc nothrow;
    void krb5_get_init_creds_opt_set_proxiable(_krb5_get_init_creds_opt*, int) @nogc nothrow;
    void krb5_get_init_creds_opt_set_forwardable(_krb5_get_init_creds_opt*, int) @nogc nothrow;
    struct krb5_replay_data
    {
        int timestamp;
        int usec;
        uint seq;
    }
    void krb5_get_init_creds_opt_set_renew_life(_krb5_get_init_creds_opt*, int) @nogc nothrow;
    void krb5_get_init_creds_opt_set_tkt_life(_krb5_get_init_creds_opt*, int) @nogc nothrow;
    alias krb5_mk_req_checksum_func = int function(_krb5_context*, _krb5_auth_context*, void*, _krb5_data**);
    alias krb5_cc_cursor = void*;
    struct _krb5_ccache;
    alias krb5_ccache = _krb5_ccache*;
    struct _krb5_cc_ops;
    alias krb5_cc_ops = _krb5_cc_ops;
    struct _krb5_cccol_cursor;
    alias krb5_cccol_cursor = _krb5_cccol_cursor*;
    void krb5_get_init_creds_opt_init(_krb5_get_init_creds_opt*) @nogc nothrow;
    void krb5_get_init_creds_opt_free(_krb5_context*, _krb5_get_init_creds_opt*) @nogc nothrow;
    int krb5_get_init_creds_opt_alloc(_krb5_context*, _krb5_get_init_creds_opt**) @nogc nothrow;
    struct _krb5_get_init_creds_opt
    {
        int flags;
        int tkt_life;
        int renew_life;
        int forwardable;
        int proxiable;
        int* etype_list;
        int etype_list_length;
        _krb5_address** address_list;
        int* preauth_list;
        int preauth_list_length;
        _krb5_data* salt;
    }
    alias krb5_get_init_creds_opt = _krb5_get_init_creds_opt;
    void krb5_responder_pkinit_challenge_free(_krb5_context*, krb5_responder_context_st*, _krb5_responder_pkinit_challenge*) @nogc nothrow;
    int krb5_responder_pkinit_set_answer(_krb5_context*, krb5_responder_context_st*, const(char)*, const(char)*) @nogc nothrow;
    const(char)* krb5_cc_get_name(_krb5_context*, _krb5_ccache*) @nogc nothrow;
    int krb5_cc_get_full_name(_krb5_context*, _krb5_ccache*, char**) @nogc nothrow;
    int krb5_cc_initialize(_krb5_context*, _krb5_ccache*, krb5_principal_data*) @nogc nothrow;
    int krb5_cc_destroy(_krb5_context*, _krb5_ccache*) @nogc nothrow;
    int krb5_cc_close(_krb5_context*, _krb5_ccache*) @nogc nothrow;
    int krb5_cc_store_cred(_krb5_context*, _krb5_ccache*, _krb5_creds*) @nogc nothrow;
    int krb5_cc_retrieve_cred(_krb5_context*, _krb5_ccache*, int, _krb5_creds*, _krb5_creds*) @nogc nothrow;
    int krb5_cc_get_principal(_krb5_context*, _krb5_ccache*, krb5_principal_data**) @nogc nothrow;
    int krb5_cc_start_seq_get(_krb5_context*, _krb5_ccache*, void**) @nogc nothrow;
    int krb5_cc_next_cred(_krb5_context*, _krb5_ccache*, void**, _krb5_creds*) @nogc nothrow;
    int krb5_cc_end_seq_get(_krb5_context*, _krb5_ccache*, void**) @nogc nothrow;
    int krb5_cc_remove_cred(_krb5_context*, _krb5_ccache*, int, _krb5_creds*) @nogc nothrow;
    int krb5_cc_set_flags(_krb5_context*, _krb5_ccache*, int) @nogc nothrow;
    int krb5_cc_get_flags(_krb5_context*, _krb5_ccache*, int*) @nogc nothrow;
    const(char)* krb5_cc_get_type(_krb5_context*, _krb5_ccache*) @nogc nothrow;
    int krb5_cc_move(_krb5_context*, _krb5_ccache*, _krb5_ccache*) @nogc nothrow;
    int krb5_cc_last_change_time(_krb5_context*, _krb5_ccache*, int*) @nogc nothrow;
    int krb5_cc_lock(_krb5_context*, _krb5_ccache*) @nogc nothrow;
    int krb5_cc_unlock(_krb5_context*, _krb5_ccache*) @nogc nothrow;
    int krb5_cccol_cursor_new(_krb5_context*, _krb5_cccol_cursor**) @nogc nothrow;
    int krb5_cccol_cursor_next(_krb5_context*, _krb5_cccol_cursor*, _krb5_ccache**) @nogc nothrow;
    int krb5_cccol_cursor_free(_krb5_context*, _krb5_cccol_cursor**) @nogc nothrow;
    int krb5_cccol_have_content(_krb5_context*) @nogc nothrow;
    int krb5_cccol_last_change_time(_krb5_context*, int*) @nogc nothrow;
    int krb5_cccol_lock(_krb5_context*) @nogc nothrow;
    int krb5_cccol_unlock(_krb5_context*) @nogc nothrow;
    int krb5_cc_new_unique(_krb5_context*, const(char)*, const(char)*, _krb5_ccache**) @nogc nothrow;
    struct krb5_rc_st;
    alias krb5_rcache = krb5_rc_st*;
    alias krb5_kt_cursor = void*;
    alias krb5_keytab_entry = krb5_keytab_entry_st;
    struct krb5_keytab_entry_st
    {
        int magic;
        krb5_principal_data* principal;
        int timestamp;
        uint vno;
        _krb5_keyblock key;
    }
    struct _krb5_kt;
    alias krb5_keytab = _krb5_kt*;
    const(char)* krb5_kt_get_type(_krb5_context*, _krb5_kt*) @nogc nothrow;
    int krb5_kt_get_name(_krb5_context*, _krb5_kt*, char*, uint) @nogc nothrow;
    int krb5_kt_close(_krb5_context*, _krb5_kt*) @nogc nothrow;
    int krb5_kt_get_entry(_krb5_context*, _krb5_kt*, const(krb5_principal_data)*, uint, int, krb5_keytab_entry_st*) @nogc nothrow;
    int krb5_kt_start_seq_get(_krb5_context*, _krb5_kt*, void**) @nogc nothrow;
    int krb5_kt_next_entry(_krb5_context*, _krb5_kt*, krb5_keytab_entry_st*, void**) @nogc nothrow;
    int krb5_kt_end_seq_get(_krb5_context*, _krb5_kt*, void**) @nogc nothrow;
    int krb5_kt_have_content(_krb5_context*, _krb5_kt*) @nogc nothrow;
    int krb5_responder_pkinit_get_challenge(_krb5_context*, krb5_responder_context_st*, _krb5_responder_pkinit_challenge**) @nogc nothrow;
    struct _krb5_responder_pkinit_challenge
    {
        _krb5_responder_pkinit_identity** identities;
    }
    int krb5_init_context(_krb5_context**) @nogc nothrow;
    int krb5_init_secure_context(_krb5_context**) @nogc nothrow;
    int krb5_init_context_profile(_profile_t*, int, _krb5_context**) @nogc nothrow;
    void krb5_free_context(_krb5_context*) @nogc nothrow;
    int krb5_copy_context(_krb5_context*, _krb5_context**) @nogc nothrow;
    int krb5_set_default_tgs_enctypes(_krb5_context*, const(int)*) @nogc nothrow;
    int krb5_get_permitted_enctypes(_krb5_context*, int**) @nogc nothrow;
    uint krb5_is_thread_safe() @nogc nothrow;
    int krb5_server_decrypt_ticket_keytab(_krb5_context*, const(_krb5_kt*), _krb5_ticket*) @nogc nothrow;
    void krb5_free_tgt_creds(_krb5_context*, _krb5_creds**) @nogc nothrow;
    alias krb5_responder_pkinit_challenge = _krb5_responder_pkinit_challenge;
    struct _krb5_responder_pkinit_identity
    {
        char* identity;
        int token_flags;
    }
    alias krb5_responder_pkinit_identity = _krb5_responder_pkinit_identity;
    void krb5_responder_otp_challenge_free(_krb5_context*, krb5_responder_context_st*, _krb5_responder_otp_challenge*) @nogc nothrow;
    int krb5_responder_otp_set_answer(_krb5_context*, krb5_responder_context_st*, c_ulong, const(char)*, const(char)*) @nogc nothrow;
    int krb5_get_credentials(_krb5_context*, int, _krb5_ccache*, _krb5_creds*, _krb5_creds**) @nogc nothrow;
    int krb5_get_credentials_validate(_krb5_context*, int, _krb5_ccache*, _krb5_creds*, _krb5_creds**) @nogc nothrow;
    int krb5_get_credentials_renew(_krb5_context*, int, _krb5_ccache*, _krb5_creds*, _krb5_creds**) @nogc nothrow;
    int krb5_mk_req(_krb5_context*, _krb5_auth_context**, int, const(char)*, const(char)*, _krb5_data*, _krb5_ccache*, _krb5_data*) @nogc nothrow;
    int krb5_mk_req_extended(_krb5_context*, _krb5_auth_context**, int, _krb5_data*, _krb5_creds*, _krb5_data*) @nogc nothrow;
    int krb5_mk_rep(_krb5_context*, _krb5_auth_context*, _krb5_data*) @nogc nothrow;
    int krb5_mk_rep_dce(_krb5_context*, _krb5_auth_context*, _krb5_data*) @nogc nothrow;
    int krb5_rd_rep(_krb5_context*, _krb5_auth_context*, const(_krb5_data)*, _krb5_ap_rep_enc_part**) @nogc nothrow;
    int krb5_rd_rep_dce(_krb5_context*, _krb5_auth_context*, const(_krb5_data)*, uint*) @nogc nothrow;
    int krb5_mk_error(_krb5_context*, const(_krb5_error)*, _krb5_data*) @nogc nothrow;
    int krb5_rd_error(_krb5_context*, const(_krb5_data)*, _krb5_error**) @nogc nothrow;
    int krb5_rd_safe(_krb5_context*, _krb5_auth_context*, const(_krb5_data)*, _krb5_data*, krb5_replay_data*) @nogc nothrow;
    int krb5_rd_priv(_krb5_context*, _krb5_auth_context*, const(_krb5_data)*, _krb5_data*, krb5_replay_data*) @nogc nothrow;
    int krb5_parse_name(_krb5_context*, const(char)*, krb5_principal_data**) @nogc nothrow;
    int krb5_responder_otp_get_challenge(_krb5_context*, krb5_responder_context_st*, _krb5_responder_otp_challenge**) @nogc nothrow;
    struct _krb5_responder_otp_challenge
    {
        char* service;
        _krb5_responder_otp_tokeninfo** tokeninfo;
    }
    alias krb5_responder_otp_challenge = _krb5_responder_otp_challenge;
    int krb5_parse_name_flags(_krb5_context*, const(char)*, int, krb5_principal_data**) @nogc nothrow;
    int krb5_unparse_name(_krb5_context*, const(krb5_principal_data)*, char**) @nogc nothrow;
    int krb5_unparse_name_ext(_krb5_context*, const(krb5_principal_data)*, char**, uint*) @nogc nothrow;
    struct _krb5_responder_otp_tokeninfo
    {
        int flags;
        int format;
        int length;
        char* vendor;
        char* challenge;
        char* token_id;
        char* alg_id;
    }
    alias krb5_responder_otp_tokeninfo = _krb5_responder_otp_tokeninfo;
    int krb5_unparse_name_flags(_krb5_context*, const(krb5_principal_data)*, int, char**) @nogc nothrow;
    int krb5_unparse_name_flags_ext(_krb5_context*, const(krb5_principal_data)*, int, char**, uint*) @nogc nothrow;
    int krb5_set_principal_realm(_krb5_context*, krb5_principal_data*, const(char)*) @nogc nothrow;
    uint krb5_address_search(_krb5_context*, const(_krb5_address)*, _krb5_address**) @nogc nothrow;
    uint krb5_address_compare(_krb5_context*, const(_krb5_address)*, const(_krb5_address)*) @nogc nothrow;
    int krb5_address_order(_krb5_context*, const(_krb5_address)*, const(_krb5_address)*) @nogc nothrow;
    uint krb5_realm_compare(_krb5_context*, const(krb5_principal_data)*, const(krb5_principal_data)*) @nogc nothrow;
    uint krb5_principal_compare(_krb5_context*, const(krb5_principal_data)*, const(krb5_principal_data)*) @nogc nothrow;
    uint krb5_principal_compare_any_realm(_krb5_context*, const(krb5_principal_data)*, const(krb5_principal_data)*) @nogc nothrow;
    alias krb5_responder_fn = int function(_krb5_context*, void*, krb5_responder_context_st*);
    int krb5_responder_set_answer(_krb5_context*, krb5_responder_context_st*, const(char)*, const(char)*) @nogc nothrow;
    uint krb5_principal_compare_flags(_krb5_context*, const(krb5_principal_data)*, const(krb5_principal_data)*, int) @nogc nothrow;
    int krb5_init_keyblock(_krb5_context*, int, c_ulong, _krb5_keyblock**) @nogc nothrow;
    int krb5_copy_keyblock(_krb5_context*, const(_krb5_keyblock)*, _krb5_keyblock**) @nogc nothrow;
    int krb5_copy_keyblock_contents(_krb5_context*, const(_krb5_keyblock)*, _krb5_keyblock*) @nogc nothrow;
    int krb5_copy_creds(_krb5_context*, const(_krb5_creds)*, _krb5_creds**) @nogc nothrow;
    int krb5_copy_data(_krb5_context*, const(_krb5_data)*, _krb5_data**) @nogc nothrow;
    int krb5_copy_principal(_krb5_context*, const(krb5_principal_data)*, krb5_principal_data**) @nogc nothrow;
    int krb5_copy_addresses(_krb5_context*, _krb5_address**, _krb5_address***) @nogc nothrow;
    int krb5_copy_ticket(_krb5_context*, const(_krb5_ticket)*, _krb5_ticket**) @nogc nothrow;
    int krb5_copy_authdata(_krb5_context*, _krb5_authdata**, _krb5_authdata***) @nogc nothrow;
    int krb5_find_authdata(_krb5_context*, _krb5_authdata**, _krb5_authdata**, int, _krb5_authdata***) @nogc nothrow;
    int krb5_merge_authdata(_krb5_context*, _krb5_authdata**, _krb5_authdata**, _krb5_authdata***) @nogc nothrow;
    int krb5_copy_authenticator(_krb5_context*, const(_krb5_authenticator)*, _krb5_authenticator**) @nogc nothrow;
    int krb5_copy_checksum(_krb5_context*, const(_krb5_checksum)*, _krb5_checksum**) @nogc nothrow;
    int krb5_get_server_rcache(_krb5_context*, const(_krb5_data)*, krb5_rc_st**) @nogc nothrow;
    int krb5_build_principal_ext(_krb5_context*, krb5_principal_data**, uint, const(char)*, ...) @nogc nothrow;
    int krb5_build_principal(_krb5_context*, krb5_principal_data**, uint, const(char)*, ...) @nogc nothrow;
    int krb5_build_principal_alloc_va(_krb5_context*, krb5_principal_data**, uint, const(char)*, va_list*) @nogc nothrow;
    int krb5_425_conv_principal(_krb5_context*, const(char)*, const(char)*, const(char)*, krb5_principal_data**) @nogc nothrow;
    int krb5_524_conv_principal(_krb5_context*, const(krb5_principal_data)*, char*, char*, char*) @nogc nothrow;
    struct credentials;
    int krb5_524_convert_creds(_krb5_context*, _krb5_creds*, credentials*) @nogc nothrow;
    int krb5_kt_resolve(_krb5_context*, const(char)*, _krb5_kt**) @nogc nothrow;
    int krb5_kt_dup(_krb5_context*, _krb5_kt*, _krb5_kt**) @nogc nothrow;
    int krb5_kt_default_name(_krb5_context*, char*, int) @nogc nothrow;
    int krb5_kt_default(_krb5_context*, _krb5_kt**) @nogc nothrow;
    int krb5_kt_client_default(_krb5_context*, _krb5_kt**) @nogc nothrow;
    int krb5_free_keytab_entry_contents(_krb5_context*, krb5_keytab_entry_st*) @nogc nothrow;
    int krb5_kt_free_entry(_krb5_context*, krb5_keytab_entry_st*) @nogc nothrow;
    int krb5_kt_remove_entry(_krb5_context*, _krb5_kt*, krb5_keytab_entry_st*) @nogc nothrow;
    int krb5_kt_add_entry(_krb5_context*, _krb5_kt*, krb5_keytab_entry_st*) @nogc nothrow;
    int krb5_principal2salt(_krb5_context*, const(krb5_principal_data)*, _krb5_data*) @nogc nothrow;
    int krb5_cc_resolve(_krb5_context*, const(char)*, _krb5_ccache**) @nogc nothrow;
    int krb5_cc_dup(_krb5_context*, _krb5_ccache*, _krb5_ccache**) @nogc nothrow;
    const(char)* krb5_cc_default_name(_krb5_context*) @nogc nothrow;
    int krb5_cc_set_default_name(_krb5_context*, const(char)*) @nogc nothrow;
    int krb5_cc_default(_krb5_context*, _krb5_ccache**) @nogc nothrow;
    int krb5_cc_copy_creds(_krb5_context*, _krb5_ccache*, _krb5_ccache*) @nogc nothrow;
    int krb5_cc_get_config(_krb5_context*, _krb5_ccache*, const(krb5_principal_data)*, const(char)*, _krb5_data*) @nogc nothrow;
    int krb5_cc_set_config(_krb5_context*, _krb5_ccache*, const(krb5_principal_data)*, const(char)*, _krb5_data*) @nogc nothrow;
    uint krb5_is_config_principal(_krb5_context*, const(krb5_principal_data)*) @nogc nothrow;
    int krb5_cc_switch(_krb5_context*, _krb5_ccache*) @nogc nothrow;
    uint krb5_cc_support_switch(_krb5_context*, const(char)*) @nogc nothrow;
    int krb5_cc_cache_match(_krb5_context*, krb5_principal_data*, _krb5_ccache**) @nogc nothrow;
    int krb5_cc_select(_krb5_context*, krb5_principal_data*, _krb5_ccache**, krb5_principal_data**) @nogc nothrow;
    void krb5_free_principal(_krb5_context*, krb5_principal_data*) @nogc nothrow;
    void krb5_free_authenticator(_krb5_context*, _krb5_authenticator*) @nogc nothrow;
    void krb5_free_addresses(_krb5_context*, _krb5_address**) @nogc nothrow;
    void krb5_free_authdata(_krb5_context*, _krb5_authdata**) @nogc nothrow;
    void krb5_free_ticket(_krb5_context*, _krb5_ticket*) @nogc nothrow;
    void krb5_free_error(_krb5_context*, _krb5_error*) @nogc nothrow;
    void krb5_free_creds(_krb5_context*, _krb5_creds*) @nogc nothrow;
    void krb5_free_cred_contents(_krb5_context*, _krb5_creds*) @nogc nothrow;
    void krb5_free_checksum(_krb5_context*, _krb5_checksum*) @nogc nothrow;
    void krb5_free_checksum_contents(_krb5_context*, _krb5_checksum*) @nogc nothrow;
    void krb5_free_keyblock(_krb5_context*, _krb5_keyblock*) @nogc nothrow;
    void krb5_free_keyblock_contents(_krb5_context*, _krb5_keyblock*) @nogc nothrow;
    void krb5_free_ap_rep_enc_part(_krb5_context*, _krb5_ap_rep_enc_part*) @nogc nothrow;
    void krb5_free_data(_krb5_context*, _krb5_data*) @nogc nothrow;
    void krb5_free_octet_data(_krb5_context*, _krb5_octet_data*) @nogc nothrow;
    void krb5_free_data_contents(_krb5_context*, _krb5_data*) @nogc nothrow;
    void krb5_free_unparsed_name(_krb5_context*, char*) @nogc nothrow;
    void krb5_free_string(_krb5_context*, char*) @nogc nothrow;
    void krb5_free_enctypes(_krb5_context*, int*) @nogc nothrow;
    void krb5_free_cksumtypes(_krb5_context*, int*) @nogc nothrow;
    int krb5_us_timeofday(_krb5_context*, int*, int*) @nogc nothrow;
    int krb5_timeofday(_krb5_context*, int*) @nogc nothrow;
    int krb5_check_clockskew(_krb5_context*, int) @nogc nothrow;
    int krb5_os_localaddr(_krb5_context*, _krb5_address***) @nogc nothrow;
    int krb5_get_default_realm(_krb5_context*, char**) @nogc nothrow;
    int krb5_set_default_realm(_krb5_context*, const(char)*) @nogc nothrow;
    void krb5_free_default_realm(_krb5_context*, char*) @nogc nothrow;
    int krb5_expand_hostname(_krb5_context*, const(char)*, char**) @nogc nothrow;
    int krb5_sname_to_principal(_krb5_context*, const(char)*, const(char)*, int, krb5_principal_data**) @nogc nothrow;
    uint krb5_sname_match(_krb5_context*, const(krb5_principal_data)*, const(krb5_principal_data)*) @nogc nothrow;
    int krb5_change_password(_krb5_context*, _krb5_creds*, const(char)*, int*, _krb5_data*, _krb5_data*) @nogc nothrow;
    int krb5_set_password(_krb5_context*, _krb5_creds*, const(char)*, krb5_principal_data*, int*, _krb5_data*, _krb5_data*) @nogc nothrow;
    int krb5_set_password_using_ccache(_krb5_context*, _krb5_ccache*, const(char)*, krb5_principal_data*, int*, _krb5_data*, _krb5_data*) @nogc nothrow;
    int krb5_chpw_message(_krb5_context*, const(_krb5_data)*, char**) @nogc nothrow;
    int krb5_get_profile(_krb5_context*, _profile_t**) @nogc nothrow;
    int krb5_rd_req(_krb5_context*, _krb5_auth_context**, const(_krb5_data)*, const(krb5_principal_data)*, _krb5_kt*, int*, _krb5_ticket**) @nogc nothrow;
    int krb5_kt_read_service_key(_krb5_context*, void*, krb5_principal_data*, uint, int, _krb5_keyblock**) @nogc nothrow;
    int krb5_mk_safe(_krb5_context*, _krb5_auth_context*, const(_krb5_data)*, _krb5_data*, krb5_replay_data*) @nogc nothrow;
    int krb5_mk_priv(_krb5_context*, _krb5_auth_context*, const(_krb5_data)*, _krb5_data*, krb5_replay_data*) @nogc nothrow;
    int krb5_sendauth(_krb5_context*, _krb5_auth_context**, void*, char*, krb5_principal_data*, krb5_principal_data*, int, _krb5_data*, _krb5_creds*, _krb5_ccache*, _krb5_error**, _krb5_ap_rep_enc_part**, _krb5_creds**) @nogc nothrow;
    int krb5_recvauth(_krb5_context*, _krb5_auth_context**, void*, char*, krb5_principal_data*, int, _krb5_kt*, _krb5_ticket**) @nogc nothrow;
    int krb5_recvauth_version(_krb5_context*, _krb5_auth_context**, void*, krb5_principal_data*, int, _krb5_kt*, _krb5_ticket**, _krb5_data*) @nogc nothrow;
    int krb5_mk_ncred(_krb5_context*, _krb5_auth_context*, _krb5_creds**, _krb5_data**, krb5_replay_data*) @nogc nothrow;
    int krb5_mk_1cred(_krb5_context*, _krb5_auth_context*, _krb5_creds*, _krb5_data**, krb5_replay_data*) @nogc nothrow;
    int krb5_rd_cred(_krb5_context*, _krb5_auth_context*, _krb5_data*, _krb5_creds***, krb5_replay_data*) @nogc nothrow;
    int krb5_fwd_tgt_creds(_krb5_context*, _krb5_auth_context*, const(char)*, krb5_principal_data*, krb5_principal_data*, _krb5_ccache*, int, _krb5_data*) @nogc nothrow;
    int krb5_auth_con_init(_krb5_context*, _krb5_auth_context**) @nogc nothrow;
    int krb5_auth_con_free(_krb5_context*, _krb5_auth_context*) @nogc nothrow;
    int krb5_auth_con_setflags(_krb5_context*, _krb5_auth_context*, int) @nogc nothrow;
    int krb5_auth_con_getflags(_krb5_context*, _krb5_auth_context*, int*) @nogc nothrow;
    int krb5_auth_con_set_checksum_func(_krb5_context*, _krb5_auth_context*, int function(_krb5_context*, _krb5_auth_context*, void*, _krb5_data**), void*) @nogc nothrow;
    int krb5_auth_con_get_checksum_func(_krb5_context*, _krb5_auth_context*, int function(_krb5_context*, _krb5_auth_context*, void*, _krb5_data**)*, void**) @nogc nothrow;
    int krb5_auth_con_setaddrs(_krb5_context*, _krb5_auth_context*, _krb5_address*, _krb5_address*) @nogc nothrow;
    int krb5_auth_con_getaddrs(_krb5_context*, _krb5_auth_context*, _krb5_address**, _krb5_address**) @nogc nothrow;
    int krb5_auth_con_setports(_krb5_context*, _krb5_auth_context*, _krb5_address*, _krb5_address*) @nogc nothrow;
    int krb5_auth_con_setuseruserkey(_krb5_context*, _krb5_auth_context*, _krb5_keyblock*) @nogc nothrow;
    int krb5_auth_con_getkey(_krb5_context*, _krb5_auth_context*, _krb5_keyblock**) @nogc nothrow;
    int krb5_auth_con_getkey_k(_krb5_context*, _krb5_auth_context*, krb5_key_st**) @nogc nothrow;
    int krb5_auth_con_getsendsubkey(_krb5_context*, _krb5_auth_context*, _krb5_keyblock**) @nogc nothrow;
    int krb5_auth_con_getsendsubkey_k(_krb5_context*, _krb5_auth_context*, krb5_key_st**) @nogc nothrow;
    int krb5_auth_con_getrecvsubkey(_krb5_context*, _krb5_auth_context*, _krb5_keyblock**) @nogc nothrow;
    int krb5_auth_con_getrecvsubkey_k(_krb5_context*, _krb5_auth_context*, krb5_key_st**) @nogc nothrow;
    int krb5_auth_con_setsendsubkey(_krb5_context*, _krb5_auth_context*, _krb5_keyblock*) @nogc nothrow;
    int krb5_auth_con_setsendsubkey_k(_krb5_context*, _krb5_auth_context*, krb5_key_st*) @nogc nothrow;
    int krb5_auth_con_setrecvsubkey(_krb5_context*, _krb5_auth_context*, _krb5_keyblock*) @nogc nothrow;
    int krb5_auth_con_setrecvsubkey_k(_krb5_context*, _krb5_auth_context*, krb5_key_st*) @nogc nothrow;
    int krb5_auth_con_getlocalseqnumber(_krb5_context*, _krb5_auth_context*, int*) @nogc nothrow;
    int krb5_auth_con_getremoteseqnumber(_krb5_context*, _krb5_auth_context*, int*) @nogc nothrow;
    int krb5_auth_con_initivector(_krb5_context*, _krb5_auth_context*) @nogc nothrow;
    int krb5_auth_con_setrcache(_krb5_context*, _krb5_auth_context*, krb5_rc_st*) @nogc nothrow;
    int krb5_auth_con_getrcache(_krb5_context*, _krb5_auth_context*, krb5_rc_st**) @nogc nothrow;
    int krb5_auth_con_getauthenticator(_krb5_context*, _krb5_auth_context*, _krb5_authenticator**) @nogc nothrow;
    int krb5_auth_con_set_req_cksumtype(_krb5_context*, _krb5_auth_context*, int) @nogc nothrow;
    const(char)* krb5_responder_get_challenge(_krb5_context*, krb5_responder_context_st*, const(char)*) @nogc nothrow;
    int krb5_read_password(_krb5_context*, const(char)*, const(char)*, char*, uint*) @nogc nothrow;
    int krb5_aname_to_localname(_krb5_context*, const(krb5_principal_data)*, int, char*) @nogc nothrow;
    int krb5_get_host_realm(_krb5_context*, const(char)*, char***) @nogc nothrow;
    int krb5_get_fallback_host_realm(_krb5_context*, _krb5_data*, char***) @nogc nothrow;
    int krb5_free_host_realm(_krb5_context*, char**) @nogc nothrow;
    uint krb5_kuserok(_krb5_context*, krb5_principal_data*, const(char)*) @nogc nothrow;
    int krb5_auth_con_genaddrs(_krb5_context*, _krb5_auth_context*, int, int) @nogc nothrow;
    int krb5_set_real_time(_krb5_context*, int, int) @nogc nothrow;
    int krb5_get_time_offsets(_krb5_context*, int*, int*) @nogc nothrow;
    int krb5_string_to_enctype(char*, int*) @nogc nothrow;
    int krb5_string_to_salttype(char*, int*) @nogc nothrow;
    int krb5_string_to_cksumtype(char*, int*) @nogc nothrow;
    int krb5_string_to_timestamp(char*, int*) @nogc nothrow;
    int krb5_string_to_deltat(char*, int*) @nogc nothrow;
    int krb5_enctype_to_string(int, char*, c_ulong) @nogc nothrow;
    int krb5_enctype_to_name(int, uint, char*, c_ulong) @nogc nothrow;
    int krb5_salttype_to_string(int, char*, c_ulong) @nogc nothrow;
    int krb5_cksumtype_to_string(int, char*, c_ulong) @nogc nothrow;
    int krb5_timestamp_to_string(int, char*, c_ulong) @nogc nothrow;
    int krb5_timestamp_to_sfstring(int, char*, c_ulong, char*) @nogc nothrow;
    int krb5_deltat_to_string(int, char*, c_ulong) @nogc nothrow;
    const(const(char)*)* krb5_responder_list_questions(_krb5_context*, krb5_responder_context_st*) @nogc nothrow;
    struct krb5_responder_context_st;
    alias krb5_responder_context = krb5_responder_context_st*;
    alias krb5_prompt = _krb5_prompt;
    struct _krb5_prompt
    {
        char* prompt;
        int hidden;
        _krb5_data* reply;
    }
    alias krb5_prompter_fct = int function(_krb5_context*, void*, const(char)*, const(char)*, int, _krb5_prompt*);
    int krb5_prompter_posix(_krb5_context*, void*, const(char)*, const(char)*, int, _krb5_prompt*) @nogc nothrow;



    static if(!is(typeof(KRB5_RESPONDER_QUESTION_PASSWORD))) {
        private enum enumMixinStr_KRB5_RESPONDER_QUESTION_PASSWORD = `enum KRB5_RESPONDER_QUESTION_PASSWORD = "password";`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_QUESTION_PASSWORD); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_QUESTION_PASSWORD);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_QUESTION_OTP))) {
        private enum enumMixinStr_KRB5_RESPONDER_QUESTION_OTP = `enum KRB5_RESPONDER_QUESTION_OTP = "otp";`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_QUESTION_OTP); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_QUESTION_OTP);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_OTP_FORMAT_DECIMAL))) {
        private enum enumMixinStr_KRB5_RESPONDER_OTP_FORMAT_DECIMAL = `enum KRB5_RESPONDER_OTP_FORMAT_DECIMAL = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_OTP_FORMAT_DECIMAL); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_OTP_FORMAT_DECIMAL);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_OTP_FORMAT_HEXADECIMAL))) {
        private enum enumMixinStr_KRB5_RESPONDER_OTP_FORMAT_HEXADECIMAL = `enum KRB5_RESPONDER_OTP_FORMAT_HEXADECIMAL = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_OTP_FORMAT_HEXADECIMAL); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_OTP_FORMAT_HEXADECIMAL);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_OTP_FORMAT_ALPHANUMERIC))) {
        private enum enumMixinStr_KRB5_RESPONDER_OTP_FORMAT_ALPHANUMERIC = `enum KRB5_RESPONDER_OTP_FORMAT_ALPHANUMERIC = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_OTP_FORMAT_ALPHANUMERIC); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_OTP_FORMAT_ALPHANUMERIC);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_OTP_FLAGS_COLLECT_TOKEN))) {
        private enum enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_COLLECT_TOKEN = `enum KRB5_RESPONDER_OTP_FLAGS_COLLECT_TOKEN = 0x0001;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_COLLECT_TOKEN); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_COLLECT_TOKEN);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_OTP_FLAGS_COLLECT_PIN))) {
        private enum enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_COLLECT_PIN = `enum KRB5_RESPONDER_OTP_FLAGS_COLLECT_PIN = 0x0002;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_COLLECT_PIN); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_COLLECT_PIN);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_OTP_FLAGS_NEXTOTP))) {
        private enum enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_NEXTOTP = `enum KRB5_RESPONDER_OTP_FLAGS_NEXTOTP = 0x0004;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_NEXTOTP); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_NEXTOTP);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_OTP_FLAGS_SEPARATE_PIN))) {
        private enum enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_SEPARATE_PIN = `enum KRB5_RESPONDER_OTP_FLAGS_SEPARATE_PIN = 0x0008;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_SEPARATE_PIN); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_SEPARATE_PIN);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_QUESTION_PKINIT))) {
        private enum enumMixinStr_KRB5_RESPONDER_QUESTION_PKINIT = `enum KRB5_RESPONDER_QUESTION_PKINIT = "pkinit";`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_QUESTION_PKINIT); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_QUESTION_PKINIT);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_COUNT_LOW))) {
        private enum enumMixinStr_KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_COUNT_LOW = `enum KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_COUNT_LOW = ( 1 << 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_COUNT_LOW); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_COUNT_LOW);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_FINAL_TRY))) {
        private enum enumMixinStr_KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_FINAL_TRY = `enum KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_FINAL_TRY = ( 1 << 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_FINAL_TRY); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_FINAL_TRY);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_LOCKED))) {
        private enum enumMixinStr_KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_LOCKED = `enum KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_LOCKED = ( 1 << 2 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_LOCKED); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_LOCKED);
        }
    }




    static if(!is(typeof(KRB5_RECVAUTH_BADAUTHVERS))) {
        private enum enumMixinStr_KRB5_RECVAUTH_BADAUTHVERS = `enum KRB5_RECVAUTH_BADAUTHVERS = 0x0002;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RECVAUTH_BADAUTHVERS); }))) {
            mixin(enumMixinStr_KRB5_RECVAUTH_BADAUTHVERS);
        }
    }




    static if(!is(typeof(KRB5_RECVAUTH_SKIP_VERSION))) {
        private enum enumMixinStr_KRB5_RECVAUTH_SKIP_VERSION = `enum KRB5_RECVAUTH_SKIP_VERSION = 0x0001;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RECVAUTH_SKIP_VERSION); }))) {
            mixin(enumMixinStr_KRB5_RECVAUTH_SKIP_VERSION);
        }
    }




    static if(!is(typeof(KRB5_TGS_NAME_SIZE))) {
        private enum enumMixinStr_KRB5_TGS_NAME_SIZE = `enum KRB5_TGS_NAME_SIZE = 6;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TGS_NAME_SIZE); }))) {
            mixin(enumMixinStr_KRB5_TGS_NAME_SIZE);
        }
    }




    static if(!is(typeof(KRB5_TGS_NAME))) {
        private enum enumMixinStr_KRB5_TGS_NAME = `enum KRB5_TGS_NAME = "krbtgt";`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TGS_NAME); }))) {
            mixin(enumMixinStr_KRB5_TGS_NAME);
        }
    }




    static if(!is(typeof(KRB5_REALM_BRANCH_CHAR))) {
        private enum enumMixinStr_KRB5_REALM_BRANCH_CHAR = `enum KRB5_REALM_BRANCH_CHAR = '.';`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_REALM_BRANCH_CHAR); }))) {
            mixin(enumMixinStr_KRB5_REALM_BRANCH_CHAR);
        }
    }




    static if(!is(typeof(KRB5_PRINCIPAL_COMPARE_UTF8))) {
        private enum enumMixinStr_KRB5_PRINCIPAL_COMPARE_UTF8 = `enum KRB5_PRINCIPAL_COMPARE_UTF8 = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PRINCIPAL_COMPARE_UTF8); }))) {
            mixin(enumMixinStr_KRB5_PRINCIPAL_COMPARE_UTF8);
        }
    }




    static if(!is(typeof(KRB5_PRINCIPAL_COMPARE_CASEFOLD))) {
        private enum enumMixinStr_KRB5_PRINCIPAL_COMPARE_CASEFOLD = `enum KRB5_PRINCIPAL_COMPARE_CASEFOLD = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PRINCIPAL_COMPARE_CASEFOLD); }))) {
            mixin(enumMixinStr_KRB5_PRINCIPAL_COMPARE_CASEFOLD);
        }
    }




    static if(!is(typeof(KRB5_PRINCIPAL_COMPARE_ENTERPRISE))) {
        private enum enumMixinStr_KRB5_PRINCIPAL_COMPARE_ENTERPRISE = `enum KRB5_PRINCIPAL_COMPARE_ENTERPRISE = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PRINCIPAL_COMPARE_ENTERPRISE); }))) {
            mixin(enumMixinStr_KRB5_PRINCIPAL_COMPARE_ENTERPRISE);
        }
    }




    static if(!is(typeof(KRB5_PRINCIPAL_COMPARE_IGNORE_REALM))) {
        private enum enumMixinStr_KRB5_PRINCIPAL_COMPARE_IGNORE_REALM = `enum KRB5_PRINCIPAL_COMPARE_IGNORE_REALM = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PRINCIPAL_COMPARE_IGNORE_REALM); }))) {
            mixin(enumMixinStr_KRB5_PRINCIPAL_COMPARE_IGNORE_REALM);
        }
    }




    static if(!is(typeof(KRB5_PRINCIPAL_UNPARSE_DISPLAY))) {
        private enum enumMixinStr_KRB5_PRINCIPAL_UNPARSE_DISPLAY = `enum KRB5_PRINCIPAL_UNPARSE_DISPLAY = 0x4;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PRINCIPAL_UNPARSE_DISPLAY); }))) {
            mixin(enumMixinStr_KRB5_PRINCIPAL_UNPARSE_DISPLAY);
        }
    }




    static if(!is(typeof(KRB5_PRINCIPAL_UNPARSE_NO_REALM))) {
        private enum enumMixinStr_KRB5_PRINCIPAL_UNPARSE_NO_REALM = `enum KRB5_PRINCIPAL_UNPARSE_NO_REALM = 0x2;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PRINCIPAL_UNPARSE_NO_REALM); }))) {
            mixin(enumMixinStr_KRB5_PRINCIPAL_UNPARSE_NO_REALM);
        }
    }




    static if(!is(typeof(KRB5_PRINCIPAL_UNPARSE_SHORT))) {
        private enum enumMixinStr_KRB5_PRINCIPAL_UNPARSE_SHORT = `enum KRB5_PRINCIPAL_UNPARSE_SHORT = 0x1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PRINCIPAL_UNPARSE_SHORT); }))) {
            mixin(enumMixinStr_KRB5_PRINCIPAL_UNPARSE_SHORT);
        }
    }




    static if(!is(typeof(KRB5_PRINCIPAL_PARSE_IGNORE_REALM))) {
        private enum enumMixinStr_KRB5_PRINCIPAL_PARSE_IGNORE_REALM = `enum KRB5_PRINCIPAL_PARSE_IGNORE_REALM = 0x8;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PRINCIPAL_PARSE_IGNORE_REALM); }))) {
            mixin(enumMixinStr_KRB5_PRINCIPAL_PARSE_IGNORE_REALM);
        }
    }




    static if(!is(typeof(KRB5_PRINCIPAL_PARSE_ENTERPRISE))) {
        private enum enumMixinStr_KRB5_PRINCIPAL_PARSE_ENTERPRISE = `enum KRB5_PRINCIPAL_PARSE_ENTERPRISE = 0x4;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PRINCIPAL_PARSE_ENTERPRISE); }))) {
            mixin(enumMixinStr_KRB5_PRINCIPAL_PARSE_ENTERPRISE);
        }
    }




    static if(!is(typeof(KRB5_PRINCIPAL_PARSE_REQUIRE_REALM))) {
        private enum enumMixinStr_KRB5_PRINCIPAL_PARSE_REQUIRE_REALM = `enum KRB5_PRINCIPAL_PARSE_REQUIRE_REALM = 0x2;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PRINCIPAL_PARSE_REQUIRE_REALM); }))) {
            mixin(enumMixinStr_KRB5_PRINCIPAL_PARSE_REQUIRE_REALM);
        }
    }




    static if(!is(typeof(KRB5_PRINCIPAL_PARSE_NO_REALM))) {
        private enum enumMixinStr_KRB5_PRINCIPAL_PARSE_NO_REALM = `enum KRB5_PRINCIPAL_PARSE_NO_REALM = 0x1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PRINCIPAL_PARSE_NO_REALM); }))) {
            mixin(enumMixinStr_KRB5_PRINCIPAL_PARSE_NO_REALM);
        }
    }




    static if(!is(typeof(KRB5_GC_CONSTRAINED_DELEGATION))) {
        private enum enumMixinStr_KRB5_GC_CONSTRAINED_DELEGATION = `enum KRB5_GC_CONSTRAINED_DELEGATION = 64;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GC_CONSTRAINED_DELEGATION); }))) {
            mixin(enumMixinStr_KRB5_GC_CONSTRAINED_DELEGATION);
        }
    }




    static if(!is(typeof(KRB5_GC_NO_TRANSIT_CHECK))) {
        private enum enumMixinStr_KRB5_GC_NO_TRANSIT_CHECK = `enum KRB5_GC_NO_TRANSIT_CHECK = 32;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GC_NO_TRANSIT_CHECK); }))) {
            mixin(enumMixinStr_KRB5_GC_NO_TRANSIT_CHECK);
        }
    }




    static if(!is(typeof(KRB5_GC_FORWARDABLE))) {
        private enum enumMixinStr_KRB5_GC_FORWARDABLE = `enum KRB5_GC_FORWARDABLE = 16;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GC_FORWARDABLE); }))) {
            mixin(enumMixinStr_KRB5_GC_FORWARDABLE);
        }
    }




    static if(!is(typeof(KRB5_GC_NO_STORE))) {
        private enum enumMixinStr_KRB5_GC_NO_STORE = `enum KRB5_GC_NO_STORE = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GC_NO_STORE); }))) {
            mixin(enumMixinStr_KRB5_GC_NO_STORE);
        }
    }




    static if(!is(typeof(KRB5_GC_CANONICALIZE))) {
        private enum enumMixinStr_KRB5_GC_CANONICALIZE = `enum KRB5_GC_CANONICALIZE = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GC_CANONICALIZE); }))) {
            mixin(enumMixinStr_KRB5_GC_CANONICALIZE);
        }
    }




    static if(!is(typeof(KRB5_GC_CACHED))) {
        private enum enumMixinStr_KRB5_GC_CACHED = `enum KRB5_GC_CACHED = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GC_CACHED); }))) {
            mixin(enumMixinStr_KRB5_GC_CACHED);
        }
    }




    static if(!is(typeof(KRB5_GC_USER_USER))) {
        private enum enumMixinStr_KRB5_GC_USER_USER = `enum KRB5_GC_USER_USER = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GC_USER_USER); }))) {
            mixin(enumMixinStr_KRB5_GC_USER_USER);
        }
    }




    static if(!is(typeof(KRB5_INIT_CONTEXT_KDC))) {
        private enum enumMixinStr_KRB5_INIT_CONTEXT_KDC = `enum KRB5_INIT_CONTEXT_KDC = 0x2;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_INIT_CONTEXT_KDC); }))) {
            mixin(enumMixinStr_KRB5_INIT_CONTEXT_KDC);
        }
    }




    static if(!is(typeof(KRB5_INIT_CONTEXT_SECURE))) {
        private enum enumMixinStr_KRB5_INIT_CONTEXT_SECURE = `enum KRB5_INIT_CONTEXT_SECURE = 0x1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_INIT_CONTEXT_SECURE); }))) {
            mixin(enumMixinStr_KRB5_INIT_CONTEXT_SECURE);
        }
    }




    static if(!is(typeof(MAX_KEYTAB_NAME_LEN))) {
        private enum enumMixinStr_MAX_KEYTAB_NAME_LEN = `enum MAX_KEYTAB_NAME_LEN = 1100;`;
        static if(is(typeof({ mixin(enumMixinStr_MAX_KEYTAB_NAME_LEN); }))) {
            mixin(enumMixinStr_MAX_KEYTAB_NAME_LEN);
        }
    }




    static if(!is(typeof(KRB5_TC_NOTICKET))) {
        private enum enumMixinStr_KRB5_TC_NOTICKET = `enum KRB5_TC_NOTICKET = 0x00000002;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TC_NOTICKET); }))) {
            mixin(enumMixinStr_KRB5_TC_NOTICKET);
        }
    }




    static if(!is(typeof(KRB5_TC_OPENCLOSE))) {
        private enum enumMixinStr_KRB5_TC_OPENCLOSE = `enum KRB5_TC_OPENCLOSE = 0x00000001;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TC_OPENCLOSE); }))) {
            mixin(enumMixinStr_KRB5_TC_OPENCLOSE);
        }
    }




    static if(!is(typeof(KRB5_TC_SUPPORTED_KTYPES))) {
        private enum enumMixinStr_KRB5_TC_SUPPORTED_KTYPES = `enum KRB5_TC_SUPPORTED_KTYPES = 0x00000200;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TC_SUPPORTED_KTYPES); }))) {
            mixin(enumMixinStr_KRB5_TC_SUPPORTED_KTYPES);
        }
    }




    static if(!is(typeof(KRB5_TC_MATCH_KTYPE))) {
        private enum enumMixinStr_KRB5_TC_MATCH_KTYPE = `enum KRB5_TC_MATCH_KTYPE = 0x00000100;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TC_MATCH_KTYPE); }))) {
            mixin(enumMixinStr_KRB5_TC_MATCH_KTYPE);
        }
    }




    static if(!is(typeof(KRB5_TC_MATCH_2ND_TKT))) {
        private enum enumMixinStr_KRB5_TC_MATCH_2ND_TKT = `enum KRB5_TC_MATCH_2ND_TKT = 0x00000080;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TC_MATCH_2ND_TKT); }))) {
            mixin(enumMixinStr_KRB5_TC_MATCH_2ND_TKT);
        }
    }




    static if(!is(typeof(KRB5_TC_MATCH_SRV_NAMEONLY))) {
        private enum enumMixinStr_KRB5_TC_MATCH_SRV_NAMEONLY = `enum KRB5_TC_MATCH_SRV_NAMEONLY = 0x00000040;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TC_MATCH_SRV_NAMEONLY); }))) {
            mixin(enumMixinStr_KRB5_TC_MATCH_SRV_NAMEONLY);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_TKT_LIFE))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_TKT_LIFE = `enum KRB5_GET_INIT_CREDS_OPT_TKT_LIFE = 0x0001;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_TKT_LIFE); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_TKT_LIFE);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_RENEW_LIFE))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_RENEW_LIFE = `enum KRB5_GET_INIT_CREDS_OPT_RENEW_LIFE = 0x0002;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_RENEW_LIFE); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_RENEW_LIFE);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_FORWARDABLE))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_FORWARDABLE = `enum KRB5_GET_INIT_CREDS_OPT_FORWARDABLE = 0x0004;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_FORWARDABLE); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_FORWARDABLE);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_PROXIABLE))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_PROXIABLE = `enum KRB5_GET_INIT_CREDS_OPT_PROXIABLE = 0x0008;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_PROXIABLE); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_PROXIABLE);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_ETYPE_LIST))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_ETYPE_LIST = `enum KRB5_GET_INIT_CREDS_OPT_ETYPE_LIST = 0x0010;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_ETYPE_LIST); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_ETYPE_LIST);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_ADDRESS_LIST))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_ADDRESS_LIST = `enum KRB5_GET_INIT_CREDS_OPT_ADDRESS_LIST = 0x0020;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_ADDRESS_LIST); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_ADDRESS_LIST);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_PREAUTH_LIST))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_PREAUTH_LIST = `enum KRB5_GET_INIT_CREDS_OPT_PREAUTH_LIST = 0x0040;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_PREAUTH_LIST); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_PREAUTH_LIST);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_SALT))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_SALT = `enum KRB5_GET_INIT_CREDS_OPT_SALT = 0x0080;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_SALT); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_SALT);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_CHG_PWD_PRMPT))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_CHG_PWD_PRMPT = `enum KRB5_GET_INIT_CREDS_OPT_CHG_PWD_PRMPT = 0x0100;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_CHG_PWD_PRMPT); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_CHG_PWD_PRMPT);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_CANONICALIZE))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_CANONICALIZE = `enum KRB5_GET_INIT_CREDS_OPT_CANONICALIZE = 0x0200;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_CANONICALIZE); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_CANONICALIZE);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_ANONYMOUS))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_ANONYMOUS = `enum KRB5_GET_INIT_CREDS_OPT_ANONYMOUS = 0x0400;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_ANONYMOUS); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_ANONYMOUS);
        }
    }




    static if(!is(typeof(KRB5_TC_MATCH_AUTHDATA))) {
        private enum enumMixinStr_KRB5_TC_MATCH_AUTHDATA = `enum KRB5_TC_MATCH_AUTHDATA = 0x00000020;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TC_MATCH_AUTHDATA); }))) {
            mixin(enumMixinStr_KRB5_TC_MATCH_AUTHDATA);
        }
    }




    static if(!is(typeof(KRB5_TC_MATCH_FLAGS_EXACT))) {
        private enum enumMixinStr_KRB5_TC_MATCH_FLAGS_EXACT = `enum KRB5_TC_MATCH_FLAGS_EXACT = 0x00000010;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TC_MATCH_FLAGS_EXACT); }))) {
            mixin(enumMixinStr_KRB5_TC_MATCH_FLAGS_EXACT);
        }
    }




    static if(!is(typeof(KRB5_TC_MATCH_TIMES_EXACT))) {
        private enum enumMixinStr_KRB5_TC_MATCH_TIMES_EXACT = `enum KRB5_TC_MATCH_TIMES_EXACT = 0x00000008;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TC_MATCH_TIMES_EXACT); }))) {
            mixin(enumMixinStr_KRB5_TC_MATCH_TIMES_EXACT);
        }
    }




    static if(!is(typeof(KRB5_TC_MATCH_FLAGS))) {
        private enum enumMixinStr_KRB5_TC_MATCH_FLAGS = `enum KRB5_TC_MATCH_FLAGS = 0x00000004;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TC_MATCH_FLAGS); }))) {
            mixin(enumMixinStr_KRB5_TC_MATCH_FLAGS);
        }
    }




    static if(!is(typeof(KRB5_TC_MATCH_IS_SKEY))) {
        private enum enumMixinStr_KRB5_TC_MATCH_IS_SKEY = `enum KRB5_TC_MATCH_IS_SKEY = 0x00000002;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TC_MATCH_IS_SKEY); }))) {
            mixin(enumMixinStr_KRB5_TC_MATCH_IS_SKEY);
        }
    }




    static if(!is(typeof(KRB5_TC_MATCH_TIMES))) {
        private enum enumMixinStr_KRB5_TC_MATCH_TIMES = `enum KRB5_TC_MATCH_TIMES = 0x00000001;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TC_MATCH_TIMES); }))) {
            mixin(enumMixinStr_KRB5_TC_MATCH_TIMES);
        }
    }




    static if(!is(typeof(KRB5_AUTH_CONTEXT_GENERATE_REMOTE_FULL_ADDR))) {
        private enum enumMixinStr_KRB5_AUTH_CONTEXT_GENERATE_REMOTE_FULL_ADDR = `enum KRB5_AUTH_CONTEXT_GENERATE_REMOTE_FULL_ADDR = 0x00000008;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTH_CONTEXT_GENERATE_REMOTE_FULL_ADDR); }))) {
            mixin(enumMixinStr_KRB5_AUTH_CONTEXT_GENERATE_REMOTE_FULL_ADDR);
        }
    }




    static if(!is(typeof(KRB5_AUTH_CONTEXT_GENERATE_LOCAL_FULL_ADDR))) {
        private enum enumMixinStr_KRB5_AUTH_CONTEXT_GENERATE_LOCAL_FULL_ADDR = `enum KRB5_AUTH_CONTEXT_GENERATE_LOCAL_FULL_ADDR = 0x00000004;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTH_CONTEXT_GENERATE_LOCAL_FULL_ADDR); }))) {
            mixin(enumMixinStr_KRB5_AUTH_CONTEXT_GENERATE_LOCAL_FULL_ADDR);
        }
    }




    static if(!is(typeof(KRB5_AUTH_CONTEXT_GENERATE_REMOTE_ADDR))) {
        private enum enumMixinStr_KRB5_AUTH_CONTEXT_GENERATE_REMOTE_ADDR = `enum KRB5_AUTH_CONTEXT_GENERATE_REMOTE_ADDR = 0x00000002;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTH_CONTEXT_GENERATE_REMOTE_ADDR); }))) {
            mixin(enumMixinStr_KRB5_AUTH_CONTEXT_GENERATE_REMOTE_ADDR);
        }
    }




    static if(!is(typeof(KRB5_AUTH_CONTEXT_GENERATE_LOCAL_ADDR))) {
        private enum enumMixinStr_KRB5_AUTH_CONTEXT_GENERATE_LOCAL_ADDR = `enum KRB5_AUTH_CONTEXT_GENERATE_LOCAL_ADDR = 0x00000001;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTH_CONTEXT_GENERATE_LOCAL_ADDR); }))) {
            mixin(enumMixinStr_KRB5_AUTH_CONTEXT_GENERATE_LOCAL_ADDR);
        }
    }




    static if(!is(typeof(KRB5_AUTH_CONTEXT_USE_SUBKEY))) {
        private enum enumMixinStr_KRB5_AUTH_CONTEXT_USE_SUBKEY = `enum KRB5_AUTH_CONTEXT_USE_SUBKEY = 0x00000020;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTH_CONTEXT_USE_SUBKEY); }))) {
            mixin(enumMixinStr_KRB5_AUTH_CONTEXT_USE_SUBKEY);
        }
    }




    static if(!is(typeof(KRB5_AUTH_CONTEXT_PERMIT_ALL))) {
        private enum enumMixinStr_KRB5_AUTH_CONTEXT_PERMIT_ALL = `enum KRB5_AUTH_CONTEXT_PERMIT_ALL = 0x00000010;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTH_CONTEXT_PERMIT_ALL); }))) {
            mixin(enumMixinStr_KRB5_AUTH_CONTEXT_PERMIT_ALL);
        }
    }




    static if(!is(typeof(KRB5_AUTH_CONTEXT_RET_SEQUENCE))) {
        private enum enumMixinStr_KRB5_AUTH_CONTEXT_RET_SEQUENCE = `enum KRB5_AUTH_CONTEXT_RET_SEQUENCE = 0x00000008;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTH_CONTEXT_RET_SEQUENCE); }))) {
            mixin(enumMixinStr_KRB5_AUTH_CONTEXT_RET_SEQUENCE);
        }
    }




    static if(!is(typeof(KRB5_AUTH_CONTEXT_DO_SEQUENCE))) {
        private enum enumMixinStr_KRB5_AUTH_CONTEXT_DO_SEQUENCE = `enum KRB5_AUTH_CONTEXT_DO_SEQUENCE = 0x00000004;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTH_CONTEXT_DO_SEQUENCE); }))) {
            mixin(enumMixinStr_KRB5_AUTH_CONTEXT_DO_SEQUENCE);
        }
    }




    static if(!is(typeof(KRB5_AUTH_CONTEXT_RET_TIME))) {
        private enum enumMixinStr_KRB5_AUTH_CONTEXT_RET_TIME = `enum KRB5_AUTH_CONTEXT_RET_TIME = 0x00000002;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTH_CONTEXT_RET_TIME); }))) {
            mixin(enumMixinStr_KRB5_AUTH_CONTEXT_RET_TIME);
        }
    }




    static if(!is(typeof(KRB5_AUTH_CONTEXT_DO_TIME))) {
        private enum enumMixinStr_KRB5_AUTH_CONTEXT_DO_TIME = `enum KRB5_AUTH_CONTEXT_DO_TIME = 0x00000001;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTH_CONTEXT_DO_TIME); }))) {
            mixin(enumMixinStr_KRB5_AUTH_CONTEXT_DO_TIME);
        }
    }




    static if(!is(typeof(KRB5_KPASSWD_INITIAL_FLAG_NEEDED))) {
        private enum enumMixinStr_KRB5_KPASSWD_INITIAL_FLAG_NEEDED = `enum KRB5_KPASSWD_INITIAL_FLAG_NEEDED = 7;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KPASSWD_INITIAL_FLAG_NEEDED); }))) {
            mixin(enumMixinStr_KRB5_KPASSWD_INITIAL_FLAG_NEEDED);
        }
    }




    static if(!is(typeof(KRB5_KPASSWD_BAD_VERSION))) {
        private enum enumMixinStr_KRB5_KPASSWD_BAD_VERSION = `enum KRB5_KPASSWD_BAD_VERSION = 6;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KPASSWD_BAD_VERSION); }))) {
            mixin(enumMixinStr_KRB5_KPASSWD_BAD_VERSION);
        }
    }




    static if(!is(typeof(KRB5_KPASSWD_ACCESSDENIED))) {
        private enum enumMixinStr_KRB5_KPASSWD_ACCESSDENIED = `enum KRB5_KPASSWD_ACCESSDENIED = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KPASSWD_ACCESSDENIED); }))) {
            mixin(enumMixinStr_KRB5_KPASSWD_ACCESSDENIED);
        }
    }




    static if(!is(typeof(KRB5_KPASSWD_SOFTERROR))) {
        private enum enumMixinStr_KRB5_KPASSWD_SOFTERROR = `enum KRB5_KPASSWD_SOFTERROR = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KPASSWD_SOFTERROR); }))) {
            mixin(enumMixinStr_KRB5_KPASSWD_SOFTERROR);
        }
    }




    static if(!is(typeof(KRB5_KPASSWD_AUTHERROR))) {
        private enum enumMixinStr_KRB5_KPASSWD_AUTHERROR = `enum KRB5_KPASSWD_AUTHERROR = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KPASSWD_AUTHERROR); }))) {
            mixin(enumMixinStr_KRB5_KPASSWD_AUTHERROR);
        }
    }




    static if(!is(typeof(KRB5_KPASSWD_HARDERROR))) {
        private enum enumMixinStr_KRB5_KPASSWD_HARDERROR = `enum KRB5_KPASSWD_HARDERROR = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KPASSWD_HARDERROR); }))) {
            mixin(enumMixinStr_KRB5_KPASSWD_HARDERROR);
        }
    }




    static if(!is(typeof(KRB5_KPASSWD_MALFORMED))) {
        private enum enumMixinStr_KRB5_KPASSWD_MALFORMED = `enum KRB5_KPASSWD_MALFORMED = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KPASSWD_MALFORMED); }))) {
            mixin(enumMixinStr_KRB5_KPASSWD_MALFORMED);
        }
    }




    static if(!is(typeof(KRB5_KPASSWD_SUCCESS))) {
        private enum enumMixinStr_KRB5_KPASSWD_SUCCESS = `enum KRB5_KPASSWD_SUCCESS = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KPASSWD_SUCCESS); }))) {
            mixin(enumMixinStr_KRB5_KPASSWD_SUCCESS);
        }
    }




    static if(!is(typeof(KRB5_AUTHDATA_AUTH_INDICATOR))) {
        private enum enumMixinStr_KRB5_AUTHDATA_AUTH_INDICATOR = `enum KRB5_AUTHDATA_AUTH_INDICATOR = 97;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTHDATA_AUTH_INDICATOR); }))) {
            mixin(enumMixinStr_KRB5_AUTHDATA_AUTH_INDICATOR);
        }
    }




    static if(!is(typeof(KRB5_AUTHDATA_FX_ARMOR))) {
        private enum enumMixinStr_KRB5_AUTHDATA_FX_ARMOR = `enum KRB5_AUTHDATA_FX_ARMOR = 71;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTHDATA_FX_ARMOR); }))) {
            mixin(enumMixinStr_KRB5_AUTHDATA_FX_ARMOR);
        }
    }




    static if(!is(typeof(KRB5_AUTHDATA_SIGNTICKET))) {
        private enum enumMixinStr_KRB5_AUTHDATA_SIGNTICKET = `enum KRB5_AUTHDATA_SIGNTICKET = 512;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTHDATA_SIGNTICKET); }))) {
            mixin(enumMixinStr_KRB5_AUTHDATA_SIGNTICKET);
        }
    }




    static if(!is(typeof(KRB5_AUTHDATA_ETYPE_NEGOTIATION))) {
        private enum enumMixinStr_KRB5_AUTHDATA_ETYPE_NEGOTIATION = `enum KRB5_AUTHDATA_ETYPE_NEGOTIATION = 129;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTHDATA_ETYPE_NEGOTIATION); }))) {
            mixin(enumMixinStr_KRB5_AUTHDATA_ETYPE_NEGOTIATION);
        }
    }




    static if(!is(typeof(KRB5_AUTHDATA_WIN2K_PAC))) {
        private enum enumMixinStr_KRB5_AUTHDATA_WIN2K_PAC = `enum KRB5_AUTHDATA_WIN2K_PAC = 128;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTHDATA_WIN2K_PAC); }))) {
            mixin(enumMixinStr_KRB5_AUTHDATA_WIN2K_PAC);
        }
    }




    static if(!is(typeof(KRB5_AUTHDATA_CAMMAC))) {
        private enum enumMixinStr_KRB5_AUTHDATA_CAMMAC = `enum KRB5_AUTHDATA_CAMMAC = 96;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTHDATA_CAMMAC); }))) {
            mixin(enumMixinStr_KRB5_AUTHDATA_CAMMAC);
        }
    }




    static if(!is(typeof(KRB5_AUTHDATA_SESAME))) {
        private enum enumMixinStr_KRB5_AUTHDATA_SESAME = `enum KRB5_AUTHDATA_SESAME = 65;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTHDATA_SESAME); }))) {
            mixin(enumMixinStr_KRB5_AUTHDATA_SESAME);
        }
    }




    static if(!is(typeof(KRB5_AUTHDATA_OSF_DCE))) {
        private enum enumMixinStr_KRB5_AUTHDATA_OSF_DCE = `enum KRB5_AUTHDATA_OSF_DCE = 64;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTHDATA_OSF_DCE); }))) {
            mixin(enumMixinStr_KRB5_AUTHDATA_OSF_DCE);
        }
    }




    static if(!is(typeof(KRB5_AUTHDATA_INITIAL_VERIFIED_CAS))) {
        private enum enumMixinStr_KRB5_AUTHDATA_INITIAL_VERIFIED_CAS = `enum KRB5_AUTHDATA_INITIAL_VERIFIED_CAS = 9;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTHDATA_INITIAL_VERIFIED_CAS); }))) {
            mixin(enumMixinStr_KRB5_AUTHDATA_INITIAL_VERIFIED_CAS);
        }
    }




    static if(!is(typeof(KRB5_AUTHDATA_MANDATORY_FOR_KDC))) {
        private enum enumMixinStr_KRB5_AUTHDATA_MANDATORY_FOR_KDC = `enum KRB5_AUTHDATA_MANDATORY_FOR_KDC = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTHDATA_MANDATORY_FOR_KDC); }))) {
            mixin(enumMixinStr_KRB5_AUTHDATA_MANDATORY_FOR_KDC);
        }
    }




    static if(!is(typeof(KRB5_AUTHDATA_AND_OR))) {
        private enum enumMixinStr_KRB5_AUTHDATA_AND_OR = `enum KRB5_AUTHDATA_AND_OR = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTHDATA_AND_OR); }))) {
            mixin(enumMixinStr_KRB5_AUTHDATA_AND_OR);
        }
    }




    static if(!is(typeof(KRB5_AUTHDATA_KDC_ISSUED))) {
        private enum enumMixinStr_KRB5_AUTHDATA_KDC_ISSUED = `enum KRB5_AUTHDATA_KDC_ISSUED = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTHDATA_KDC_ISSUED); }))) {
            mixin(enumMixinStr_KRB5_AUTHDATA_KDC_ISSUED);
        }
    }




    static if(!is(typeof(KRB5_AUTHDATA_IF_RELEVANT))) {
        private enum enumMixinStr_KRB5_AUTHDATA_IF_RELEVANT = `enum KRB5_AUTHDATA_IF_RELEVANT = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AUTHDATA_IF_RELEVANT); }))) {
            mixin(enumMixinStr_KRB5_AUTHDATA_IF_RELEVANT);
        }
    }




    static if(!is(typeof(KRB5_ALTAUTH_ATT_CHALLENGE_RESPONSE))) {
        private enum enumMixinStr_KRB5_ALTAUTH_ATT_CHALLENGE_RESPONSE = `enum KRB5_ALTAUTH_ATT_CHALLENGE_RESPONSE = 64;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_ALTAUTH_ATT_CHALLENGE_RESPONSE); }))) {
            mixin(enumMixinStr_KRB5_ALTAUTH_ATT_CHALLENGE_RESPONSE);
        }
    }




    static if(!is(typeof(KRB5_DOMAIN_X500_COMPRESS))) {
        private enum enumMixinStr_KRB5_DOMAIN_X500_COMPRESS = `enum KRB5_DOMAIN_X500_COMPRESS = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_DOMAIN_X500_COMPRESS); }))) {
            mixin(enumMixinStr_KRB5_DOMAIN_X500_COMPRESS);
        }
    }




    static if(!is(typeof(KRB5_SAM_MUST_PK_ENCRYPT_SAD))) {
        private enum enumMixinStr_KRB5_SAM_MUST_PK_ENCRYPT_SAD = `enum KRB5_SAM_MUST_PK_ENCRYPT_SAD = 0x20000000;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_SAM_MUST_PK_ENCRYPT_SAD); }))) {
            mixin(enumMixinStr_KRB5_SAM_MUST_PK_ENCRYPT_SAD);
        }
    }




    static if(!is(typeof(KRB5_SAM_SEND_ENCRYPTED_SAD))) {
        private enum enumMixinStr_KRB5_SAM_SEND_ENCRYPTED_SAD = `enum KRB5_SAM_SEND_ENCRYPTED_SAD = 0x40000000;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_SAM_SEND_ENCRYPTED_SAD); }))) {
            mixin(enumMixinStr_KRB5_SAM_SEND_ENCRYPTED_SAD);
        }
    }




    static if(!is(typeof(KRB5_SAM_USE_SAD_AS_KEY))) {
        private enum enumMixinStr_KRB5_SAM_USE_SAD_AS_KEY = `enum KRB5_SAM_USE_SAD_AS_KEY = 0x80000000;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_SAM_USE_SAD_AS_KEY); }))) {
            mixin(enumMixinStr_KRB5_SAM_USE_SAD_AS_KEY);
        }
    }




    static if(!is(typeof(KRB5_PADATA_SPAKE))) {
        private enum enumMixinStr_KRB5_PADATA_SPAKE = `enum KRB5_PADATA_SPAKE = 151;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_SPAKE); }))) {
            mixin(enumMixinStr_KRB5_PADATA_SPAKE);
        }
    }




    static if(!is(typeof(KRB5_PADATA_AS_FRESHNESS))) {
        private enum enumMixinStr_KRB5_PADATA_AS_FRESHNESS = `enum KRB5_PADATA_AS_FRESHNESS = 150;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_AS_FRESHNESS); }))) {
            mixin(enumMixinStr_KRB5_PADATA_AS_FRESHNESS);
        }
    }




    static if(!is(typeof(KRB5_ENCPADATA_REQ_ENC_PA_REP))) {
        private enum enumMixinStr_KRB5_ENCPADATA_REQ_ENC_PA_REP = `enum KRB5_ENCPADATA_REQ_ENC_PA_REP = 149;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_ENCPADATA_REQ_ENC_PA_REP); }))) {
            mixin(enumMixinStr_KRB5_ENCPADATA_REQ_ENC_PA_REP);
        }
    }




    static if(!is(typeof(KRB5_PADATA_PKINIT_KX))) {
        private enum enumMixinStr_KRB5_PADATA_PKINIT_KX = `enum KRB5_PADATA_PKINIT_KX = 147;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_PKINIT_KX); }))) {
            mixin(enumMixinStr_KRB5_PADATA_PKINIT_KX);
        }
    }




    static if(!is(typeof(KRB5_FAST_REQUIRED))) {
        private enum enumMixinStr_KRB5_FAST_REQUIRED = `enum KRB5_FAST_REQUIRED = 0x0001;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_FAST_REQUIRED); }))) {
            mixin(enumMixinStr_KRB5_FAST_REQUIRED);
        }
    }




    static if(!is(typeof(KRB5_PADATA_OTP_PIN_CHANGE))) {
        private enum enumMixinStr_KRB5_PADATA_OTP_PIN_CHANGE = `enum KRB5_PADATA_OTP_PIN_CHANGE = 144;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_OTP_PIN_CHANGE); }))) {
            mixin(enumMixinStr_KRB5_PADATA_OTP_PIN_CHANGE);
        }
    }




    static if(!is(typeof(KRB5_PADATA_OTP_REQUEST))) {
        private enum enumMixinStr_KRB5_PADATA_OTP_REQUEST = `enum KRB5_PADATA_OTP_REQUEST = 142;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_OTP_REQUEST); }))) {
            mixin(enumMixinStr_KRB5_PADATA_OTP_REQUEST);
        }
    }




    static if(!is(typeof(KRB5_PADATA_OTP_CHALLENGE))) {
        private enum enumMixinStr_KRB5_PADATA_OTP_CHALLENGE = `enum KRB5_PADATA_OTP_CHALLENGE = 141;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_OTP_CHALLENGE); }))) {
            mixin(enumMixinStr_KRB5_PADATA_OTP_CHALLENGE);
        }
    }




    static if(!is(typeof(KRB5_PADATA_ENCRYPTED_CHALLENGE))) {
        private enum enumMixinStr_KRB5_PADATA_ENCRYPTED_CHALLENGE = `enum KRB5_PADATA_ENCRYPTED_CHALLENGE = 138;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_ENCRYPTED_CHALLENGE); }))) {
            mixin(enumMixinStr_KRB5_PADATA_ENCRYPTED_CHALLENGE);
        }
    }




    static if(!is(typeof(KRB5_PADATA_FX_ERROR))) {
        private enum enumMixinStr_KRB5_PADATA_FX_ERROR = `enum KRB5_PADATA_FX_ERROR = 137;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_FX_ERROR); }))) {
            mixin(enumMixinStr_KRB5_PADATA_FX_ERROR);
        }
    }




    static if(!is(typeof(KRB5_PADATA_FX_FAST))) {
        private enum enumMixinStr_KRB5_PADATA_FX_FAST = `enum KRB5_PADATA_FX_FAST = 136;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_FX_FAST); }))) {
            mixin(enumMixinStr_KRB5_PADATA_FX_FAST);
        }
    }




    static if(!is(typeof(KRB5_PADATA_FX_COOKIE))) {
        private enum enumMixinStr_KRB5_PADATA_FX_COOKIE = `enum KRB5_PADATA_FX_COOKIE = 133;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_FX_COOKIE); }))) {
            mixin(enumMixinStr_KRB5_PADATA_FX_COOKIE);
        }
    }




    static if(!is(typeof(KRB5_PADATA_AS_CHECKSUM))) {
        private enum enumMixinStr_KRB5_PADATA_AS_CHECKSUM = `enum KRB5_PADATA_AS_CHECKSUM = 132;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_AS_CHECKSUM); }))) {
            mixin(enumMixinStr_KRB5_PADATA_AS_CHECKSUM);
        }
    }




    static if(!is(typeof(KRB5_PADATA_S4U_X509_USER))) {
        private enum enumMixinStr_KRB5_PADATA_S4U_X509_USER = `enum KRB5_PADATA_S4U_X509_USER = 130;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_S4U_X509_USER); }))) {
            mixin(enumMixinStr_KRB5_PADATA_S4U_X509_USER);
        }
    }




    static if(!is(typeof(KRB5_PADATA_FOR_USER))) {
        private enum enumMixinStr_KRB5_PADATA_FOR_USER = `enum KRB5_PADATA_FOR_USER = 129;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_FOR_USER); }))) {
            mixin(enumMixinStr_KRB5_PADATA_FOR_USER);
        }
    }




    static if(!is(typeof(KRB5_PADATA_PAC_REQUEST))) {
        private enum enumMixinStr_KRB5_PADATA_PAC_REQUEST = `enum KRB5_PADATA_PAC_REQUEST = 128;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_PAC_REQUEST); }))) {
            mixin(enumMixinStr_KRB5_PADATA_PAC_REQUEST);
        }
    }




    static if(!is(typeof(KRB5_PADATA_SAM_RESPONSE_2))) {
        private enum enumMixinStr_KRB5_PADATA_SAM_RESPONSE_2 = `enum KRB5_PADATA_SAM_RESPONSE_2 = 31;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_SAM_RESPONSE_2); }))) {
            mixin(enumMixinStr_KRB5_PADATA_SAM_RESPONSE_2);
        }
    }




    static if(!is(typeof(KRB5_INIT_CREDS_STEP_FLAG_CONTINUE))) {
        private enum enumMixinStr_KRB5_INIT_CREDS_STEP_FLAG_CONTINUE = `enum KRB5_INIT_CREDS_STEP_FLAG_CONTINUE = 0x1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_INIT_CREDS_STEP_FLAG_CONTINUE); }))) {
            mixin(enumMixinStr_KRB5_INIT_CREDS_STEP_FLAG_CONTINUE);
        }
    }




    static if(!is(typeof(KRB5_PADATA_SAM_CHALLENGE_2))) {
        private enum enumMixinStr_KRB5_PADATA_SAM_CHALLENGE_2 = `enum KRB5_PADATA_SAM_CHALLENGE_2 = 30;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_SAM_CHALLENGE_2); }))) {
            mixin(enumMixinStr_KRB5_PADATA_SAM_CHALLENGE_2);
        }
    }




    static if(!is(typeof(KRB5_PADATA_REFERRAL))) {
        private enum enumMixinStr_KRB5_PADATA_REFERRAL = `enum KRB5_PADATA_REFERRAL = 25;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_REFERRAL); }))) {
            mixin(enumMixinStr_KRB5_PADATA_REFERRAL);
        }
    }




    static if(!is(typeof(KRB5_PADATA_GET_FROM_TYPED_DATA))) {
        private enum enumMixinStr_KRB5_PADATA_GET_FROM_TYPED_DATA = `enum KRB5_PADATA_GET_FROM_TYPED_DATA = 22;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_GET_FROM_TYPED_DATA); }))) {
            mixin(enumMixinStr_KRB5_PADATA_GET_FROM_TYPED_DATA);
        }
    }




    static if(!is(typeof(KRB5_PADATA_SAM_REDIRECT))) {
        private enum enumMixinStr_KRB5_PADATA_SAM_REDIRECT = `enum KRB5_PADATA_SAM_REDIRECT = 21;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_SAM_REDIRECT); }))) {
            mixin(enumMixinStr_KRB5_PADATA_SAM_REDIRECT);
        }
    }




    static if(!is(typeof(KRB5_PADATA_SVR_REFERRAL_INFO))) {
        private enum enumMixinStr_KRB5_PADATA_SVR_REFERRAL_INFO = `enum KRB5_PADATA_SVR_REFERRAL_INFO = 20;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_SVR_REFERRAL_INFO); }))) {
            mixin(enumMixinStr_KRB5_PADATA_SVR_REFERRAL_INFO);
        }
    }




    static if(!is(typeof(KRB5_PADATA_USE_SPECIFIED_KVNO))) {
        private enum enumMixinStr_KRB5_PADATA_USE_SPECIFIED_KVNO = `enum KRB5_PADATA_USE_SPECIFIED_KVNO = 20;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_USE_SPECIFIED_KVNO); }))) {
            mixin(enumMixinStr_KRB5_PADATA_USE_SPECIFIED_KVNO);
        }
    }




    static if(!is(typeof(KRB5_PADATA_ETYPE_INFO2))) {
        private enum enumMixinStr_KRB5_PADATA_ETYPE_INFO2 = `enum KRB5_PADATA_ETYPE_INFO2 = 19;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_ETYPE_INFO2); }))) {
            mixin(enumMixinStr_KRB5_PADATA_ETYPE_INFO2);
        }
    }




    static if(!is(typeof(KRB5_PADATA_PK_AS_REP))) {
        private enum enumMixinStr_KRB5_PADATA_PK_AS_REP = `enum KRB5_PADATA_PK_AS_REP = 17;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_PK_AS_REP); }))) {
            mixin(enumMixinStr_KRB5_PADATA_PK_AS_REP);
        }
    }




    static if(!is(typeof(KRB5_PADATA_PK_AS_REQ))) {
        private enum enumMixinStr_KRB5_PADATA_PK_AS_REQ = `enum KRB5_PADATA_PK_AS_REQ = 16;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_PK_AS_REQ); }))) {
            mixin(enumMixinStr_KRB5_PADATA_PK_AS_REQ);
        }
    }




    static if(!is(typeof(KRB5_PADATA_PK_AS_REP_OLD))) {
        private enum enumMixinStr_KRB5_PADATA_PK_AS_REP_OLD = `enum KRB5_PADATA_PK_AS_REP_OLD = 15;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_PK_AS_REP_OLD); }))) {
            mixin(enumMixinStr_KRB5_PADATA_PK_AS_REP_OLD);
        }
    }




    static if(!is(typeof(KRB5_PADATA_PK_AS_REQ_OLD))) {
        private enum enumMixinStr_KRB5_PADATA_PK_AS_REQ_OLD = `enum KRB5_PADATA_PK_AS_REQ_OLD = 14;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_PK_AS_REQ_OLD); }))) {
            mixin(enumMixinStr_KRB5_PADATA_PK_AS_REQ_OLD);
        }
    }




    static if(!is(typeof(KRB5_PADATA_SAM_RESPONSE))) {
        private enum enumMixinStr_KRB5_PADATA_SAM_RESPONSE = `enum KRB5_PADATA_SAM_RESPONSE = 13;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_SAM_RESPONSE); }))) {
            mixin(enumMixinStr_KRB5_PADATA_SAM_RESPONSE);
        }
    }




    static if(!is(typeof(KRB5_PADATA_SAM_CHALLENGE))) {
        private enum enumMixinStr_KRB5_PADATA_SAM_CHALLENGE = `enum KRB5_PADATA_SAM_CHALLENGE = 12;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_SAM_CHALLENGE); }))) {
            mixin(enumMixinStr_KRB5_PADATA_SAM_CHALLENGE);
        }
    }




    static if(!is(typeof(KRB5_PADATA_ETYPE_INFO))) {
        private enum enumMixinStr_KRB5_PADATA_ETYPE_INFO = `enum KRB5_PADATA_ETYPE_INFO = 11;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_ETYPE_INFO); }))) {
            mixin(enumMixinStr_KRB5_PADATA_ETYPE_INFO);
        }
    }




    static if(!is(typeof(KRB5_PADATA_AFS3_SALT))) {
        private enum enumMixinStr_KRB5_PADATA_AFS3_SALT = `enum KRB5_PADATA_AFS3_SALT = 10;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_AFS3_SALT); }))) {
            mixin(enumMixinStr_KRB5_PADATA_AFS3_SALT);
        }
    }




    static if(!is(typeof(KRB5_CYBERSAFE_SECUREID))) {
        private enum enumMixinStr_KRB5_CYBERSAFE_SECUREID = `enum KRB5_CYBERSAFE_SECUREID = 9;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CYBERSAFE_SECUREID); }))) {
            mixin(enumMixinStr_KRB5_CYBERSAFE_SECUREID);
        }
    }




    static if(!is(typeof(KRB5_PADATA_OSF_DCE))) {
        private enum enumMixinStr_KRB5_PADATA_OSF_DCE = `enum KRB5_PADATA_OSF_DCE = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_OSF_DCE); }))) {
            mixin(enumMixinStr_KRB5_PADATA_OSF_DCE);
        }
    }




    static if(!is(typeof(KRB5_PADATA_SESAME))) {
        private enum enumMixinStr_KRB5_PADATA_SESAME = `enum KRB5_PADATA_SESAME = 7;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_SESAME); }))) {
            mixin(enumMixinStr_KRB5_PADATA_SESAME);
        }
    }




    static if(!is(typeof(KRB5_PADATA_ENC_SANDIA_SECURID))) {
        private enum enumMixinStr_KRB5_PADATA_ENC_SANDIA_SECURID = `enum KRB5_PADATA_ENC_SANDIA_SECURID = 6;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_ENC_SANDIA_SECURID); }))) {
            mixin(enumMixinStr_KRB5_PADATA_ENC_SANDIA_SECURID);
        }
    }




    static if(!is(typeof(KRB5_PADATA_ENC_UNIX_TIME))) {
        private enum enumMixinStr_KRB5_PADATA_ENC_UNIX_TIME = `enum KRB5_PADATA_ENC_UNIX_TIME = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_ENC_UNIX_TIME); }))) {
            mixin(enumMixinStr_KRB5_PADATA_ENC_UNIX_TIME);
        }
    }




    static if(!is(typeof(KRB5_PADATA_PW_SALT))) {
        private enum enumMixinStr_KRB5_PADATA_PW_SALT = `enum KRB5_PADATA_PW_SALT = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_PW_SALT); }))) {
            mixin(enumMixinStr_KRB5_PADATA_PW_SALT);
        }
    }




    static if(!is(typeof(KRB5_PADATA_ENC_TIMESTAMP))) {
        private enum enumMixinStr_KRB5_PADATA_ENC_TIMESTAMP = `enum KRB5_PADATA_ENC_TIMESTAMP = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_ENC_TIMESTAMP); }))) {
            mixin(enumMixinStr_KRB5_PADATA_ENC_TIMESTAMP);
        }
    }




    static if(!is(typeof(KRB5_PADATA_TGS_REQ))) {
        private enum enumMixinStr_KRB5_PADATA_TGS_REQ = `enum KRB5_PADATA_TGS_REQ = KRB5_PADATA_AP_REQ;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_TGS_REQ); }))) {
            mixin(enumMixinStr_KRB5_PADATA_TGS_REQ);
        }
    }




    static if(!is(typeof(KRB5_PADATA_AP_REQ))) {
        private enum enumMixinStr_KRB5_PADATA_AP_REQ = `enum KRB5_PADATA_AP_REQ = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_AP_REQ); }))) {
            mixin(enumMixinStr_KRB5_PADATA_AP_REQ);
        }
    }




    static if(!is(typeof(KRB5_PADATA_NONE))) {
        private enum enumMixinStr_KRB5_PADATA_NONE = `enum KRB5_PADATA_NONE = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PADATA_NONE); }))) {
            mixin(enumMixinStr_KRB5_PADATA_NONE);
        }
    }




    static if(!is(typeof(KRB5_LRQ_ONE_ACCT_EXPTIME))) {
        private enum enumMixinStr_KRB5_LRQ_ONE_ACCT_EXPTIME = `enum KRB5_LRQ_ONE_ACCT_EXPTIME = ( - 7 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LRQ_ONE_ACCT_EXPTIME); }))) {
            mixin(enumMixinStr_KRB5_LRQ_ONE_ACCT_EXPTIME);
        }
    }




    static if(!is(typeof(KRB5_LRQ_ALL_ACCT_EXPTIME))) {
        private enum enumMixinStr_KRB5_LRQ_ALL_ACCT_EXPTIME = `enum KRB5_LRQ_ALL_ACCT_EXPTIME = 7;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LRQ_ALL_ACCT_EXPTIME); }))) {
            mixin(enumMixinStr_KRB5_LRQ_ALL_ACCT_EXPTIME);
        }
    }




    static if(!is(typeof(KRB5_LRQ_ONE_PW_EXPTIME))) {
        private enum enumMixinStr_KRB5_LRQ_ONE_PW_EXPTIME = `enum KRB5_LRQ_ONE_PW_EXPTIME = ( - 6 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LRQ_ONE_PW_EXPTIME); }))) {
            mixin(enumMixinStr_KRB5_LRQ_ONE_PW_EXPTIME);
        }
    }




    static if(!is(typeof(KRB5_LRQ_ALL_PW_EXPTIME))) {
        private enum enumMixinStr_KRB5_LRQ_ALL_PW_EXPTIME = `enum KRB5_LRQ_ALL_PW_EXPTIME = 6;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LRQ_ALL_PW_EXPTIME); }))) {
            mixin(enumMixinStr_KRB5_LRQ_ALL_PW_EXPTIME);
        }
    }




    static if(!is(typeof(KRB5_LRQ_ONE_LAST_REQ))) {
        private enum enumMixinStr_KRB5_LRQ_ONE_LAST_REQ = `enum KRB5_LRQ_ONE_LAST_REQ = ( - 5 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LRQ_ONE_LAST_REQ); }))) {
            mixin(enumMixinStr_KRB5_LRQ_ONE_LAST_REQ);
        }
    }




    static if(!is(typeof(KRB5_TKT_CREDS_STEP_FLAG_CONTINUE))) {
        private enum enumMixinStr_KRB5_TKT_CREDS_STEP_FLAG_CONTINUE = `enum KRB5_TKT_CREDS_STEP_FLAG_CONTINUE = 0x1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TKT_CREDS_STEP_FLAG_CONTINUE); }))) {
            mixin(enumMixinStr_KRB5_TKT_CREDS_STEP_FLAG_CONTINUE);
        }
    }




    static if(!is(typeof(KRB5_LRQ_ALL_LAST_REQ))) {
        private enum enumMixinStr_KRB5_LRQ_ALL_LAST_REQ = `enum KRB5_LRQ_ALL_LAST_REQ = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LRQ_ALL_LAST_REQ); }))) {
            mixin(enumMixinStr_KRB5_LRQ_ALL_LAST_REQ);
        }
    }




    static if(!is(typeof(KRB5_LRQ_ONE_LAST_RENEWAL))) {
        private enum enumMixinStr_KRB5_LRQ_ONE_LAST_RENEWAL = `enum KRB5_LRQ_ONE_LAST_RENEWAL = ( - 4 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LRQ_ONE_LAST_RENEWAL); }))) {
            mixin(enumMixinStr_KRB5_LRQ_ONE_LAST_RENEWAL);
        }
    }




    static if(!is(typeof(KRB5_LRQ_ALL_LAST_RENEWAL))) {
        private enum enumMixinStr_KRB5_LRQ_ALL_LAST_RENEWAL = `enum KRB5_LRQ_ALL_LAST_RENEWAL = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LRQ_ALL_LAST_RENEWAL); }))) {
            mixin(enumMixinStr_KRB5_LRQ_ALL_LAST_RENEWAL);
        }
    }




    static if(!is(typeof(KRB5_LRQ_ONE_LAST_TGT_ISSUED))) {
        private enum enumMixinStr_KRB5_LRQ_ONE_LAST_TGT_ISSUED = `enum KRB5_LRQ_ONE_LAST_TGT_ISSUED = ( - 3 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LRQ_ONE_LAST_TGT_ISSUED); }))) {
            mixin(enumMixinStr_KRB5_LRQ_ONE_LAST_TGT_ISSUED);
        }
    }




    static if(!is(typeof(KRB5_LRQ_ALL_LAST_TGT_ISSUED))) {
        private enum enumMixinStr_KRB5_LRQ_ALL_LAST_TGT_ISSUED = `enum KRB5_LRQ_ALL_LAST_TGT_ISSUED = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LRQ_ALL_LAST_TGT_ISSUED); }))) {
            mixin(enumMixinStr_KRB5_LRQ_ALL_LAST_TGT_ISSUED);
        }
    }




    static if(!is(typeof(KRB5_LRQ_ONE_LAST_INITIAL))) {
        private enum enumMixinStr_KRB5_LRQ_ONE_LAST_INITIAL = `enum KRB5_LRQ_ONE_LAST_INITIAL = ( - 2 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LRQ_ONE_LAST_INITIAL); }))) {
            mixin(enumMixinStr_KRB5_LRQ_ONE_LAST_INITIAL);
        }
    }




    static if(!is(typeof(KRB5_LRQ_ALL_LAST_INITIAL))) {
        private enum enumMixinStr_KRB5_LRQ_ALL_LAST_INITIAL = `enum KRB5_LRQ_ALL_LAST_INITIAL = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LRQ_ALL_LAST_INITIAL); }))) {
            mixin(enumMixinStr_KRB5_LRQ_ALL_LAST_INITIAL);
        }
    }




    static if(!is(typeof(KRB5_LRQ_ONE_LAST_TGT))) {
        private enum enumMixinStr_KRB5_LRQ_ONE_LAST_TGT = `enum KRB5_LRQ_ONE_LAST_TGT = ( - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LRQ_ONE_LAST_TGT); }))) {
            mixin(enumMixinStr_KRB5_LRQ_ONE_LAST_TGT);
        }
    }




    static if(!is(typeof(KRB5_VERIFY_INIT_CREDS_OPT_AP_REQ_NOFAIL))) {
        private enum enumMixinStr_KRB5_VERIFY_INIT_CREDS_OPT_AP_REQ_NOFAIL = `enum KRB5_VERIFY_INIT_CREDS_OPT_AP_REQ_NOFAIL = 0x0001;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_VERIFY_INIT_CREDS_OPT_AP_REQ_NOFAIL); }))) {
            mixin(enumMixinStr_KRB5_VERIFY_INIT_CREDS_OPT_AP_REQ_NOFAIL);
        }
    }




    static if(!is(typeof(KRB5_LRQ_ALL_LAST_TGT))) {
        private enum enumMixinStr_KRB5_LRQ_ALL_LAST_TGT = `enum KRB5_LRQ_ALL_LAST_TGT = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LRQ_ALL_LAST_TGT); }))) {
            mixin(enumMixinStr_KRB5_LRQ_ALL_LAST_TGT);
        }
    }




    static if(!is(typeof(KRB5_LRQ_NONE))) {
        private enum enumMixinStr_KRB5_LRQ_NONE = `enum KRB5_LRQ_NONE = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LRQ_NONE); }))) {
            mixin(enumMixinStr_KRB5_LRQ_NONE);
        }
    }




    static if(!is(typeof(KRB5_ERROR))) {
        private enum enumMixinStr_KRB5_ERROR = `enum KRB5_ERROR = ( cast( krb5_msgtype ) 30 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_ERROR); }))) {
            mixin(enumMixinStr_KRB5_ERROR);
        }
    }




    static if(!is(typeof(KRB5_CRED))) {
        private enum enumMixinStr_KRB5_CRED = `enum KRB5_CRED = ( cast( krb5_msgtype ) 22 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CRED); }))) {
            mixin(enumMixinStr_KRB5_CRED);
        }
    }




    static if(!is(typeof(KRB5_PRIV))) {
        private enum enumMixinStr_KRB5_PRIV = `enum KRB5_PRIV = ( cast( krb5_msgtype ) 21 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PRIV); }))) {
            mixin(enumMixinStr_KRB5_PRIV);
        }
    }




    static if(!is(typeof(KRB5_SAFE))) {
        private enum enumMixinStr_KRB5_SAFE = `enum KRB5_SAFE = ( cast( krb5_msgtype ) 20 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_SAFE); }))) {
            mixin(enumMixinStr_KRB5_SAFE);
        }
    }




    static if(!is(typeof(KRB5_AP_REP))) {
        private enum enumMixinStr_KRB5_AP_REP = `enum KRB5_AP_REP = ( cast( krb5_msgtype ) 15 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AP_REP); }))) {
            mixin(enumMixinStr_KRB5_AP_REP);
        }
    }




    static if(!is(typeof(KRB5_AP_REQ))) {
        private enum enumMixinStr_KRB5_AP_REQ = `enum KRB5_AP_REQ = ( cast( krb5_msgtype ) 14 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AP_REQ); }))) {
            mixin(enumMixinStr_KRB5_AP_REQ);
        }
    }




    static if(!is(typeof(KRB5_TGS_REP))) {
        private enum enumMixinStr_KRB5_TGS_REP = `enum KRB5_TGS_REP = ( cast( krb5_msgtype ) 13 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TGS_REP); }))) {
            mixin(enumMixinStr_KRB5_TGS_REP);
        }
    }




    static if(!is(typeof(KRB5_TGS_REQ))) {
        private enum enumMixinStr_KRB5_TGS_REQ = `enum KRB5_TGS_REQ = ( cast( krb5_msgtype ) 12 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TGS_REQ); }))) {
            mixin(enumMixinStr_KRB5_TGS_REQ);
        }
    }




    static if(!is(typeof(KRB5_AS_REP))) {
        private enum enumMixinStr_KRB5_AS_REP = `enum KRB5_AS_REP = ( cast( krb5_msgtype ) 11 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AS_REP); }))) {
            mixin(enumMixinStr_KRB5_AS_REP);
        }
    }




    static if(!is(typeof(KRB5_AS_REQ))) {
        private enum enumMixinStr_KRB5_AS_REQ = `enum KRB5_AS_REQ = ( cast( krb5_msgtype ) 10 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_AS_REQ); }))) {
            mixin(enumMixinStr_KRB5_AS_REQ);
        }
    }




    static if(!is(typeof(KRB5_PVNO))) {
        private enum enumMixinStr_KRB5_PVNO = `enum KRB5_PVNO = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PVNO); }))) {
            mixin(enumMixinStr_KRB5_PVNO);
        }
    }




    static if(!is(typeof(MSEC_VAL_MASK))) {
        private enum enumMixinStr_MSEC_VAL_MASK = `enum MSEC_VAL_MASK = 0x7fff;`;
        static if(is(typeof({ mixin(enumMixinStr_MSEC_VAL_MASK); }))) {
            mixin(enumMixinStr_MSEC_VAL_MASK);
        }
    }




    static if(!is(typeof(MSEC_DIRBIT))) {
        private enum enumMixinStr_MSEC_DIRBIT = `enum MSEC_DIRBIT = 0x8000;`;
        static if(is(typeof({ mixin(enumMixinStr_MSEC_DIRBIT); }))) {
            mixin(enumMixinStr_MSEC_DIRBIT);
        }
    }




    static if(!is(typeof(LR_TYPE_INTERPRETATION_MASK))) {
        private enum enumMixinStr_LR_TYPE_INTERPRETATION_MASK = `enum LR_TYPE_INTERPRETATION_MASK = 0x7fff;`;
        static if(is(typeof({ mixin(enumMixinStr_LR_TYPE_INTERPRETATION_MASK); }))) {
            mixin(enumMixinStr_LR_TYPE_INTERPRETATION_MASK);
        }
    }




    static if(!is(typeof(KRB5_PROMPT_TYPE_PASSWORD))) {
        private enum enumMixinStr_KRB5_PROMPT_TYPE_PASSWORD = `enum KRB5_PROMPT_TYPE_PASSWORD = 0x1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PROMPT_TYPE_PASSWORD); }))) {
            mixin(enumMixinStr_KRB5_PROMPT_TYPE_PASSWORD);
        }
    }




    static if(!is(typeof(KRB5_PROMPT_TYPE_NEW_PASSWORD))) {
        private enum enumMixinStr_KRB5_PROMPT_TYPE_NEW_PASSWORD = `enum KRB5_PROMPT_TYPE_NEW_PASSWORD = 0x2;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PROMPT_TYPE_NEW_PASSWORD); }))) {
            mixin(enumMixinStr_KRB5_PROMPT_TYPE_NEW_PASSWORD);
        }
    }




    static if(!is(typeof(KRB5_PROMPT_TYPE_NEW_PASSWORD_AGAIN))) {
        private enum enumMixinStr_KRB5_PROMPT_TYPE_NEW_PASSWORD_AGAIN = `enum KRB5_PROMPT_TYPE_NEW_PASSWORD_AGAIN = 0x3;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PROMPT_TYPE_NEW_PASSWORD_AGAIN); }))) {
            mixin(enumMixinStr_KRB5_PROMPT_TYPE_NEW_PASSWORD_AGAIN);
        }
    }




    static if(!is(typeof(KRB5_PROMPT_TYPE_PREAUTH))) {
        private enum enumMixinStr_KRB5_PROMPT_TYPE_PREAUTH = `enum KRB5_PROMPT_TYPE_PREAUTH = 0x4;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PROMPT_TYPE_PREAUTH); }))) {
            mixin(enumMixinStr_KRB5_PROMPT_TYPE_PREAUTH);
        }
    }




    static if(!is(typeof(LR_TYPE_THIS_SERVER_ONLY))) {
        private enum enumMixinStr_LR_TYPE_THIS_SERVER_ONLY = `enum LR_TYPE_THIS_SERVER_ONLY = 0x8000;`;
        static if(is(typeof({ mixin(enumMixinStr_LR_TYPE_THIS_SERVER_ONLY); }))) {
            mixin(enumMixinStr_LR_TYPE_THIS_SERVER_ONLY);
        }
    }




    static if(!is(typeof(TKT_FLG_ANONYMOUS))) {
        private enum enumMixinStr_TKT_FLG_ANONYMOUS = `enum TKT_FLG_ANONYMOUS = 0x00008000;`;
        static if(is(typeof({ mixin(enumMixinStr_TKT_FLG_ANONYMOUS); }))) {
            mixin(enumMixinStr_TKT_FLG_ANONYMOUS);
        }
    }




    static if(!is(typeof(TKT_FLG_ENC_PA_REP))) {
        private enum enumMixinStr_TKT_FLG_ENC_PA_REP = `enum TKT_FLG_ENC_PA_REP = 0x00010000;`;
        static if(is(typeof({ mixin(enumMixinStr_TKT_FLG_ENC_PA_REP); }))) {
            mixin(enumMixinStr_TKT_FLG_ENC_PA_REP);
        }
    }




    static if(!is(typeof(TKT_FLG_OK_AS_DELEGATE))) {
        private enum enumMixinStr_TKT_FLG_OK_AS_DELEGATE = `enum TKT_FLG_OK_AS_DELEGATE = 0x00040000;`;
        static if(is(typeof({ mixin(enumMixinStr_TKT_FLG_OK_AS_DELEGATE); }))) {
            mixin(enumMixinStr_TKT_FLG_OK_AS_DELEGATE);
        }
    }




    static if(!is(typeof(TKT_FLG_TRANSIT_POLICY_CHECKED))) {
        private enum enumMixinStr_TKT_FLG_TRANSIT_POLICY_CHECKED = `enum TKT_FLG_TRANSIT_POLICY_CHECKED = 0x00080000;`;
        static if(is(typeof({ mixin(enumMixinStr_TKT_FLG_TRANSIT_POLICY_CHECKED); }))) {
            mixin(enumMixinStr_TKT_FLG_TRANSIT_POLICY_CHECKED);
        }
    }




    static if(!is(typeof(TKT_FLG_HW_AUTH))) {
        private enum enumMixinStr_TKT_FLG_HW_AUTH = `enum TKT_FLG_HW_AUTH = 0x00100000;`;
        static if(is(typeof({ mixin(enumMixinStr_TKT_FLG_HW_AUTH); }))) {
            mixin(enumMixinStr_TKT_FLG_HW_AUTH);
        }
    }




    static if(!is(typeof(TKT_FLG_PRE_AUTH))) {
        private enum enumMixinStr_TKT_FLG_PRE_AUTH = `enum TKT_FLG_PRE_AUTH = 0x00200000;`;
        static if(is(typeof({ mixin(enumMixinStr_TKT_FLG_PRE_AUTH); }))) {
            mixin(enumMixinStr_TKT_FLG_PRE_AUTH);
        }
    }




    static if(!is(typeof(TKT_FLG_INITIAL))) {
        private enum enumMixinStr_TKT_FLG_INITIAL = `enum TKT_FLG_INITIAL = 0x00400000;`;
        static if(is(typeof({ mixin(enumMixinStr_TKT_FLG_INITIAL); }))) {
            mixin(enumMixinStr_TKT_FLG_INITIAL);
        }
    }




    static if(!is(typeof(TKT_FLG_RENEWABLE))) {
        private enum enumMixinStr_TKT_FLG_RENEWABLE = `enum TKT_FLG_RENEWABLE = 0x00800000;`;
        static if(is(typeof({ mixin(enumMixinStr_TKT_FLG_RENEWABLE); }))) {
            mixin(enumMixinStr_TKT_FLG_RENEWABLE);
        }
    }




    static if(!is(typeof(TKT_FLG_INVALID))) {
        private enum enumMixinStr_TKT_FLG_INVALID = `enum TKT_FLG_INVALID = 0x01000000;`;
        static if(is(typeof({ mixin(enumMixinStr_TKT_FLG_INVALID); }))) {
            mixin(enumMixinStr_TKT_FLG_INVALID);
        }
    }




    static if(!is(typeof(TKT_FLG_POSTDATED))) {
        private enum enumMixinStr_TKT_FLG_POSTDATED = `enum TKT_FLG_POSTDATED = 0x02000000;`;
        static if(is(typeof({ mixin(enumMixinStr_TKT_FLG_POSTDATED); }))) {
            mixin(enumMixinStr_TKT_FLG_POSTDATED);
        }
    }




    static if(!is(typeof(TKT_FLG_MAY_POSTDATE))) {
        private enum enumMixinStr_TKT_FLG_MAY_POSTDATE = `enum TKT_FLG_MAY_POSTDATE = 0x04000000;`;
        static if(is(typeof({ mixin(enumMixinStr_TKT_FLG_MAY_POSTDATE); }))) {
            mixin(enumMixinStr_TKT_FLG_MAY_POSTDATE);
        }
    }




    static if(!is(typeof(TKT_FLG_PROXY))) {
        private enum enumMixinStr_TKT_FLG_PROXY = `enum TKT_FLG_PROXY = 0x08000000;`;
        static if(is(typeof({ mixin(enumMixinStr_TKT_FLG_PROXY); }))) {
            mixin(enumMixinStr_TKT_FLG_PROXY);
        }
    }




    static if(!is(typeof(TKT_FLG_PROXIABLE))) {
        private enum enumMixinStr_TKT_FLG_PROXIABLE = `enum TKT_FLG_PROXIABLE = 0x10000000;`;
        static if(is(typeof({ mixin(enumMixinStr_TKT_FLG_PROXIABLE); }))) {
            mixin(enumMixinStr_TKT_FLG_PROXIABLE);
        }
    }




    static if(!is(typeof(TKT_FLG_FORWARDED))) {
        private enum enumMixinStr_TKT_FLG_FORWARDED = `enum TKT_FLG_FORWARDED = 0x20000000;`;
        static if(is(typeof({ mixin(enumMixinStr_TKT_FLG_FORWARDED); }))) {
            mixin(enumMixinStr_TKT_FLG_FORWARDED);
        }
    }




    static if(!is(typeof(TKT_FLG_FORWARDABLE))) {
        private enum enumMixinStr_TKT_FLG_FORWARDABLE = `enum TKT_FLG_FORWARDABLE = 0x40000000;`;
        static if(is(typeof({ mixin(enumMixinStr_TKT_FLG_FORWARDABLE); }))) {
            mixin(enumMixinStr_TKT_FLG_FORWARDABLE);
        }
    }




    static if(!is(typeof(AD_TYPE_FIELD_TYPE_MASK))) {
        private enum enumMixinStr_AD_TYPE_FIELD_TYPE_MASK = `enum AD_TYPE_FIELD_TYPE_MASK = 0x1fff;`;
        static if(is(typeof({ mixin(enumMixinStr_AD_TYPE_FIELD_TYPE_MASK); }))) {
            mixin(enumMixinStr_AD_TYPE_FIELD_TYPE_MASK);
        }
    }




    static if(!is(typeof(AD_TYPE_REGISTERED))) {
        private enum enumMixinStr_AD_TYPE_REGISTERED = `enum AD_TYPE_REGISTERED = 0x2000;`;
        static if(is(typeof({ mixin(enumMixinStr_AD_TYPE_REGISTERED); }))) {
            mixin(enumMixinStr_AD_TYPE_REGISTERED);
        }
    }




    static if(!is(typeof(AD_TYPE_EXTERNAL))) {
        private enum enumMixinStr_AD_TYPE_EXTERNAL = `enum AD_TYPE_EXTERNAL = 0x4000;`;
        static if(is(typeof({ mixin(enumMixinStr_AD_TYPE_EXTERNAL); }))) {
            mixin(enumMixinStr_AD_TYPE_EXTERNAL);
        }
    }




    static if(!is(typeof(AD_TYPE_RESERVED))) {
        private enum enumMixinStr_AD_TYPE_RESERVED = `enum AD_TYPE_RESERVED = 0x8000;`;
        static if(is(typeof({ mixin(enumMixinStr_AD_TYPE_RESERVED); }))) {
            mixin(enumMixinStr_AD_TYPE_RESERVED);
        }
    }




    static if(!is(typeof(AP_OPTS_WIRE_MASK))) {
        private enum enumMixinStr_AP_OPTS_WIRE_MASK = `enum AP_OPTS_WIRE_MASK = 0xfffffff0;`;
        static if(is(typeof({ mixin(enumMixinStr_AP_OPTS_WIRE_MASK); }))) {
            mixin(enumMixinStr_AP_OPTS_WIRE_MASK);
        }
    }




    static if(!is(typeof(AP_OPTS_USE_SUBKEY))) {
        private enum enumMixinStr_AP_OPTS_USE_SUBKEY = `enum AP_OPTS_USE_SUBKEY = 0x00000001;`;
        static if(is(typeof({ mixin(enumMixinStr_AP_OPTS_USE_SUBKEY); }))) {
            mixin(enumMixinStr_AP_OPTS_USE_SUBKEY);
        }
    }




    static if(!is(typeof(AP_OPTS_ETYPE_NEGOTIATION))) {
        private enum enumMixinStr_AP_OPTS_ETYPE_NEGOTIATION = `enum AP_OPTS_ETYPE_NEGOTIATION = 0x00000002;`;
        static if(is(typeof({ mixin(enumMixinStr_AP_OPTS_ETYPE_NEGOTIATION); }))) {
            mixin(enumMixinStr_AP_OPTS_ETYPE_NEGOTIATION);
        }
    }




    static if(!is(typeof(AP_OPTS_MUTUAL_REQUIRED))) {
        private enum enumMixinStr_AP_OPTS_MUTUAL_REQUIRED = `enum AP_OPTS_MUTUAL_REQUIRED = 0x20000000;`;
        static if(is(typeof({ mixin(enumMixinStr_AP_OPTS_MUTUAL_REQUIRED); }))) {
            mixin(enumMixinStr_AP_OPTS_MUTUAL_REQUIRED);
        }
    }




    static if(!is(typeof(AP_OPTS_USE_SESSION_KEY))) {
        private enum enumMixinStr_AP_OPTS_USE_SESSION_KEY = `enum AP_OPTS_USE_SESSION_KEY = 0x40000000;`;
        static if(is(typeof({ mixin(enumMixinStr_AP_OPTS_USE_SESSION_KEY); }))) {
            mixin(enumMixinStr_AP_OPTS_USE_SESSION_KEY);
        }
    }




    static if(!is(typeof(AP_OPTS_RESERVED))) {
        private enum enumMixinStr_AP_OPTS_RESERVED = `enum AP_OPTS_RESERVED = 0x80000000;`;
        static if(is(typeof({ mixin(enumMixinStr_AP_OPTS_RESERVED); }))) {
            mixin(enumMixinStr_AP_OPTS_RESERVED);
        }
    }




    static if(!is(typeof(KDC_TKT_COMMON_MASK))) {
        private enum enumMixinStr_KDC_TKT_COMMON_MASK = `enum KDC_TKT_COMMON_MASK = 0x54800000;`;
        static if(is(typeof({ mixin(enumMixinStr_KDC_TKT_COMMON_MASK); }))) {
            mixin(enumMixinStr_KDC_TKT_COMMON_MASK);
        }
    }




    static if(!is(typeof(KDC_OPT_VALIDATE))) {
        private enum enumMixinStr_KDC_OPT_VALIDATE = `enum KDC_OPT_VALIDATE = 0x00000001;`;
        static if(is(typeof({ mixin(enumMixinStr_KDC_OPT_VALIDATE); }))) {
            mixin(enumMixinStr_KDC_OPT_VALIDATE);
        }
    }




    static if(!is(typeof(KDC_OPT_RENEW))) {
        private enum enumMixinStr_KDC_OPT_RENEW = `enum KDC_OPT_RENEW = 0x00000002;`;
        static if(is(typeof({ mixin(enumMixinStr_KDC_OPT_RENEW); }))) {
            mixin(enumMixinStr_KDC_OPT_RENEW);
        }
    }




    static if(!is(typeof(KDC_OPT_ENC_TKT_IN_SKEY))) {
        private enum enumMixinStr_KDC_OPT_ENC_TKT_IN_SKEY = `enum KDC_OPT_ENC_TKT_IN_SKEY = 0x00000008;`;
        static if(is(typeof({ mixin(enumMixinStr_KDC_OPT_ENC_TKT_IN_SKEY); }))) {
            mixin(enumMixinStr_KDC_OPT_ENC_TKT_IN_SKEY);
        }
    }




    static if(!is(typeof(KDC_OPT_RENEWABLE_OK))) {
        private enum enumMixinStr_KDC_OPT_RENEWABLE_OK = `enum KDC_OPT_RENEWABLE_OK = 0x00000010;`;
        static if(is(typeof({ mixin(enumMixinStr_KDC_OPT_RENEWABLE_OK); }))) {
            mixin(enumMixinStr_KDC_OPT_RENEWABLE_OK);
        }
    }




    static if(!is(typeof(KDC_OPT_DISABLE_TRANSITED_CHECK))) {
        private enum enumMixinStr_KDC_OPT_DISABLE_TRANSITED_CHECK = `enum KDC_OPT_DISABLE_TRANSITED_CHECK = 0x00000020;`;
        static if(is(typeof({ mixin(enumMixinStr_KDC_OPT_DISABLE_TRANSITED_CHECK); }))) {
            mixin(enumMixinStr_KDC_OPT_DISABLE_TRANSITED_CHECK);
        }
    }




    static if(!is(typeof(KDC_OPT_REQUEST_ANONYMOUS))) {
        private enum enumMixinStr_KDC_OPT_REQUEST_ANONYMOUS = `enum KDC_OPT_REQUEST_ANONYMOUS = 0x00008000;`;
        static if(is(typeof({ mixin(enumMixinStr_KDC_OPT_REQUEST_ANONYMOUS); }))) {
            mixin(enumMixinStr_KDC_OPT_REQUEST_ANONYMOUS);
        }
    }




    static if(!is(typeof(KDC_OPT_CANONICALIZE))) {
        private enum enumMixinStr_KDC_OPT_CANONICALIZE = `enum KDC_OPT_CANONICALIZE = 0x00010000;`;
        static if(is(typeof({ mixin(enumMixinStr_KDC_OPT_CANONICALIZE); }))) {
            mixin(enumMixinStr_KDC_OPT_CANONICALIZE);
        }
    }




    static if(!is(typeof(KDC_OPT_CNAME_IN_ADDL_TKT))) {
        private enum enumMixinStr_KDC_OPT_CNAME_IN_ADDL_TKT = `enum KDC_OPT_CNAME_IN_ADDL_TKT = 0x00020000;`;
        static if(is(typeof({ mixin(enumMixinStr_KDC_OPT_CNAME_IN_ADDL_TKT); }))) {
            mixin(enumMixinStr_KDC_OPT_CNAME_IN_ADDL_TKT);
        }
    }




    static if(!is(typeof(KDC_OPT_RENEWABLE))) {
        private enum enumMixinStr_KDC_OPT_RENEWABLE = `enum KDC_OPT_RENEWABLE = 0x00800000;`;
        static if(is(typeof({ mixin(enumMixinStr_KDC_OPT_RENEWABLE); }))) {
            mixin(enumMixinStr_KDC_OPT_RENEWABLE);
        }
    }




    static if(!is(typeof(KDC_OPT_POSTDATED))) {
        private enum enumMixinStr_KDC_OPT_POSTDATED = `enum KDC_OPT_POSTDATED = 0x02000000;`;
        static if(is(typeof({ mixin(enumMixinStr_KDC_OPT_POSTDATED); }))) {
            mixin(enumMixinStr_KDC_OPT_POSTDATED);
        }
    }




    static if(!is(typeof(KRB5_PAC_LOGON_INFO))) {
        private enum enumMixinStr_KRB5_PAC_LOGON_INFO = `enum KRB5_PAC_LOGON_INFO = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PAC_LOGON_INFO); }))) {
            mixin(enumMixinStr_KRB5_PAC_LOGON_INFO);
        }
    }




    static if(!is(typeof(KRB5_PAC_CREDENTIALS_INFO))) {
        private enum enumMixinStr_KRB5_PAC_CREDENTIALS_INFO = `enum KRB5_PAC_CREDENTIALS_INFO = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PAC_CREDENTIALS_INFO); }))) {
            mixin(enumMixinStr_KRB5_PAC_CREDENTIALS_INFO);
        }
    }




    static if(!is(typeof(KRB5_PAC_SERVER_CHECKSUM))) {
        private enum enumMixinStr_KRB5_PAC_SERVER_CHECKSUM = `enum KRB5_PAC_SERVER_CHECKSUM = 6;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PAC_SERVER_CHECKSUM); }))) {
            mixin(enumMixinStr_KRB5_PAC_SERVER_CHECKSUM);
        }
    }




    static if(!is(typeof(KRB5_PAC_PRIVSVR_CHECKSUM))) {
        private enum enumMixinStr_KRB5_PAC_PRIVSVR_CHECKSUM = `enum KRB5_PAC_PRIVSVR_CHECKSUM = 7;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PAC_PRIVSVR_CHECKSUM); }))) {
            mixin(enumMixinStr_KRB5_PAC_PRIVSVR_CHECKSUM);
        }
    }




    static if(!is(typeof(KRB5_PAC_CLIENT_INFO))) {
        private enum enumMixinStr_KRB5_PAC_CLIENT_INFO = `enum KRB5_PAC_CLIENT_INFO = 10;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PAC_CLIENT_INFO); }))) {
            mixin(enumMixinStr_KRB5_PAC_CLIENT_INFO);
        }
    }




    static if(!is(typeof(KRB5_PAC_DELEGATION_INFO))) {
        private enum enumMixinStr_KRB5_PAC_DELEGATION_INFO = `enum KRB5_PAC_DELEGATION_INFO = 11;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PAC_DELEGATION_INFO); }))) {
            mixin(enumMixinStr_KRB5_PAC_DELEGATION_INFO);
        }
    }




    static if(!is(typeof(KRB5_PAC_UPN_DNS_INFO))) {
        private enum enumMixinStr_KRB5_PAC_UPN_DNS_INFO = `enum KRB5_PAC_UPN_DNS_INFO = 12;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PAC_UPN_DNS_INFO); }))) {
            mixin(enumMixinStr_KRB5_PAC_UPN_DNS_INFO);
        }
    }




    static if(!is(typeof(KDC_OPT_ALLOW_POSTDATE))) {
        private enum enumMixinStr_KDC_OPT_ALLOW_POSTDATE = `enum KDC_OPT_ALLOW_POSTDATE = 0x04000000;`;
        static if(is(typeof({ mixin(enumMixinStr_KDC_OPT_ALLOW_POSTDATE); }))) {
            mixin(enumMixinStr_KDC_OPT_ALLOW_POSTDATE);
        }
    }




    static if(!is(typeof(KDC_OPT_PROXY))) {
        private enum enumMixinStr_KDC_OPT_PROXY = `enum KDC_OPT_PROXY = 0x08000000;`;
        static if(is(typeof({ mixin(enumMixinStr_KDC_OPT_PROXY); }))) {
            mixin(enumMixinStr_KDC_OPT_PROXY);
        }
    }




    static if(!is(typeof(KDC_OPT_PROXIABLE))) {
        private enum enumMixinStr_KDC_OPT_PROXIABLE = `enum KDC_OPT_PROXIABLE = 0x10000000;`;
        static if(is(typeof({ mixin(enumMixinStr_KDC_OPT_PROXIABLE); }))) {
            mixin(enumMixinStr_KDC_OPT_PROXIABLE);
        }
    }




    static if(!is(typeof(KDC_OPT_FORWARDED))) {
        private enum enumMixinStr_KDC_OPT_FORWARDED = `enum KDC_OPT_FORWARDED = 0x20000000;`;
        static if(is(typeof({ mixin(enumMixinStr_KDC_OPT_FORWARDED); }))) {
            mixin(enumMixinStr_KDC_OPT_FORWARDED);
        }
    }




    static if(!is(typeof(KDC_OPT_FORWARDABLE))) {
        private enum enumMixinStr_KDC_OPT_FORWARDABLE = `enum KDC_OPT_FORWARDABLE = 0x40000000;`;
        static if(is(typeof({ mixin(enumMixinStr_KDC_OPT_FORWARDABLE); }))) {
            mixin(enumMixinStr_KDC_OPT_FORWARDABLE);
        }
    }




    static if(!is(typeof(KRB5_CRYPTO_TYPE_STREAM))) {
        private enum enumMixinStr_KRB5_CRYPTO_TYPE_STREAM = `enum KRB5_CRYPTO_TYPE_STREAM = 7;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CRYPTO_TYPE_STREAM); }))) {
            mixin(enumMixinStr_KRB5_CRYPTO_TYPE_STREAM);
        }
    }




    static if(!is(typeof(KRB5_CRYPTO_TYPE_CHECKSUM))) {
        private enum enumMixinStr_KRB5_CRYPTO_TYPE_CHECKSUM = `enum KRB5_CRYPTO_TYPE_CHECKSUM = 6;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CRYPTO_TYPE_CHECKSUM); }))) {
            mixin(enumMixinStr_KRB5_CRYPTO_TYPE_CHECKSUM);
        }
    }




    static if(!is(typeof(KRB5_CRYPTO_TYPE_TRAILER))) {
        private enum enumMixinStr_KRB5_CRYPTO_TYPE_TRAILER = `enum KRB5_CRYPTO_TYPE_TRAILER = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CRYPTO_TYPE_TRAILER); }))) {
            mixin(enumMixinStr_KRB5_CRYPTO_TYPE_TRAILER);
        }
    }




    static if(!is(typeof(KRB5_CRYPTO_TYPE_PADDING))) {
        private enum enumMixinStr_KRB5_CRYPTO_TYPE_PADDING = `enum KRB5_CRYPTO_TYPE_PADDING = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CRYPTO_TYPE_PADDING); }))) {
            mixin(enumMixinStr_KRB5_CRYPTO_TYPE_PADDING);
        }
    }




    static if(!is(typeof(KRB5_CRYPTO_TYPE_SIGN_ONLY))) {
        private enum enumMixinStr_KRB5_CRYPTO_TYPE_SIGN_ONLY = `enum KRB5_CRYPTO_TYPE_SIGN_ONLY = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CRYPTO_TYPE_SIGN_ONLY); }))) {
            mixin(enumMixinStr_KRB5_CRYPTO_TYPE_SIGN_ONLY);
        }
    }




    static if(!is(typeof(KRB5_CRYPTO_TYPE_DATA))) {
        private enum enumMixinStr_KRB5_CRYPTO_TYPE_DATA = `enum KRB5_CRYPTO_TYPE_DATA = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CRYPTO_TYPE_DATA); }))) {
            mixin(enumMixinStr_KRB5_CRYPTO_TYPE_DATA);
        }
    }




    static if(!is(typeof(KRB5_CRYPTO_TYPE_HEADER))) {
        private enum enumMixinStr_KRB5_CRYPTO_TYPE_HEADER = `enum KRB5_CRYPTO_TYPE_HEADER = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CRYPTO_TYPE_HEADER); }))) {
            mixin(enumMixinStr_KRB5_CRYPTO_TYPE_HEADER);
        }
    }




    static if(!is(typeof(KRB5_CRYPTO_TYPE_EMPTY))) {
        private enum enumMixinStr_KRB5_CRYPTO_TYPE_EMPTY = `enum KRB5_CRYPTO_TYPE_EMPTY = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CRYPTO_TYPE_EMPTY); }))) {
            mixin(enumMixinStr_KRB5_CRYPTO_TYPE_EMPTY);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_PA_AS_FRESHNESS))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_PA_AS_FRESHNESS = `enum KRB5_KEYUSAGE_PA_AS_FRESHNESS = 514;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_PA_AS_FRESHNESS); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_PA_AS_FRESHNESS);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_PA_FX_COOKIE))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_PA_FX_COOKIE = `enum KRB5_KEYUSAGE_PA_FX_COOKIE = 513;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_PA_FX_COOKIE); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_PA_FX_COOKIE);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_SPAKE))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_SPAKE = `enum KRB5_KEYUSAGE_SPAKE = 65;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_SPAKE); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_SPAKE);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_CAMMAC))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_CAMMAC = `enum KRB5_KEYUSAGE_CAMMAC = 64;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_CAMMAC); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_CAMMAC);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_AS_REQ))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_AS_REQ = `enum KRB5_KEYUSAGE_AS_REQ = 56;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_AS_REQ); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_AS_REQ);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_ENC_CHALLENGE_KDC))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_ENC_CHALLENGE_KDC = `enum KRB5_KEYUSAGE_ENC_CHALLENGE_KDC = 55;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_ENC_CHALLENGE_KDC); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_ENC_CHALLENGE_KDC);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_ENC_CHALLENGE_CLIENT))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_ENC_CHALLENGE_CLIENT = `enum KRB5_KEYUSAGE_ENC_CHALLENGE_CLIENT = 54;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_ENC_CHALLENGE_CLIENT); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_ENC_CHALLENGE_CLIENT);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_FAST_FINISHED))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_FAST_FINISHED = `enum KRB5_KEYUSAGE_FAST_FINISHED = 53;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_FAST_FINISHED); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_FAST_FINISHED);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_FAST_REP))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_FAST_REP = `enum KRB5_KEYUSAGE_FAST_REP = 52;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_FAST_REP); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_FAST_REP);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_FAST_ENC))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_FAST_ENC = `enum KRB5_KEYUSAGE_FAST_ENC = 51;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_FAST_ENC); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_FAST_ENC);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_FAST_REQ_CHKSUM))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_FAST_REQ_CHKSUM = `enum KRB5_KEYUSAGE_FAST_REQ_CHKSUM = 50;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_FAST_REQ_CHKSUM); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_FAST_REQ_CHKSUM);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_PA_OTP_REQUEST))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_PA_OTP_REQUEST = `enum KRB5_KEYUSAGE_PA_OTP_REQUEST = 45;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_PA_OTP_REQUEST); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_PA_OTP_REQUEST);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_PA_PKINIT_KX))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_PA_PKINIT_KX = `enum KRB5_KEYUSAGE_PA_PKINIT_KX = 44;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_PA_PKINIT_KX); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_PA_PKINIT_KX);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_IAKERB_FINISHED))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_IAKERB_FINISHED = `enum KRB5_KEYUSAGE_IAKERB_FINISHED = 42;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_IAKERB_FINISHED); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_IAKERB_FINISHED);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_AD_SIGNEDPATH))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_AD_SIGNEDPATH = `enum KRB5_KEYUSAGE_AD_SIGNEDPATH = - 21;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_AD_SIGNEDPATH); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_AD_SIGNEDPATH);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_PA_REFERRAL))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_PA_REFERRAL = `enum KRB5_KEYUSAGE_PA_REFERRAL = 26;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_PA_REFERRAL); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_PA_REFERRAL);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_PA_S4U_X509_USER_REPLY))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_PA_S4U_X509_USER_REPLY = `enum KRB5_KEYUSAGE_PA_S4U_X509_USER_REPLY = 27;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_PA_S4U_X509_USER_REPLY); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_PA_S4U_X509_USER_REPLY);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_PA_S4U_X509_USER_REQUEST))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_PA_S4U_X509_USER_REQUEST = `enum KRB5_KEYUSAGE_PA_S4U_X509_USER_REQUEST = 26;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_PA_S4U_X509_USER_REQUEST); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_PA_S4U_X509_USER_REQUEST);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_PA_SAM_RESPONSE))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_PA_SAM_RESPONSE = `enum KRB5_KEYUSAGE_PA_SAM_RESPONSE = 27;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_PA_SAM_RESPONSE); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_PA_SAM_RESPONSE);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_PA_SAM_CHALLENGE_TRACKID))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_PA_SAM_CHALLENGE_TRACKID = `enum KRB5_KEYUSAGE_PA_SAM_CHALLENGE_TRACKID = 26;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_PA_SAM_CHALLENGE_TRACKID); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_PA_SAM_CHALLENGE_TRACKID);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_PA_SAM_CHALLENGE_CKSUM))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_PA_SAM_CHALLENGE_CKSUM = `enum KRB5_KEYUSAGE_PA_SAM_CHALLENGE_CKSUM = 25;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_PA_SAM_CHALLENGE_CKSUM); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_PA_SAM_CHALLENGE_CKSUM);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_GSS_TOK_WRAP_PRIV))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_GSS_TOK_WRAP_PRIV = `enum KRB5_KEYUSAGE_GSS_TOK_WRAP_PRIV = 24;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_GSS_TOK_WRAP_PRIV); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_GSS_TOK_WRAP_PRIV);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_GSS_TOK_WRAP_INTEG))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_GSS_TOK_WRAP_INTEG = `enum KRB5_KEYUSAGE_GSS_TOK_WRAP_INTEG = 23;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_GSS_TOK_WRAP_INTEG); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_GSS_TOK_WRAP_INTEG);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_GSS_TOK_MIC))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_GSS_TOK_MIC = `enum KRB5_KEYUSAGE_GSS_TOK_MIC = 22;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_GSS_TOK_MIC); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_GSS_TOK_MIC);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_AD_ITE))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_AD_ITE = `enum KRB5_KEYUSAGE_AD_ITE = 21;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_AD_ITE); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_AD_ITE);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_AD_MTE))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_AD_MTE = `enum KRB5_KEYUSAGE_AD_MTE = 20;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_AD_MTE); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_AD_MTE);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_AD_KDCISSUED_CKSUM))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_AD_KDCISSUED_CKSUM = `enum KRB5_KEYUSAGE_AD_KDCISSUED_CKSUM = 19;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_AD_KDCISSUED_CKSUM); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_AD_KDCISSUED_CKSUM);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_KRB_ERROR_CKSUM))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_KRB_ERROR_CKSUM = `enum KRB5_KEYUSAGE_KRB_ERROR_CKSUM = 18;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_KRB_ERROR_CKSUM); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_KRB_ERROR_CKSUM);
        }
    }




    static if(!is(typeof(krb5_const))) {
        private enum enumMixinStr_krb5_const = `enum krb5_const = const;`;
        static if(is(typeof({ mixin(enumMixinStr_krb5_const); }))) {
            mixin(enumMixinStr_krb5_const);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_APP_DATA_CKSUM))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_APP_DATA_CKSUM = `enum KRB5_KEYUSAGE_APP_DATA_CKSUM = 17;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_APP_DATA_CKSUM); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_APP_DATA_CKSUM);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_NONE))) {
        private enum enumMixinStr_KRB5KDC_ERR_NONE = `enum KRB5KDC_ERR_NONE = ( - 1765328384L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_NONE); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_NONE);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_NAME_EXP))) {
        private enum enumMixinStr_KRB5KDC_ERR_NAME_EXP = `enum KRB5KDC_ERR_NAME_EXP = ( - 1765328383L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_NAME_EXP); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_NAME_EXP);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_SERVICE_EXP))) {
        private enum enumMixinStr_KRB5KDC_ERR_SERVICE_EXP = `enum KRB5KDC_ERR_SERVICE_EXP = ( - 1765328382L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_SERVICE_EXP); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_SERVICE_EXP);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_BAD_PVNO))) {
        private enum enumMixinStr_KRB5KDC_ERR_BAD_PVNO = `enum KRB5KDC_ERR_BAD_PVNO = ( - 1765328381L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_BAD_PVNO); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_BAD_PVNO);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_C_OLD_MAST_KVNO))) {
        private enum enumMixinStr_KRB5KDC_ERR_C_OLD_MAST_KVNO = `enum KRB5KDC_ERR_C_OLD_MAST_KVNO = ( - 1765328380L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_C_OLD_MAST_KVNO); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_C_OLD_MAST_KVNO);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_S_OLD_MAST_KVNO))) {
        private enum enumMixinStr_KRB5KDC_ERR_S_OLD_MAST_KVNO = `enum KRB5KDC_ERR_S_OLD_MAST_KVNO = ( - 1765328379L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_S_OLD_MAST_KVNO); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_S_OLD_MAST_KVNO);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_C_PRINCIPAL_UNKNOWN))) {
        private enum enumMixinStr_KRB5KDC_ERR_C_PRINCIPAL_UNKNOWN = `enum KRB5KDC_ERR_C_PRINCIPAL_UNKNOWN = ( - 1765328378L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_C_PRINCIPAL_UNKNOWN); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_C_PRINCIPAL_UNKNOWN);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_S_PRINCIPAL_UNKNOWN))) {
        private enum enumMixinStr_KRB5KDC_ERR_S_PRINCIPAL_UNKNOWN = `enum KRB5KDC_ERR_S_PRINCIPAL_UNKNOWN = ( - 1765328377L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_S_PRINCIPAL_UNKNOWN); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_S_PRINCIPAL_UNKNOWN);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_PRINCIPAL_NOT_UNIQUE))) {
        private enum enumMixinStr_KRB5KDC_ERR_PRINCIPAL_NOT_UNIQUE = `enum KRB5KDC_ERR_PRINCIPAL_NOT_UNIQUE = ( - 1765328376L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_PRINCIPAL_NOT_UNIQUE); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_PRINCIPAL_NOT_UNIQUE);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_NULL_KEY))) {
        private enum enumMixinStr_KRB5KDC_ERR_NULL_KEY = `enum KRB5KDC_ERR_NULL_KEY = ( - 1765328375L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_NULL_KEY); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_NULL_KEY);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_CANNOT_POSTDATE))) {
        private enum enumMixinStr_KRB5KDC_ERR_CANNOT_POSTDATE = `enum KRB5KDC_ERR_CANNOT_POSTDATE = ( - 1765328374L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_CANNOT_POSTDATE); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_CANNOT_POSTDATE);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_NEVER_VALID))) {
        private enum enumMixinStr_KRB5KDC_ERR_NEVER_VALID = `enum KRB5KDC_ERR_NEVER_VALID = ( - 1765328373L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_NEVER_VALID); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_NEVER_VALID);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_POLICY))) {
        private enum enumMixinStr_KRB5KDC_ERR_POLICY = `enum KRB5KDC_ERR_POLICY = ( - 1765328372L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_POLICY); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_POLICY);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_BADOPTION))) {
        private enum enumMixinStr_KRB5KDC_ERR_BADOPTION = `enum KRB5KDC_ERR_BADOPTION = ( - 1765328371L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_BADOPTION); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_BADOPTION);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_ETYPE_NOSUPP))) {
        private enum enumMixinStr_KRB5KDC_ERR_ETYPE_NOSUPP = `enum KRB5KDC_ERR_ETYPE_NOSUPP = ( - 1765328370L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_ETYPE_NOSUPP); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_ETYPE_NOSUPP);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_SUMTYPE_NOSUPP))) {
        private enum enumMixinStr_KRB5KDC_ERR_SUMTYPE_NOSUPP = `enum KRB5KDC_ERR_SUMTYPE_NOSUPP = ( - 1765328369L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_SUMTYPE_NOSUPP); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_SUMTYPE_NOSUPP);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_PADATA_TYPE_NOSUPP))) {
        private enum enumMixinStr_KRB5KDC_ERR_PADATA_TYPE_NOSUPP = `enum KRB5KDC_ERR_PADATA_TYPE_NOSUPP = ( - 1765328368L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_PADATA_TYPE_NOSUPP); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_PADATA_TYPE_NOSUPP);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_TRTYPE_NOSUPP))) {
        private enum enumMixinStr_KRB5KDC_ERR_TRTYPE_NOSUPP = `enum KRB5KDC_ERR_TRTYPE_NOSUPP = ( - 1765328367L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_TRTYPE_NOSUPP); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_TRTYPE_NOSUPP);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_CLIENT_REVOKED))) {
        private enum enumMixinStr_KRB5KDC_ERR_CLIENT_REVOKED = `enum KRB5KDC_ERR_CLIENT_REVOKED = ( - 1765328366L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_CLIENT_REVOKED); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_CLIENT_REVOKED);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_SERVICE_REVOKED))) {
        private enum enumMixinStr_KRB5KDC_ERR_SERVICE_REVOKED = `enum KRB5KDC_ERR_SERVICE_REVOKED = ( - 1765328365L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_SERVICE_REVOKED); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_SERVICE_REVOKED);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_TGT_REVOKED))) {
        private enum enumMixinStr_KRB5KDC_ERR_TGT_REVOKED = `enum KRB5KDC_ERR_TGT_REVOKED = ( - 1765328364L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_TGT_REVOKED); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_TGT_REVOKED);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_CLIENT_NOTYET))) {
        private enum enumMixinStr_KRB5KDC_ERR_CLIENT_NOTYET = `enum KRB5KDC_ERR_CLIENT_NOTYET = ( - 1765328363L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_CLIENT_NOTYET); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_CLIENT_NOTYET);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_SERVICE_NOTYET))) {
        private enum enumMixinStr_KRB5KDC_ERR_SERVICE_NOTYET = `enum KRB5KDC_ERR_SERVICE_NOTYET = ( - 1765328362L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_SERVICE_NOTYET); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_SERVICE_NOTYET);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_KEY_EXP))) {
        private enum enumMixinStr_KRB5KDC_ERR_KEY_EXP = `enum KRB5KDC_ERR_KEY_EXP = ( - 1765328361L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_KEY_EXP); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_KEY_EXP);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_PREAUTH_FAILED))) {
        private enum enumMixinStr_KRB5KDC_ERR_PREAUTH_FAILED = `enum KRB5KDC_ERR_PREAUTH_FAILED = ( - 1765328360L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_PREAUTH_FAILED); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_PREAUTH_FAILED);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_PREAUTH_REQUIRED))) {
        private enum enumMixinStr_KRB5KDC_ERR_PREAUTH_REQUIRED = `enum KRB5KDC_ERR_PREAUTH_REQUIRED = ( - 1765328359L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_PREAUTH_REQUIRED); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_PREAUTH_REQUIRED);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_SERVER_NOMATCH))) {
        private enum enumMixinStr_KRB5KDC_ERR_SERVER_NOMATCH = `enum KRB5KDC_ERR_SERVER_NOMATCH = ( - 1765328358L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_SERVER_NOMATCH); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_SERVER_NOMATCH);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_MUST_USE_USER2USER))) {
        private enum enumMixinStr_KRB5KDC_ERR_MUST_USE_USER2USER = `enum KRB5KDC_ERR_MUST_USE_USER2USER = ( - 1765328357L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_MUST_USE_USER2USER); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_MUST_USE_USER2USER);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_PATH_NOT_ACCEPTED))) {
        private enum enumMixinStr_KRB5KDC_ERR_PATH_NOT_ACCEPTED = `enum KRB5KDC_ERR_PATH_NOT_ACCEPTED = ( - 1765328356L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_PATH_NOT_ACCEPTED); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_PATH_NOT_ACCEPTED);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_SVC_UNAVAILABLE))) {
        private enum enumMixinStr_KRB5KDC_ERR_SVC_UNAVAILABLE = `enum KRB5KDC_ERR_SVC_UNAVAILABLE = ( - 1765328355L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_SVC_UNAVAILABLE); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_SVC_UNAVAILABLE);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_30))) {
        private enum enumMixinStr_KRB5PLACEHOLD_30 = `enum KRB5PLACEHOLD_30 = ( - 1765328354L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_30); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_30);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_BAD_INTEGRITY))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_BAD_INTEGRITY = `enum KRB5KRB_AP_ERR_BAD_INTEGRITY = ( - 1765328353L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_BAD_INTEGRITY); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_BAD_INTEGRITY);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_TKT_EXPIRED))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_TKT_EXPIRED = `enum KRB5KRB_AP_ERR_TKT_EXPIRED = ( - 1765328352L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_TKT_EXPIRED); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_TKT_EXPIRED);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_TKT_NYV))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_TKT_NYV = `enum KRB5KRB_AP_ERR_TKT_NYV = ( - 1765328351L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_TKT_NYV); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_TKT_NYV);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_REPEAT))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_REPEAT = `enum KRB5KRB_AP_ERR_REPEAT = ( - 1765328350L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_REPEAT); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_REPEAT);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_NOT_US))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_NOT_US = `enum KRB5KRB_AP_ERR_NOT_US = ( - 1765328349L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_NOT_US); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_NOT_US);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_BADMATCH))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_BADMATCH = `enum KRB5KRB_AP_ERR_BADMATCH = ( - 1765328348L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_BADMATCH); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_BADMATCH);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_SKEW))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_SKEW = `enum KRB5KRB_AP_ERR_SKEW = ( - 1765328347L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_SKEW); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_SKEW);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_BADADDR))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_BADADDR = `enum KRB5KRB_AP_ERR_BADADDR = ( - 1765328346L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_BADADDR); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_BADADDR);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_BADVERSION))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_BADVERSION = `enum KRB5KRB_AP_ERR_BADVERSION = ( - 1765328345L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_BADVERSION); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_BADVERSION);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_MSG_TYPE))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_MSG_TYPE = `enum KRB5KRB_AP_ERR_MSG_TYPE = ( - 1765328344L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_MSG_TYPE); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_MSG_TYPE);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_MODIFIED))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_MODIFIED = `enum KRB5KRB_AP_ERR_MODIFIED = ( - 1765328343L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_MODIFIED); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_MODIFIED);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_BADORDER))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_BADORDER = `enum KRB5KRB_AP_ERR_BADORDER = ( - 1765328342L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_BADORDER); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_BADORDER);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_ILL_CR_TKT))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_ILL_CR_TKT = `enum KRB5KRB_AP_ERR_ILL_CR_TKT = ( - 1765328341L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_ILL_CR_TKT); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_ILL_CR_TKT);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_BADKEYVER))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_BADKEYVER = `enum KRB5KRB_AP_ERR_BADKEYVER = ( - 1765328340L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_BADKEYVER); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_BADKEYVER);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_NOKEY))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_NOKEY = `enum KRB5KRB_AP_ERR_NOKEY = ( - 1765328339L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_NOKEY); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_NOKEY);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_MUT_FAIL))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_MUT_FAIL = `enum KRB5KRB_AP_ERR_MUT_FAIL = ( - 1765328338L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_MUT_FAIL); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_MUT_FAIL);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_BADDIRECTION))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_BADDIRECTION = `enum KRB5KRB_AP_ERR_BADDIRECTION = ( - 1765328337L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_BADDIRECTION); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_BADDIRECTION);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_METHOD))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_METHOD = `enum KRB5KRB_AP_ERR_METHOD = ( - 1765328336L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_METHOD); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_METHOD);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_BADSEQ))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_BADSEQ = `enum KRB5KRB_AP_ERR_BADSEQ = ( - 1765328335L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_BADSEQ); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_BADSEQ);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_INAPP_CKSUM))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_INAPP_CKSUM = `enum KRB5KRB_AP_ERR_INAPP_CKSUM = ( - 1765328334L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_INAPP_CKSUM); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_INAPP_CKSUM);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_PATH_NOT_ACCEPTED))) {
        private enum enumMixinStr_KRB5KRB_AP_PATH_NOT_ACCEPTED = `enum KRB5KRB_AP_PATH_NOT_ACCEPTED = ( - 1765328333L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_PATH_NOT_ACCEPTED); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_PATH_NOT_ACCEPTED);
        }
    }




    static if(!is(typeof(KRB5KRB_ERR_RESPONSE_TOO_BIG))) {
        private enum enumMixinStr_KRB5KRB_ERR_RESPONSE_TOO_BIG = `enum KRB5KRB_ERR_RESPONSE_TOO_BIG = ( - 1765328332L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_ERR_RESPONSE_TOO_BIG); }))) {
            mixin(enumMixinStr_KRB5KRB_ERR_RESPONSE_TOO_BIG);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_53))) {
        private enum enumMixinStr_KRB5PLACEHOLD_53 = `enum KRB5PLACEHOLD_53 = ( - 1765328331L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_53); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_53);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_54))) {
        private enum enumMixinStr_KRB5PLACEHOLD_54 = `enum KRB5PLACEHOLD_54 = ( - 1765328330L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_54); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_54);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_55))) {
        private enum enumMixinStr_KRB5PLACEHOLD_55 = `enum KRB5PLACEHOLD_55 = ( - 1765328329L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_55); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_55);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_56))) {
        private enum enumMixinStr_KRB5PLACEHOLD_56 = `enum KRB5PLACEHOLD_56 = ( - 1765328328L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_56); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_56);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_57))) {
        private enum enumMixinStr_KRB5PLACEHOLD_57 = `enum KRB5PLACEHOLD_57 = ( - 1765328327L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_57); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_57);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_58))) {
        private enum enumMixinStr_KRB5PLACEHOLD_58 = `enum KRB5PLACEHOLD_58 = ( - 1765328326L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_58); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_58);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_59))) {
        private enum enumMixinStr_KRB5PLACEHOLD_59 = `enum KRB5PLACEHOLD_59 = ( - 1765328325L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_59); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_59);
        }
    }




    static if(!is(typeof(KRB5KRB_ERR_GENERIC))) {
        private enum enumMixinStr_KRB5KRB_ERR_GENERIC = `enum KRB5KRB_ERR_GENERIC = ( - 1765328324L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_ERR_GENERIC); }))) {
            mixin(enumMixinStr_KRB5KRB_ERR_GENERIC);
        }
    }




    static if(!is(typeof(KRB5KRB_ERR_FIELD_TOOLONG))) {
        private enum enumMixinStr_KRB5KRB_ERR_FIELD_TOOLONG = `enum KRB5KRB_ERR_FIELD_TOOLONG = ( - 1765328323L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_ERR_FIELD_TOOLONG); }))) {
            mixin(enumMixinStr_KRB5KRB_ERR_FIELD_TOOLONG);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_CLIENT_NOT_TRUSTED))) {
        private enum enumMixinStr_KRB5KDC_ERR_CLIENT_NOT_TRUSTED = `enum KRB5KDC_ERR_CLIENT_NOT_TRUSTED = ( - 1765328322L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_CLIENT_NOT_TRUSTED); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_CLIENT_NOT_TRUSTED);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_KDC_NOT_TRUSTED))) {
        private enum enumMixinStr_KRB5KDC_ERR_KDC_NOT_TRUSTED = `enum KRB5KDC_ERR_KDC_NOT_TRUSTED = ( - 1765328321L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_KDC_NOT_TRUSTED); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_KDC_NOT_TRUSTED);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_INVALID_SIG))) {
        private enum enumMixinStr_KRB5KDC_ERR_INVALID_SIG = `enum KRB5KDC_ERR_INVALID_SIG = ( - 1765328320L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_INVALID_SIG); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_INVALID_SIG);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_DH_KEY_PARAMETERS_NOT_ACCEPTED))) {
        private enum enumMixinStr_KRB5KDC_ERR_DH_KEY_PARAMETERS_NOT_ACCEPTED = `enum KRB5KDC_ERR_DH_KEY_PARAMETERS_NOT_ACCEPTED = ( - 1765328319L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_DH_KEY_PARAMETERS_NOT_ACCEPTED); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_DH_KEY_PARAMETERS_NOT_ACCEPTED);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_CERTIFICATE_MISMATCH))) {
        private enum enumMixinStr_KRB5KDC_ERR_CERTIFICATE_MISMATCH = `enum KRB5KDC_ERR_CERTIFICATE_MISMATCH = ( - 1765328318L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_CERTIFICATE_MISMATCH); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_CERTIFICATE_MISMATCH);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_NO_TGT))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_NO_TGT = `enum KRB5KRB_AP_ERR_NO_TGT = ( - 1765328317L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_NO_TGT); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_NO_TGT);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_WRONG_REALM))) {
        private enum enumMixinStr_KRB5KDC_ERR_WRONG_REALM = `enum KRB5KDC_ERR_WRONG_REALM = ( - 1765328316L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_WRONG_REALM); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_WRONG_REALM);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_USER_TO_USER_REQUIRED))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_USER_TO_USER_REQUIRED = `enum KRB5KRB_AP_ERR_USER_TO_USER_REQUIRED = ( - 1765328315L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_USER_TO_USER_REQUIRED); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_USER_TO_USER_REQUIRED);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_CANT_VERIFY_CERTIFICATE))) {
        private enum enumMixinStr_KRB5KDC_ERR_CANT_VERIFY_CERTIFICATE = `enum KRB5KDC_ERR_CANT_VERIFY_CERTIFICATE = ( - 1765328314L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_CANT_VERIFY_CERTIFICATE); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_CANT_VERIFY_CERTIFICATE);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_INVALID_CERTIFICATE))) {
        private enum enumMixinStr_KRB5KDC_ERR_INVALID_CERTIFICATE = `enum KRB5KDC_ERR_INVALID_CERTIFICATE = ( - 1765328313L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_INVALID_CERTIFICATE); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_INVALID_CERTIFICATE);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_REVOKED_CERTIFICATE))) {
        private enum enumMixinStr_KRB5KDC_ERR_REVOKED_CERTIFICATE = `enum KRB5KDC_ERR_REVOKED_CERTIFICATE = ( - 1765328312L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_REVOKED_CERTIFICATE); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_REVOKED_CERTIFICATE);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_REVOCATION_STATUS_UNKNOWN))) {
        private enum enumMixinStr_KRB5KDC_ERR_REVOCATION_STATUS_UNKNOWN = `enum KRB5KDC_ERR_REVOCATION_STATUS_UNKNOWN = ( - 1765328311L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_REVOCATION_STATUS_UNKNOWN); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_REVOCATION_STATUS_UNKNOWN);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_REVOCATION_STATUS_UNAVAILABLE))) {
        private enum enumMixinStr_KRB5KDC_ERR_REVOCATION_STATUS_UNAVAILABLE = `enum KRB5KDC_ERR_REVOCATION_STATUS_UNAVAILABLE = ( - 1765328310L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_REVOCATION_STATUS_UNAVAILABLE); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_REVOCATION_STATUS_UNAVAILABLE);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_CLIENT_NAME_MISMATCH))) {
        private enum enumMixinStr_KRB5KDC_ERR_CLIENT_NAME_MISMATCH = `enum KRB5KDC_ERR_CLIENT_NAME_MISMATCH = ( - 1765328309L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_CLIENT_NAME_MISMATCH); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_CLIENT_NAME_MISMATCH);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_KDC_NAME_MISMATCH))) {
        private enum enumMixinStr_KRB5KDC_ERR_KDC_NAME_MISMATCH = `enum KRB5KDC_ERR_KDC_NAME_MISMATCH = ( - 1765328308L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_KDC_NAME_MISMATCH); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_KDC_NAME_MISMATCH);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_INCONSISTENT_KEY_PURPOSE))) {
        private enum enumMixinStr_KRB5KDC_ERR_INCONSISTENT_KEY_PURPOSE = `enum KRB5KDC_ERR_INCONSISTENT_KEY_PURPOSE = ( - 1765328307L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_INCONSISTENT_KEY_PURPOSE); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_INCONSISTENT_KEY_PURPOSE);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_DIGEST_IN_CERT_NOT_ACCEPTED))) {
        private enum enumMixinStr_KRB5KDC_ERR_DIGEST_IN_CERT_NOT_ACCEPTED = `enum KRB5KDC_ERR_DIGEST_IN_CERT_NOT_ACCEPTED = ( - 1765328306L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_DIGEST_IN_CERT_NOT_ACCEPTED); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_DIGEST_IN_CERT_NOT_ACCEPTED);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_PA_CHECKSUM_MUST_BE_INCLUDED))) {
        private enum enumMixinStr_KRB5KDC_ERR_PA_CHECKSUM_MUST_BE_INCLUDED = `enum KRB5KDC_ERR_PA_CHECKSUM_MUST_BE_INCLUDED = ( - 1765328305L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_PA_CHECKSUM_MUST_BE_INCLUDED); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_PA_CHECKSUM_MUST_BE_INCLUDED);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_DIGEST_IN_SIGNED_DATA_NOT_ACCEPTED))) {
        private enum enumMixinStr_KRB5KDC_ERR_DIGEST_IN_SIGNED_DATA_NOT_ACCEPTED = `enum KRB5KDC_ERR_DIGEST_IN_SIGNED_DATA_NOT_ACCEPTED = ( - 1765328304L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_DIGEST_IN_SIGNED_DATA_NOT_ACCEPTED); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_DIGEST_IN_SIGNED_DATA_NOT_ACCEPTED);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_PUBLIC_KEY_ENCRYPTION_NOT_SUPPORTED))) {
        private enum enumMixinStr_KRB5KDC_ERR_PUBLIC_KEY_ENCRYPTION_NOT_SUPPORTED = `enum KRB5KDC_ERR_PUBLIC_KEY_ENCRYPTION_NOT_SUPPORTED = ( - 1765328303L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_PUBLIC_KEY_ENCRYPTION_NOT_SUPPORTED); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_PUBLIC_KEY_ENCRYPTION_NOT_SUPPORTED);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_82))) {
        private enum enumMixinStr_KRB5PLACEHOLD_82 = `enum KRB5PLACEHOLD_82 = ( - 1765328302L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_82); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_82);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_83))) {
        private enum enumMixinStr_KRB5PLACEHOLD_83 = `enum KRB5PLACEHOLD_83 = ( - 1765328301L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_83); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_83);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_84))) {
        private enum enumMixinStr_KRB5PLACEHOLD_84 = `enum KRB5PLACEHOLD_84 = ( - 1765328300L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_84); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_84);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_IAKERB_KDC_NOT_FOUND))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_IAKERB_KDC_NOT_FOUND = `enum KRB5KRB_AP_ERR_IAKERB_KDC_NOT_FOUND = ( - 1765328299L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_IAKERB_KDC_NOT_FOUND); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_IAKERB_KDC_NOT_FOUND);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_IAKERB_KDC_NO_RESPONSE))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_IAKERB_KDC_NO_RESPONSE = `enum KRB5KRB_AP_ERR_IAKERB_KDC_NO_RESPONSE = ( - 1765328298L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_IAKERB_KDC_NO_RESPONSE); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_IAKERB_KDC_NO_RESPONSE);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_87))) {
        private enum enumMixinStr_KRB5PLACEHOLD_87 = `enum KRB5PLACEHOLD_87 = ( - 1765328297L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_87); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_87);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_88))) {
        private enum enumMixinStr_KRB5PLACEHOLD_88 = `enum KRB5PLACEHOLD_88 = ( - 1765328296L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_88); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_88);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_89))) {
        private enum enumMixinStr_KRB5PLACEHOLD_89 = `enum KRB5PLACEHOLD_89 = ( - 1765328295L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_89); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_89);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_PREAUTH_EXPIRED))) {
        private enum enumMixinStr_KRB5KDC_ERR_PREAUTH_EXPIRED = `enum KRB5KDC_ERR_PREAUTH_EXPIRED = ( - 1765328294L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_PREAUTH_EXPIRED); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_PREAUTH_EXPIRED);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_MORE_PREAUTH_DATA_REQUIRED))) {
        private enum enumMixinStr_KRB5KDC_ERR_MORE_PREAUTH_DATA_REQUIRED = `enum KRB5KDC_ERR_MORE_PREAUTH_DATA_REQUIRED = ( - 1765328293L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_MORE_PREAUTH_DATA_REQUIRED); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_MORE_PREAUTH_DATA_REQUIRED);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_92))) {
        private enum enumMixinStr_KRB5PLACEHOLD_92 = `enum KRB5PLACEHOLD_92 = ( - 1765328292L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_92); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_92);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_UNKNOWN_CRITICAL_FAST_OPTION))) {
        private enum enumMixinStr_KRB5KDC_ERR_UNKNOWN_CRITICAL_FAST_OPTION = `enum KRB5KDC_ERR_UNKNOWN_CRITICAL_FAST_OPTION = ( - 1765328291L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_UNKNOWN_CRITICAL_FAST_OPTION); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_UNKNOWN_CRITICAL_FAST_OPTION);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_94))) {
        private enum enumMixinStr_KRB5PLACEHOLD_94 = `enum KRB5PLACEHOLD_94 = ( - 1765328290L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_94); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_94);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_95))) {
        private enum enumMixinStr_KRB5PLACEHOLD_95 = `enum KRB5PLACEHOLD_95 = ( - 1765328289L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_95); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_95);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_96))) {
        private enum enumMixinStr_KRB5PLACEHOLD_96 = `enum KRB5PLACEHOLD_96 = ( - 1765328288L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_96); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_96);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_97))) {
        private enum enumMixinStr_KRB5PLACEHOLD_97 = `enum KRB5PLACEHOLD_97 = ( - 1765328287L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_97); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_97);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_98))) {
        private enum enumMixinStr_KRB5PLACEHOLD_98 = `enum KRB5PLACEHOLD_98 = ( - 1765328286L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_98); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_98);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_99))) {
        private enum enumMixinStr_KRB5PLACEHOLD_99 = `enum KRB5PLACEHOLD_99 = ( - 1765328285L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_99); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_99);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_NO_ACCEPTABLE_KDF))) {
        private enum enumMixinStr_KRB5KDC_ERR_NO_ACCEPTABLE_KDF = `enum KRB5KDC_ERR_NO_ACCEPTABLE_KDF = ( - 1765328284L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_NO_ACCEPTABLE_KDF); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_NO_ACCEPTABLE_KDF);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_101))) {
        private enum enumMixinStr_KRB5PLACEHOLD_101 = `enum KRB5PLACEHOLD_101 = ( - 1765328283L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_101); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_101);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_102))) {
        private enum enumMixinStr_KRB5PLACEHOLD_102 = `enum KRB5PLACEHOLD_102 = ( - 1765328282L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_102); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_102);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_103))) {
        private enum enumMixinStr_KRB5PLACEHOLD_103 = `enum KRB5PLACEHOLD_103 = ( - 1765328281L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_103); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_103);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_104))) {
        private enum enumMixinStr_KRB5PLACEHOLD_104 = `enum KRB5PLACEHOLD_104 = ( - 1765328280L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_104); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_104);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_105))) {
        private enum enumMixinStr_KRB5PLACEHOLD_105 = `enum KRB5PLACEHOLD_105 = ( - 1765328279L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_105); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_105);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_106))) {
        private enum enumMixinStr_KRB5PLACEHOLD_106 = `enum KRB5PLACEHOLD_106 = ( - 1765328278L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_106); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_106);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_107))) {
        private enum enumMixinStr_KRB5PLACEHOLD_107 = `enum KRB5PLACEHOLD_107 = ( - 1765328277L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_107); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_107);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_108))) {
        private enum enumMixinStr_KRB5PLACEHOLD_108 = `enum KRB5PLACEHOLD_108 = ( - 1765328276L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_108); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_108);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_109))) {
        private enum enumMixinStr_KRB5PLACEHOLD_109 = `enum KRB5PLACEHOLD_109 = ( - 1765328275L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_109); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_109);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_110))) {
        private enum enumMixinStr_KRB5PLACEHOLD_110 = `enum KRB5PLACEHOLD_110 = ( - 1765328274L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_110); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_110);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_111))) {
        private enum enumMixinStr_KRB5PLACEHOLD_111 = `enum KRB5PLACEHOLD_111 = ( - 1765328273L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_111); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_111);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_112))) {
        private enum enumMixinStr_KRB5PLACEHOLD_112 = `enum KRB5PLACEHOLD_112 = ( - 1765328272L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_112); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_112);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_113))) {
        private enum enumMixinStr_KRB5PLACEHOLD_113 = `enum KRB5PLACEHOLD_113 = ( - 1765328271L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_113); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_113);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_114))) {
        private enum enumMixinStr_KRB5PLACEHOLD_114 = `enum KRB5PLACEHOLD_114 = ( - 1765328270L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_114); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_114);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_115))) {
        private enum enumMixinStr_KRB5PLACEHOLD_115 = `enum KRB5PLACEHOLD_115 = ( - 1765328269L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_115); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_115);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_116))) {
        private enum enumMixinStr_KRB5PLACEHOLD_116 = `enum KRB5PLACEHOLD_116 = ( - 1765328268L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_116); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_116);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_117))) {
        private enum enumMixinStr_KRB5PLACEHOLD_117 = `enum KRB5PLACEHOLD_117 = ( - 1765328267L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_117); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_117);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_118))) {
        private enum enumMixinStr_KRB5PLACEHOLD_118 = `enum KRB5PLACEHOLD_118 = ( - 1765328266L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_118); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_118);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_119))) {
        private enum enumMixinStr_KRB5PLACEHOLD_119 = `enum KRB5PLACEHOLD_119 = ( - 1765328265L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_119); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_119);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_120))) {
        private enum enumMixinStr_KRB5PLACEHOLD_120 = `enum KRB5PLACEHOLD_120 = ( - 1765328264L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_120); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_120);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_121))) {
        private enum enumMixinStr_KRB5PLACEHOLD_121 = `enum KRB5PLACEHOLD_121 = ( - 1765328263L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_121); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_121);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_122))) {
        private enum enumMixinStr_KRB5PLACEHOLD_122 = `enum KRB5PLACEHOLD_122 = ( - 1765328262L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_122); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_122);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_123))) {
        private enum enumMixinStr_KRB5PLACEHOLD_123 = `enum KRB5PLACEHOLD_123 = ( - 1765328261L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_123); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_123);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_124))) {
        private enum enumMixinStr_KRB5PLACEHOLD_124 = `enum KRB5PLACEHOLD_124 = ( - 1765328260L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_124); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_124);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_125))) {
        private enum enumMixinStr_KRB5PLACEHOLD_125 = `enum KRB5PLACEHOLD_125 = ( - 1765328259L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_125); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_125);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_126))) {
        private enum enumMixinStr_KRB5PLACEHOLD_126 = `enum KRB5PLACEHOLD_126 = ( - 1765328258L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_126); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_126);
        }
    }




    static if(!is(typeof(KRB5PLACEHOLD_127))) {
        private enum enumMixinStr_KRB5PLACEHOLD_127 = `enum KRB5PLACEHOLD_127 = ( - 1765328257L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5PLACEHOLD_127); }))) {
            mixin(enumMixinStr_KRB5PLACEHOLD_127);
        }
    }




    static if(!is(typeof(KRB5_ERR_RCSID))) {
        private enum enumMixinStr_KRB5_ERR_RCSID = `enum KRB5_ERR_RCSID = ( - 1765328256L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_ERR_RCSID); }))) {
            mixin(enumMixinStr_KRB5_ERR_RCSID);
        }
    }




    static if(!is(typeof(KRB5_LIBOS_BADLOCKFLAG))) {
        private enum enumMixinStr_KRB5_LIBOS_BADLOCKFLAG = `enum KRB5_LIBOS_BADLOCKFLAG = ( - 1765328255L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LIBOS_BADLOCKFLAG); }))) {
            mixin(enumMixinStr_KRB5_LIBOS_BADLOCKFLAG);
        }
    }




    static if(!is(typeof(KRB5_LIBOS_CANTREADPWD))) {
        private enum enumMixinStr_KRB5_LIBOS_CANTREADPWD = `enum KRB5_LIBOS_CANTREADPWD = ( - 1765328254L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LIBOS_CANTREADPWD); }))) {
            mixin(enumMixinStr_KRB5_LIBOS_CANTREADPWD);
        }
    }




    static if(!is(typeof(KRB5_LIBOS_BADPWDMATCH))) {
        private enum enumMixinStr_KRB5_LIBOS_BADPWDMATCH = `enum KRB5_LIBOS_BADPWDMATCH = ( - 1765328253L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LIBOS_BADPWDMATCH); }))) {
            mixin(enumMixinStr_KRB5_LIBOS_BADPWDMATCH);
        }
    }




    static if(!is(typeof(KRB5_LIBOS_PWDINTR))) {
        private enum enumMixinStr_KRB5_LIBOS_PWDINTR = `enum KRB5_LIBOS_PWDINTR = ( - 1765328252L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LIBOS_PWDINTR); }))) {
            mixin(enumMixinStr_KRB5_LIBOS_PWDINTR);
        }
    }




    static if(!is(typeof(KRB5_PARSE_ILLCHAR))) {
        private enum enumMixinStr_KRB5_PARSE_ILLCHAR = `enum KRB5_PARSE_ILLCHAR = ( - 1765328251L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PARSE_ILLCHAR); }))) {
            mixin(enumMixinStr_KRB5_PARSE_ILLCHAR);
        }
    }




    static if(!is(typeof(KRB5_PARSE_MALFORMED))) {
        private enum enumMixinStr_KRB5_PARSE_MALFORMED = `enum KRB5_PARSE_MALFORMED = ( - 1765328250L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PARSE_MALFORMED); }))) {
            mixin(enumMixinStr_KRB5_PARSE_MALFORMED);
        }
    }




    static if(!is(typeof(KRB5_CONFIG_CANTOPEN))) {
        private enum enumMixinStr_KRB5_CONFIG_CANTOPEN = `enum KRB5_CONFIG_CANTOPEN = ( - 1765328249L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CONFIG_CANTOPEN); }))) {
            mixin(enumMixinStr_KRB5_CONFIG_CANTOPEN);
        }
    }




    static if(!is(typeof(KRB5_CONFIG_BADFORMAT))) {
        private enum enumMixinStr_KRB5_CONFIG_BADFORMAT = `enum KRB5_CONFIG_BADFORMAT = ( - 1765328248L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CONFIG_BADFORMAT); }))) {
            mixin(enumMixinStr_KRB5_CONFIG_BADFORMAT);
        }
    }




    static if(!is(typeof(KRB5_CONFIG_NOTENUFSPACE))) {
        private enum enumMixinStr_KRB5_CONFIG_NOTENUFSPACE = `enum KRB5_CONFIG_NOTENUFSPACE = ( - 1765328247L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CONFIG_NOTENUFSPACE); }))) {
            mixin(enumMixinStr_KRB5_CONFIG_NOTENUFSPACE);
        }
    }




    static if(!is(typeof(KRB5_BADMSGTYPE))) {
        private enum enumMixinStr_KRB5_BADMSGTYPE = `enum KRB5_BADMSGTYPE = ( - 1765328246L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_BADMSGTYPE); }))) {
            mixin(enumMixinStr_KRB5_BADMSGTYPE);
        }
    }




    static if(!is(typeof(KRB5_CC_BADNAME))) {
        private enum enumMixinStr_KRB5_CC_BADNAME = `enum KRB5_CC_BADNAME = ( - 1765328245L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CC_BADNAME); }))) {
            mixin(enumMixinStr_KRB5_CC_BADNAME);
        }
    }




    static if(!is(typeof(KRB5_CC_UNKNOWN_TYPE))) {
        private enum enumMixinStr_KRB5_CC_UNKNOWN_TYPE = `enum KRB5_CC_UNKNOWN_TYPE = ( - 1765328244L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CC_UNKNOWN_TYPE); }))) {
            mixin(enumMixinStr_KRB5_CC_UNKNOWN_TYPE);
        }
    }




    static if(!is(typeof(KRB5_CC_NOTFOUND))) {
        private enum enumMixinStr_KRB5_CC_NOTFOUND = `enum KRB5_CC_NOTFOUND = ( - 1765328243L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CC_NOTFOUND); }))) {
            mixin(enumMixinStr_KRB5_CC_NOTFOUND);
        }
    }




    static if(!is(typeof(KRB5_CC_END))) {
        private enum enumMixinStr_KRB5_CC_END = `enum KRB5_CC_END = ( - 1765328242L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CC_END); }))) {
            mixin(enumMixinStr_KRB5_CC_END);
        }
    }




    static if(!is(typeof(KRB5_NO_TKT_SUPPLIED))) {
        private enum enumMixinStr_KRB5_NO_TKT_SUPPLIED = `enum KRB5_NO_TKT_SUPPLIED = ( - 1765328241L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NO_TKT_SUPPLIED); }))) {
            mixin(enumMixinStr_KRB5_NO_TKT_SUPPLIED);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_WRONG_PRINC))) {
        private enum enumMixinStr_KRB5KRB_AP_WRONG_PRINC = `enum KRB5KRB_AP_WRONG_PRINC = ( - 1765328240L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_WRONG_PRINC); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_WRONG_PRINC);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_TKT_INVALID))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_TKT_INVALID = `enum KRB5KRB_AP_ERR_TKT_INVALID = ( - 1765328239L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_TKT_INVALID); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_TKT_INVALID);
        }
    }




    static if(!is(typeof(KRB5_PRINC_NOMATCH))) {
        private enum enumMixinStr_KRB5_PRINC_NOMATCH = `enum KRB5_PRINC_NOMATCH = ( - 1765328238L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PRINC_NOMATCH); }))) {
            mixin(enumMixinStr_KRB5_PRINC_NOMATCH);
        }
    }




    static if(!is(typeof(KRB5_KDCREP_MODIFIED))) {
        private enum enumMixinStr_KRB5_KDCREP_MODIFIED = `enum KRB5_KDCREP_MODIFIED = ( - 1765328237L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDCREP_MODIFIED); }))) {
            mixin(enumMixinStr_KRB5_KDCREP_MODIFIED);
        }
    }




    static if(!is(typeof(KRB5_KDCREP_SKEW))) {
        private enum enumMixinStr_KRB5_KDCREP_SKEW = `enum KRB5_KDCREP_SKEW = ( - 1765328236L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDCREP_SKEW); }))) {
            mixin(enumMixinStr_KRB5_KDCREP_SKEW);
        }
    }




    static if(!is(typeof(KRB5_IN_TKT_REALM_MISMATCH))) {
        private enum enumMixinStr_KRB5_IN_TKT_REALM_MISMATCH = `enum KRB5_IN_TKT_REALM_MISMATCH = ( - 1765328235L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_IN_TKT_REALM_MISMATCH); }))) {
            mixin(enumMixinStr_KRB5_IN_TKT_REALM_MISMATCH);
        }
    }




    static if(!is(typeof(KRB5_PROG_ETYPE_NOSUPP))) {
        private enum enumMixinStr_KRB5_PROG_ETYPE_NOSUPP = `enum KRB5_PROG_ETYPE_NOSUPP = ( - 1765328234L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PROG_ETYPE_NOSUPP); }))) {
            mixin(enumMixinStr_KRB5_PROG_ETYPE_NOSUPP);
        }
    }




    static if(!is(typeof(KRB5_PROG_KEYTYPE_NOSUPP))) {
        private enum enumMixinStr_KRB5_PROG_KEYTYPE_NOSUPP = `enum KRB5_PROG_KEYTYPE_NOSUPP = ( - 1765328233L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PROG_KEYTYPE_NOSUPP); }))) {
            mixin(enumMixinStr_KRB5_PROG_KEYTYPE_NOSUPP);
        }
    }




    static if(!is(typeof(KRB5_WRONG_ETYPE))) {
        private enum enumMixinStr_KRB5_WRONG_ETYPE = `enum KRB5_WRONG_ETYPE = ( - 1765328232L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_WRONG_ETYPE); }))) {
            mixin(enumMixinStr_KRB5_WRONG_ETYPE);
        }
    }




    static if(!is(typeof(KRB5_PROG_SUMTYPE_NOSUPP))) {
        private enum enumMixinStr_KRB5_PROG_SUMTYPE_NOSUPP = `enum KRB5_PROG_SUMTYPE_NOSUPP = ( - 1765328231L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PROG_SUMTYPE_NOSUPP); }))) {
            mixin(enumMixinStr_KRB5_PROG_SUMTYPE_NOSUPP);
        }
    }




    static if(!is(typeof(KRB5_REALM_UNKNOWN))) {
        private enum enumMixinStr_KRB5_REALM_UNKNOWN = `enum KRB5_REALM_UNKNOWN = ( - 1765328230L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_REALM_UNKNOWN); }))) {
            mixin(enumMixinStr_KRB5_REALM_UNKNOWN);
        }
    }




    static if(!is(typeof(KRB5_SERVICE_UNKNOWN))) {
        private enum enumMixinStr_KRB5_SERVICE_UNKNOWN = `enum KRB5_SERVICE_UNKNOWN = ( - 1765328229L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_SERVICE_UNKNOWN); }))) {
            mixin(enumMixinStr_KRB5_SERVICE_UNKNOWN);
        }
    }




    static if(!is(typeof(KRB5_KDC_UNREACH))) {
        private enum enumMixinStr_KRB5_KDC_UNREACH = `enum KRB5_KDC_UNREACH = ( - 1765328228L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDC_UNREACH); }))) {
            mixin(enumMixinStr_KRB5_KDC_UNREACH);
        }
    }




    static if(!is(typeof(KRB5_NO_LOCALNAME))) {
        private enum enumMixinStr_KRB5_NO_LOCALNAME = `enum KRB5_NO_LOCALNAME = ( - 1765328227L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NO_LOCALNAME); }))) {
            mixin(enumMixinStr_KRB5_NO_LOCALNAME);
        }
    }




    static if(!is(typeof(KRB5_MUTUAL_FAILED))) {
        private enum enumMixinStr_KRB5_MUTUAL_FAILED = `enum KRB5_MUTUAL_FAILED = ( - 1765328226L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_MUTUAL_FAILED); }))) {
            mixin(enumMixinStr_KRB5_MUTUAL_FAILED);
        }
    }




    static if(!is(typeof(KRB5_RC_TYPE_EXISTS))) {
        private enum enumMixinStr_KRB5_RC_TYPE_EXISTS = `enum KRB5_RC_TYPE_EXISTS = ( - 1765328225L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RC_TYPE_EXISTS); }))) {
            mixin(enumMixinStr_KRB5_RC_TYPE_EXISTS);
        }
    }




    static if(!is(typeof(KRB5_RC_MALLOC))) {
        private enum enumMixinStr_KRB5_RC_MALLOC = `enum KRB5_RC_MALLOC = ( - 1765328224L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RC_MALLOC); }))) {
            mixin(enumMixinStr_KRB5_RC_MALLOC);
        }
    }




    static if(!is(typeof(KRB5_RC_TYPE_NOTFOUND))) {
        private enum enumMixinStr_KRB5_RC_TYPE_NOTFOUND = `enum KRB5_RC_TYPE_NOTFOUND = ( - 1765328223L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RC_TYPE_NOTFOUND); }))) {
            mixin(enumMixinStr_KRB5_RC_TYPE_NOTFOUND);
        }
    }




    static if(!is(typeof(KRB5_RC_UNKNOWN))) {
        private enum enumMixinStr_KRB5_RC_UNKNOWN = `enum KRB5_RC_UNKNOWN = ( - 1765328222L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RC_UNKNOWN); }))) {
            mixin(enumMixinStr_KRB5_RC_UNKNOWN);
        }
    }




    static if(!is(typeof(KRB5_RC_REPLAY))) {
        private enum enumMixinStr_KRB5_RC_REPLAY = `enum KRB5_RC_REPLAY = ( - 1765328221L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RC_REPLAY); }))) {
            mixin(enumMixinStr_KRB5_RC_REPLAY);
        }
    }




    static if(!is(typeof(KRB5_RC_IO))) {
        private enum enumMixinStr_KRB5_RC_IO = `enum KRB5_RC_IO = ( - 1765328220L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RC_IO); }))) {
            mixin(enumMixinStr_KRB5_RC_IO);
        }
    }




    static if(!is(typeof(KRB5_RC_NOIO))) {
        private enum enumMixinStr_KRB5_RC_NOIO = `enum KRB5_RC_NOIO = ( - 1765328219L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RC_NOIO); }))) {
            mixin(enumMixinStr_KRB5_RC_NOIO);
        }
    }




    static if(!is(typeof(KRB5_RC_PARSE))) {
        private enum enumMixinStr_KRB5_RC_PARSE = `enum KRB5_RC_PARSE = ( - 1765328218L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RC_PARSE); }))) {
            mixin(enumMixinStr_KRB5_RC_PARSE);
        }
    }




    static if(!is(typeof(KRB5_RC_IO_EOF))) {
        private enum enumMixinStr_KRB5_RC_IO_EOF = `enum KRB5_RC_IO_EOF = ( - 1765328217L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RC_IO_EOF); }))) {
            mixin(enumMixinStr_KRB5_RC_IO_EOF);
        }
    }




    static if(!is(typeof(KRB5_RC_IO_MALLOC))) {
        private enum enumMixinStr_KRB5_RC_IO_MALLOC = `enum KRB5_RC_IO_MALLOC = ( - 1765328216L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RC_IO_MALLOC); }))) {
            mixin(enumMixinStr_KRB5_RC_IO_MALLOC);
        }
    }




    static if(!is(typeof(KRB5_RC_IO_PERM))) {
        private enum enumMixinStr_KRB5_RC_IO_PERM = `enum KRB5_RC_IO_PERM = ( - 1765328215L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RC_IO_PERM); }))) {
            mixin(enumMixinStr_KRB5_RC_IO_PERM);
        }
    }




    static if(!is(typeof(KRB5_RC_IO_IO))) {
        private enum enumMixinStr_KRB5_RC_IO_IO = `enum KRB5_RC_IO_IO = ( - 1765328214L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RC_IO_IO); }))) {
            mixin(enumMixinStr_KRB5_RC_IO_IO);
        }
    }




    static if(!is(typeof(KRB5_RC_IO_UNKNOWN))) {
        private enum enumMixinStr_KRB5_RC_IO_UNKNOWN = `enum KRB5_RC_IO_UNKNOWN = ( - 1765328213L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RC_IO_UNKNOWN); }))) {
            mixin(enumMixinStr_KRB5_RC_IO_UNKNOWN);
        }
    }




    static if(!is(typeof(KRB5_RC_IO_SPACE))) {
        private enum enumMixinStr_KRB5_RC_IO_SPACE = `enum KRB5_RC_IO_SPACE = ( - 1765328212L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RC_IO_SPACE); }))) {
            mixin(enumMixinStr_KRB5_RC_IO_SPACE);
        }
    }




    static if(!is(typeof(KRB5_TRANS_CANTOPEN))) {
        private enum enumMixinStr_KRB5_TRANS_CANTOPEN = `enum KRB5_TRANS_CANTOPEN = ( - 1765328211L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TRANS_CANTOPEN); }))) {
            mixin(enumMixinStr_KRB5_TRANS_CANTOPEN);
        }
    }




    static if(!is(typeof(KRB5_TRANS_BADFORMAT))) {
        private enum enumMixinStr_KRB5_TRANS_BADFORMAT = `enum KRB5_TRANS_BADFORMAT = ( - 1765328210L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TRANS_BADFORMAT); }))) {
            mixin(enumMixinStr_KRB5_TRANS_BADFORMAT);
        }
    }




    static if(!is(typeof(KRB5_LNAME_CANTOPEN))) {
        private enum enumMixinStr_KRB5_LNAME_CANTOPEN = `enum KRB5_LNAME_CANTOPEN = ( - 1765328209L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LNAME_CANTOPEN); }))) {
            mixin(enumMixinStr_KRB5_LNAME_CANTOPEN);
        }
    }




    static if(!is(typeof(KRB5_LNAME_NOTRANS))) {
        private enum enumMixinStr_KRB5_LNAME_NOTRANS = `enum KRB5_LNAME_NOTRANS = ( - 1765328208L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LNAME_NOTRANS); }))) {
            mixin(enumMixinStr_KRB5_LNAME_NOTRANS);
        }
    }




    static if(!is(typeof(KRB5_LNAME_BADFORMAT))) {
        private enum enumMixinStr_KRB5_LNAME_BADFORMAT = `enum KRB5_LNAME_BADFORMAT = ( - 1765328207L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LNAME_BADFORMAT); }))) {
            mixin(enumMixinStr_KRB5_LNAME_BADFORMAT);
        }
    }




    static if(!is(typeof(KRB5_CRYPTO_INTERNAL))) {
        private enum enumMixinStr_KRB5_CRYPTO_INTERNAL = `enum KRB5_CRYPTO_INTERNAL = ( - 1765328206L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CRYPTO_INTERNAL); }))) {
            mixin(enumMixinStr_KRB5_CRYPTO_INTERNAL);
        }
    }




    static if(!is(typeof(KRB5_KT_BADNAME))) {
        private enum enumMixinStr_KRB5_KT_BADNAME = `enum KRB5_KT_BADNAME = ( - 1765328205L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KT_BADNAME); }))) {
            mixin(enumMixinStr_KRB5_KT_BADNAME);
        }
    }




    static if(!is(typeof(KRB5_KT_UNKNOWN_TYPE))) {
        private enum enumMixinStr_KRB5_KT_UNKNOWN_TYPE = `enum KRB5_KT_UNKNOWN_TYPE = ( - 1765328204L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KT_UNKNOWN_TYPE); }))) {
            mixin(enumMixinStr_KRB5_KT_UNKNOWN_TYPE);
        }
    }




    static if(!is(typeof(KRB5_KT_NOTFOUND))) {
        private enum enumMixinStr_KRB5_KT_NOTFOUND = `enum KRB5_KT_NOTFOUND = ( - 1765328203L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KT_NOTFOUND); }))) {
            mixin(enumMixinStr_KRB5_KT_NOTFOUND);
        }
    }




    static if(!is(typeof(KRB5_KT_END))) {
        private enum enumMixinStr_KRB5_KT_END = `enum KRB5_KT_END = ( - 1765328202L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KT_END); }))) {
            mixin(enumMixinStr_KRB5_KT_END);
        }
    }




    static if(!is(typeof(KRB5_KT_NOWRITE))) {
        private enum enumMixinStr_KRB5_KT_NOWRITE = `enum KRB5_KT_NOWRITE = ( - 1765328201L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KT_NOWRITE); }))) {
            mixin(enumMixinStr_KRB5_KT_NOWRITE);
        }
    }




    static if(!is(typeof(KRB5_KT_IOERR))) {
        private enum enumMixinStr_KRB5_KT_IOERR = `enum KRB5_KT_IOERR = ( - 1765328200L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KT_IOERR); }))) {
            mixin(enumMixinStr_KRB5_KT_IOERR);
        }
    }




    static if(!is(typeof(KRB5_NO_TKT_IN_RLM))) {
        private enum enumMixinStr_KRB5_NO_TKT_IN_RLM = `enum KRB5_NO_TKT_IN_RLM = ( - 1765328199L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NO_TKT_IN_RLM); }))) {
            mixin(enumMixinStr_KRB5_NO_TKT_IN_RLM);
        }
    }




    static if(!is(typeof(KRB5DES_BAD_KEYPAR))) {
        private enum enumMixinStr_KRB5DES_BAD_KEYPAR = `enum KRB5DES_BAD_KEYPAR = ( - 1765328198L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5DES_BAD_KEYPAR); }))) {
            mixin(enumMixinStr_KRB5DES_BAD_KEYPAR);
        }
    }




    static if(!is(typeof(KRB5DES_WEAK_KEY))) {
        private enum enumMixinStr_KRB5DES_WEAK_KEY = `enum KRB5DES_WEAK_KEY = ( - 1765328197L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5DES_WEAK_KEY); }))) {
            mixin(enumMixinStr_KRB5DES_WEAK_KEY);
        }
    }




    static if(!is(typeof(KRB5_BAD_ENCTYPE))) {
        private enum enumMixinStr_KRB5_BAD_ENCTYPE = `enum KRB5_BAD_ENCTYPE = ( - 1765328196L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_BAD_ENCTYPE); }))) {
            mixin(enumMixinStr_KRB5_BAD_ENCTYPE);
        }
    }




    static if(!is(typeof(KRB5_BAD_KEYSIZE))) {
        private enum enumMixinStr_KRB5_BAD_KEYSIZE = `enum KRB5_BAD_KEYSIZE = ( - 1765328195L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_BAD_KEYSIZE); }))) {
            mixin(enumMixinStr_KRB5_BAD_KEYSIZE);
        }
    }




    static if(!is(typeof(KRB5_BAD_MSIZE))) {
        private enum enumMixinStr_KRB5_BAD_MSIZE = `enum KRB5_BAD_MSIZE = ( - 1765328194L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_BAD_MSIZE); }))) {
            mixin(enumMixinStr_KRB5_BAD_MSIZE);
        }
    }




    static if(!is(typeof(KRB5_CC_TYPE_EXISTS))) {
        private enum enumMixinStr_KRB5_CC_TYPE_EXISTS = `enum KRB5_CC_TYPE_EXISTS = ( - 1765328193L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CC_TYPE_EXISTS); }))) {
            mixin(enumMixinStr_KRB5_CC_TYPE_EXISTS);
        }
    }




    static if(!is(typeof(KRB5_KT_TYPE_EXISTS))) {
        private enum enumMixinStr_KRB5_KT_TYPE_EXISTS = `enum KRB5_KT_TYPE_EXISTS = ( - 1765328192L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KT_TYPE_EXISTS); }))) {
            mixin(enumMixinStr_KRB5_KT_TYPE_EXISTS);
        }
    }




    static if(!is(typeof(KRB5_CC_IO))) {
        private enum enumMixinStr_KRB5_CC_IO = `enum KRB5_CC_IO = ( - 1765328191L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CC_IO); }))) {
            mixin(enumMixinStr_KRB5_CC_IO);
        }
    }




    static if(!is(typeof(KRB5_FCC_PERM))) {
        private enum enumMixinStr_KRB5_FCC_PERM = `enum KRB5_FCC_PERM = ( - 1765328190L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_FCC_PERM); }))) {
            mixin(enumMixinStr_KRB5_FCC_PERM);
        }
    }




    static if(!is(typeof(KRB5_FCC_NOFILE))) {
        private enum enumMixinStr_KRB5_FCC_NOFILE = `enum KRB5_FCC_NOFILE = ( - 1765328189L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_FCC_NOFILE); }))) {
            mixin(enumMixinStr_KRB5_FCC_NOFILE);
        }
    }




    static if(!is(typeof(KRB5_FCC_INTERNAL))) {
        private enum enumMixinStr_KRB5_FCC_INTERNAL = `enum KRB5_FCC_INTERNAL = ( - 1765328188L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_FCC_INTERNAL); }))) {
            mixin(enumMixinStr_KRB5_FCC_INTERNAL);
        }
    }




    static if(!is(typeof(KRB5_CC_WRITE))) {
        private enum enumMixinStr_KRB5_CC_WRITE = `enum KRB5_CC_WRITE = ( - 1765328187L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CC_WRITE); }))) {
            mixin(enumMixinStr_KRB5_CC_WRITE);
        }
    }




    static if(!is(typeof(KRB5_CC_NOMEM))) {
        private enum enumMixinStr_KRB5_CC_NOMEM = `enum KRB5_CC_NOMEM = ( - 1765328186L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CC_NOMEM); }))) {
            mixin(enumMixinStr_KRB5_CC_NOMEM);
        }
    }




    static if(!is(typeof(KRB5_CC_FORMAT))) {
        private enum enumMixinStr_KRB5_CC_FORMAT = `enum KRB5_CC_FORMAT = ( - 1765328185L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CC_FORMAT); }))) {
            mixin(enumMixinStr_KRB5_CC_FORMAT);
        }
    }




    static if(!is(typeof(KRB5_CC_NOT_KTYPE))) {
        private enum enumMixinStr_KRB5_CC_NOT_KTYPE = `enum KRB5_CC_NOT_KTYPE = ( - 1765328184L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CC_NOT_KTYPE); }))) {
            mixin(enumMixinStr_KRB5_CC_NOT_KTYPE);
        }
    }




    static if(!is(typeof(KRB5_INVALID_FLAGS))) {
        private enum enumMixinStr_KRB5_INVALID_FLAGS = `enum KRB5_INVALID_FLAGS = ( - 1765328183L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_INVALID_FLAGS); }))) {
            mixin(enumMixinStr_KRB5_INVALID_FLAGS);
        }
    }




    static if(!is(typeof(KRB5_NO_2ND_TKT))) {
        private enum enumMixinStr_KRB5_NO_2ND_TKT = `enum KRB5_NO_2ND_TKT = ( - 1765328182L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NO_2ND_TKT); }))) {
            mixin(enumMixinStr_KRB5_NO_2ND_TKT);
        }
    }




    static if(!is(typeof(KRB5_NOCREDS_SUPPLIED))) {
        private enum enumMixinStr_KRB5_NOCREDS_SUPPLIED = `enum KRB5_NOCREDS_SUPPLIED = ( - 1765328181L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NOCREDS_SUPPLIED); }))) {
            mixin(enumMixinStr_KRB5_NOCREDS_SUPPLIED);
        }
    }




    static if(!is(typeof(KRB5_SENDAUTH_BADAUTHVERS))) {
        private enum enumMixinStr_KRB5_SENDAUTH_BADAUTHVERS = `enum KRB5_SENDAUTH_BADAUTHVERS = ( - 1765328180L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_SENDAUTH_BADAUTHVERS); }))) {
            mixin(enumMixinStr_KRB5_SENDAUTH_BADAUTHVERS);
        }
    }




    static if(!is(typeof(KRB5_SENDAUTH_BADAPPLVERS))) {
        private enum enumMixinStr_KRB5_SENDAUTH_BADAPPLVERS = `enum KRB5_SENDAUTH_BADAPPLVERS = ( - 1765328179L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_SENDAUTH_BADAPPLVERS); }))) {
            mixin(enumMixinStr_KRB5_SENDAUTH_BADAPPLVERS);
        }
    }




    static if(!is(typeof(KRB5_SENDAUTH_BADRESPONSE))) {
        private enum enumMixinStr_KRB5_SENDAUTH_BADRESPONSE = `enum KRB5_SENDAUTH_BADRESPONSE = ( - 1765328178L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_SENDAUTH_BADRESPONSE); }))) {
            mixin(enumMixinStr_KRB5_SENDAUTH_BADRESPONSE);
        }
    }




    static if(!is(typeof(KRB5_SENDAUTH_REJECTED))) {
        private enum enumMixinStr_KRB5_SENDAUTH_REJECTED = `enum KRB5_SENDAUTH_REJECTED = ( - 1765328177L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_SENDAUTH_REJECTED); }))) {
            mixin(enumMixinStr_KRB5_SENDAUTH_REJECTED);
        }
    }




    static if(!is(typeof(KRB5_PREAUTH_BAD_TYPE))) {
        private enum enumMixinStr_KRB5_PREAUTH_BAD_TYPE = `enum KRB5_PREAUTH_BAD_TYPE = ( - 1765328176L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PREAUTH_BAD_TYPE); }))) {
            mixin(enumMixinStr_KRB5_PREAUTH_BAD_TYPE);
        }
    }




    static if(!is(typeof(KRB5_PREAUTH_NO_KEY))) {
        private enum enumMixinStr_KRB5_PREAUTH_NO_KEY = `enum KRB5_PREAUTH_NO_KEY = ( - 1765328175L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PREAUTH_NO_KEY); }))) {
            mixin(enumMixinStr_KRB5_PREAUTH_NO_KEY);
        }
    }




    static if(!is(typeof(KRB5_PREAUTH_FAILED))) {
        private enum enumMixinStr_KRB5_PREAUTH_FAILED = `enum KRB5_PREAUTH_FAILED = ( - 1765328174L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PREAUTH_FAILED); }))) {
            mixin(enumMixinStr_KRB5_PREAUTH_FAILED);
        }
    }




    static if(!is(typeof(KRB5_RCACHE_BADVNO))) {
        private enum enumMixinStr_KRB5_RCACHE_BADVNO = `enum KRB5_RCACHE_BADVNO = ( - 1765328173L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RCACHE_BADVNO); }))) {
            mixin(enumMixinStr_KRB5_RCACHE_BADVNO);
        }
    }




    static if(!is(typeof(KRB5_CCACHE_BADVNO))) {
        private enum enumMixinStr_KRB5_CCACHE_BADVNO = `enum KRB5_CCACHE_BADVNO = ( - 1765328172L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CCACHE_BADVNO); }))) {
            mixin(enumMixinStr_KRB5_CCACHE_BADVNO);
        }
    }




    static if(!is(typeof(KRB5_KEYTAB_BADVNO))) {
        private enum enumMixinStr_KRB5_KEYTAB_BADVNO = `enum KRB5_KEYTAB_BADVNO = ( - 1765328171L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYTAB_BADVNO); }))) {
            mixin(enumMixinStr_KRB5_KEYTAB_BADVNO);
        }
    }




    static if(!is(typeof(KRB5_PROG_ATYPE_NOSUPP))) {
        private enum enumMixinStr_KRB5_PROG_ATYPE_NOSUPP = `enum KRB5_PROG_ATYPE_NOSUPP = ( - 1765328170L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PROG_ATYPE_NOSUPP); }))) {
            mixin(enumMixinStr_KRB5_PROG_ATYPE_NOSUPP);
        }
    }




    static if(!is(typeof(KRB5_RC_REQUIRED))) {
        private enum enumMixinStr_KRB5_RC_REQUIRED = `enum KRB5_RC_REQUIRED = ( - 1765328169L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RC_REQUIRED); }))) {
            mixin(enumMixinStr_KRB5_RC_REQUIRED);
        }
    }




    static if(!is(typeof(KRB5_ERR_BAD_HOSTNAME))) {
        private enum enumMixinStr_KRB5_ERR_BAD_HOSTNAME = `enum KRB5_ERR_BAD_HOSTNAME = ( - 1765328168L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_ERR_BAD_HOSTNAME); }))) {
            mixin(enumMixinStr_KRB5_ERR_BAD_HOSTNAME);
        }
    }




    static if(!is(typeof(KRB5_ERR_HOST_REALM_UNKNOWN))) {
        private enum enumMixinStr_KRB5_ERR_HOST_REALM_UNKNOWN = `enum KRB5_ERR_HOST_REALM_UNKNOWN = ( - 1765328167L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_ERR_HOST_REALM_UNKNOWN); }))) {
            mixin(enumMixinStr_KRB5_ERR_HOST_REALM_UNKNOWN);
        }
    }




    static if(!is(typeof(KRB5_SNAME_UNSUPP_NAMETYPE))) {
        private enum enumMixinStr_KRB5_SNAME_UNSUPP_NAMETYPE = `enum KRB5_SNAME_UNSUPP_NAMETYPE = ( - 1765328166L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_SNAME_UNSUPP_NAMETYPE); }))) {
            mixin(enumMixinStr_KRB5_SNAME_UNSUPP_NAMETYPE);
        }
    }




    static if(!is(typeof(KRB5KRB_AP_ERR_V4_REPLY))) {
        private enum enumMixinStr_KRB5KRB_AP_ERR_V4_REPLY = `enum KRB5KRB_AP_ERR_V4_REPLY = ( - 1765328165L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KRB_AP_ERR_V4_REPLY); }))) {
            mixin(enumMixinStr_KRB5KRB_AP_ERR_V4_REPLY);
        }
    }




    static if(!is(typeof(KRB5_REALM_CANT_RESOLVE))) {
        private enum enumMixinStr_KRB5_REALM_CANT_RESOLVE = `enum KRB5_REALM_CANT_RESOLVE = ( - 1765328164L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_REALM_CANT_RESOLVE); }))) {
            mixin(enumMixinStr_KRB5_REALM_CANT_RESOLVE);
        }
    }




    static if(!is(typeof(KRB5_TKT_NOT_FORWARDABLE))) {
        private enum enumMixinStr_KRB5_TKT_NOT_FORWARDABLE = `enum KRB5_TKT_NOT_FORWARDABLE = ( - 1765328163L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TKT_NOT_FORWARDABLE); }))) {
            mixin(enumMixinStr_KRB5_TKT_NOT_FORWARDABLE);
        }
    }




    static if(!is(typeof(KRB5_FWD_BAD_PRINCIPAL))) {
        private enum enumMixinStr_KRB5_FWD_BAD_PRINCIPAL = `enum KRB5_FWD_BAD_PRINCIPAL = ( - 1765328162L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_FWD_BAD_PRINCIPAL); }))) {
            mixin(enumMixinStr_KRB5_FWD_BAD_PRINCIPAL);
        }
    }




    static if(!is(typeof(KRB5_GET_IN_TKT_LOOP))) {
        private enum enumMixinStr_KRB5_GET_IN_TKT_LOOP = `enum KRB5_GET_IN_TKT_LOOP = ( - 1765328161L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_IN_TKT_LOOP); }))) {
            mixin(enumMixinStr_KRB5_GET_IN_TKT_LOOP);
        }
    }




    static if(!is(typeof(KRB5_CONFIG_NODEFREALM))) {
        private enum enumMixinStr_KRB5_CONFIG_NODEFREALM = `enum KRB5_CONFIG_NODEFREALM = ( - 1765328160L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CONFIG_NODEFREALM); }))) {
            mixin(enumMixinStr_KRB5_CONFIG_NODEFREALM);
        }
    }




    static if(!is(typeof(KRB5_SAM_UNSUPPORTED))) {
        private enum enumMixinStr_KRB5_SAM_UNSUPPORTED = `enum KRB5_SAM_UNSUPPORTED = ( - 1765328159L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_SAM_UNSUPPORTED); }))) {
            mixin(enumMixinStr_KRB5_SAM_UNSUPPORTED);
        }
    }




    static if(!is(typeof(KRB5_SAM_INVALID_ETYPE))) {
        private enum enumMixinStr_KRB5_SAM_INVALID_ETYPE = `enum KRB5_SAM_INVALID_ETYPE = ( - 1765328158L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_SAM_INVALID_ETYPE); }))) {
            mixin(enumMixinStr_KRB5_SAM_INVALID_ETYPE);
        }
    }




    static if(!is(typeof(KRB5_SAM_NO_CHECKSUM))) {
        private enum enumMixinStr_KRB5_SAM_NO_CHECKSUM = `enum KRB5_SAM_NO_CHECKSUM = ( - 1765328157L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_SAM_NO_CHECKSUM); }))) {
            mixin(enumMixinStr_KRB5_SAM_NO_CHECKSUM);
        }
    }




    static if(!is(typeof(KRB5_SAM_BAD_CHECKSUM))) {
        private enum enumMixinStr_KRB5_SAM_BAD_CHECKSUM = `enum KRB5_SAM_BAD_CHECKSUM = ( - 1765328156L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_SAM_BAD_CHECKSUM); }))) {
            mixin(enumMixinStr_KRB5_SAM_BAD_CHECKSUM);
        }
    }




    static if(!is(typeof(KRB5_KT_NAME_TOOLONG))) {
        private enum enumMixinStr_KRB5_KT_NAME_TOOLONG = `enum KRB5_KT_NAME_TOOLONG = ( - 1765328155L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KT_NAME_TOOLONG); }))) {
            mixin(enumMixinStr_KRB5_KT_NAME_TOOLONG);
        }
    }




    static if(!is(typeof(KRB5_KT_KVNONOTFOUND))) {
        private enum enumMixinStr_KRB5_KT_KVNONOTFOUND = `enum KRB5_KT_KVNONOTFOUND = ( - 1765328154L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KT_KVNONOTFOUND); }))) {
            mixin(enumMixinStr_KRB5_KT_KVNONOTFOUND);
        }
    }




    static if(!is(typeof(KRB5_APPL_EXPIRED))) {
        private enum enumMixinStr_KRB5_APPL_EXPIRED = `enum KRB5_APPL_EXPIRED = ( - 1765328153L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_APPL_EXPIRED); }))) {
            mixin(enumMixinStr_KRB5_APPL_EXPIRED);
        }
    }




    static if(!is(typeof(KRB5_LIB_EXPIRED))) {
        private enum enumMixinStr_KRB5_LIB_EXPIRED = `enum KRB5_LIB_EXPIRED = ( - 1765328152L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LIB_EXPIRED); }))) {
            mixin(enumMixinStr_KRB5_LIB_EXPIRED);
        }
    }




    static if(!is(typeof(KRB5_CHPW_PWDNULL))) {
        private enum enumMixinStr_KRB5_CHPW_PWDNULL = `enum KRB5_CHPW_PWDNULL = ( - 1765328151L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CHPW_PWDNULL); }))) {
            mixin(enumMixinStr_KRB5_CHPW_PWDNULL);
        }
    }




    static if(!is(typeof(KRB5_CHPW_FAIL))) {
        private enum enumMixinStr_KRB5_CHPW_FAIL = `enum KRB5_CHPW_FAIL = ( - 1765328150L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CHPW_FAIL); }))) {
            mixin(enumMixinStr_KRB5_CHPW_FAIL);
        }
    }




    static if(!is(typeof(KRB5_KT_FORMAT))) {
        private enum enumMixinStr_KRB5_KT_FORMAT = `enum KRB5_KT_FORMAT = ( - 1765328149L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KT_FORMAT); }))) {
            mixin(enumMixinStr_KRB5_KT_FORMAT);
        }
    }




    static if(!is(typeof(KRB5_NOPERM_ETYPE))) {
        private enum enumMixinStr_KRB5_NOPERM_ETYPE = `enum KRB5_NOPERM_ETYPE = ( - 1765328148L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NOPERM_ETYPE); }))) {
            mixin(enumMixinStr_KRB5_NOPERM_ETYPE);
        }
    }




    static if(!is(typeof(KRB5_CONFIG_ETYPE_NOSUPP))) {
        private enum enumMixinStr_KRB5_CONFIG_ETYPE_NOSUPP = `enum KRB5_CONFIG_ETYPE_NOSUPP = ( - 1765328147L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CONFIG_ETYPE_NOSUPP); }))) {
            mixin(enumMixinStr_KRB5_CONFIG_ETYPE_NOSUPP);
        }
    }




    static if(!is(typeof(KRB5_OBSOLETE_FN))) {
        private enum enumMixinStr_KRB5_OBSOLETE_FN = `enum KRB5_OBSOLETE_FN = ( - 1765328146L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_OBSOLETE_FN); }))) {
            mixin(enumMixinStr_KRB5_OBSOLETE_FN);
        }
    }




    static if(!is(typeof(KRB5_EAI_FAIL))) {
        private enum enumMixinStr_KRB5_EAI_FAIL = `enum KRB5_EAI_FAIL = ( - 1765328145L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_EAI_FAIL); }))) {
            mixin(enumMixinStr_KRB5_EAI_FAIL);
        }
    }




    static if(!is(typeof(KRB5_EAI_NODATA))) {
        private enum enumMixinStr_KRB5_EAI_NODATA = `enum KRB5_EAI_NODATA = ( - 1765328144L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_EAI_NODATA); }))) {
            mixin(enumMixinStr_KRB5_EAI_NODATA);
        }
    }




    static if(!is(typeof(KRB5_EAI_NONAME))) {
        private enum enumMixinStr_KRB5_EAI_NONAME = `enum KRB5_EAI_NONAME = ( - 1765328143L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_EAI_NONAME); }))) {
            mixin(enumMixinStr_KRB5_EAI_NONAME);
        }
    }




    static if(!is(typeof(KRB5_EAI_SERVICE))) {
        private enum enumMixinStr_KRB5_EAI_SERVICE = `enum KRB5_EAI_SERVICE = ( - 1765328142L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_EAI_SERVICE); }))) {
            mixin(enumMixinStr_KRB5_EAI_SERVICE);
        }
    }




    static if(!is(typeof(KRB5_ERR_NUMERIC_REALM))) {
        private enum enumMixinStr_KRB5_ERR_NUMERIC_REALM = `enum KRB5_ERR_NUMERIC_REALM = ( - 1765328141L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_ERR_NUMERIC_REALM); }))) {
            mixin(enumMixinStr_KRB5_ERR_NUMERIC_REALM);
        }
    }




    static if(!is(typeof(KRB5_ERR_BAD_S2K_PARAMS))) {
        private enum enumMixinStr_KRB5_ERR_BAD_S2K_PARAMS = `enum KRB5_ERR_BAD_S2K_PARAMS = ( - 1765328140L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_ERR_BAD_S2K_PARAMS); }))) {
            mixin(enumMixinStr_KRB5_ERR_BAD_S2K_PARAMS);
        }
    }




    static if(!is(typeof(KRB5_ERR_NO_SERVICE))) {
        private enum enumMixinStr_KRB5_ERR_NO_SERVICE = `enum KRB5_ERR_NO_SERVICE = ( - 1765328139L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_ERR_NO_SERVICE); }))) {
            mixin(enumMixinStr_KRB5_ERR_NO_SERVICE);
        }
    }




    static if(!is(typeof(KRB5_CC_READONLY))) {
        private enum enumMixinStr_KRB5_CC_READONLY = `enum KRB5_CC_READONLY = ( - 1765328138L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CC_READONLY); }))) {
            mixin(enumMixinStr_KRB5_CC_READONLY);
        }
    }




    static if(!is(typeof(KRB5_CC_NOSUPP))) {
        private enum enumMixinStr_KRB5_CC_NOSUPP = `enum KRB5_CC_NOSUPP = ( - 1765328137L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_CC_NOSUPP); }))) {
            mixin(enumMixinStr_KRB5_CC_NOSUPP);
        }
    }




    static if(!is(typeof(KRB5_DELTAT_BADFORMAT))) {
        private enum enumMixinStr_KRB5_DELTAT_BADFORMAT = `enum KRB5_DELTAT_BADFORMAT = ( - 1765328136L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_DELTAT_BADFORMAT); }))) {
            mixin(enumMixinStr_KRB5_DELTAT_BADFORMAT);
        }
    }




    static if(!is(typeof(KRB5_PLUGIN_NO_HANDLE))) {
        private enum enumMixinStr_KRB5_PLUGIN_NO_HANDLE = `enum KRB5_PLUGIN_NO_HANDLE = ( - 1765328135L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PLUGIN_NO_HANDLE); }))) {
            mixin(enumMixinStr_KRB5_PLUGIN_NO_HANDLE);
        }
    }




    static if(!is(typeof(KRB5_PLUGIN_OP_NOTSUPP))) {
        private enum enumMixinStr_KRB5_PLUGIN_OP_NOTSUPP = `enum KRB5_PLUGIN_OP_NOTSUPP = ( - 1765328134L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PLUGIN_OP_NOTSUPP); }))) {
            mixin(enumMixinStr_KRB5_PLUGIN_OP_NOTSUPP);
        }
    }




    static if(!is(typeof(KRB5_ERR_INVALID_UTF8))) {
        private enum enumMixinStr_KRB5_ERR_INVALID_UTF8 = `enum KRB5_ERR_INVALID_UTF8 = ( - 1765328133L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_ERR_INVALID_UTF8); }))) {
            mixin(enumMixinStr_KRB5_ERR_INVALID_UTF8);
        }
    }




    static if(!is(typeof(KRB5_ERR_FAST_REQUIRED))) {
        private enum enumMixinStr_KRB5_ERR_FAST_REQUIRED = `enum KRB5_ERR_FAST_REQUIRED = ( - 1765328132L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_ERR_FAST_REQUIRED); }))) {
            mixin(enumMixinStr_KRB5_ERR_FAST_REQUIRED);
        }
    }




    static if(!is(typeof(KRB5_LOCAL_ADDR_REQUIRED))) {
        private enum enumMixinStr_KRB5_LOCAL_ADDR_REQUIRED = `enum KRB5_LOCAL_ADDR_REQUIRED = ( - 1765328131L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LOCAL_ADDR_REQUIRED); }))) {
            mixin(enumMixinStr_KRB5_LOCAL_ADDR_REQUIRED);
        }
    }




    static if(!is(typeof(KRB5_REMOTE_ADDR_REQUIRED))) {
        private enum enumMixinStr_KRB5_REMOTE_ADDR_REQUIRED = `enum KRB5_REMOTE_ADDR_REQUIRED = ( - 1765328130L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_REMOTE_ADDR_REQUIRED); }))) {
            mixin(enumMixinStr_KRB5_REMOTE_ADDR_REQUIRED);
        }
    }




    static if(!is(typeof(KRB5_TRACE_NOSUPP))) {
        private enum enumMixinStr_KRB5_TRACE_NOSUPP = `enum KRB5_TRACE_NOSUPP = ( - 1765328129L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TRACE_NOSUPP); }))) {
            mixin(enumMixinStr_KRB5_TRACE_NOSUPP);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_APP_DATA_ENCRYPT))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_APP_DATA_ENCRYPT = `enum KRB5_KEYUSAGE_APP_DATA_ENCRYPT = 16;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_APP_DATA_ENCRYPT); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_APP_DATA_ENCRYPT);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_KRB_SAFE_CKSUM))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_KRB_SAFE_CKSUM = `enum KRB5_KEYUSAGE_KRB_SAFE_CKSUM = 15;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_KRB_SAFE_CKSUM); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_KRB_SAFE_CKSUM);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_KRB_CRED_ENCPART))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_KRB_CRED_ENCPART = `enum KRB5_KEYUSAGE_KRB_CRED_ENCPART = 14;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_KRB_CRED_ENCPART); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_KRB_CRED_ENCPART);
        }
    }




    static if(!is(typeof(ERROR_TABLE_BASE_krb5))) {
        private enum enumMixinStr_ERROR_TABLE_BASE_krb5 = `enum ERROR_TABLE_BASE_krb5 = ( - 1765328384L );`;
        static if(is(typeof({ mixin(enumMixinStr_ERROR_TABLE_BASE_krb5); }))) {
            mixin(enumMixinStr_ERROR_TABLE_BASE_krb5);
        }
    }




    static if(!is(typeof(init_krb5_err_tbl))) {
        private enum enumMixinStr_init_krb5_err_tbl = `enum init_krb5_err_tbl = initialize_krb5_error_table;`;
        static if(is(typeof({ mixin(enumMixinStr_init_krb5_err_tbl); }))) {
            mixin(enumMixinStr_init_krb5_err_tbl);
        }
    }




    static if(!is(typeof(krb5_err_base))) {
        private enum enumMixinStr_krb5_err_base = `enum krb5_err_base = ( - 1765328384L );`;
        static if(is(typeof({ mixin(enumMixinStr_krb5_err_base); }))) {
            mixin(enumMixinStr_krb5_err_base);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_KRB_PRIV_ENCPART))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_KRB_PRIV_ENCPART = `enum KRB5_KEYUSAGE_KRB_PRIV_ENCPART = 13;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_KRB_PRIV_ENCPART); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_KRB_PRIV_ENCPART);
        }
    }




    static if(!is(typeof(KRB5_PLUGIN_VER_NOTSUPP))) {
        private enum enumMixinStr_KRB5_PLUGIN_VER_NOTSUPP = `enum KRB5_PLUGIN_VER_NOTSUPP = ( - 1750600192L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PLUGIN_VER_NOTSUPP); }))) {
            mixin(enumMixinStr_KRB5_PLUGIN_VER_NOTSUPP);
        }
    }




    static if(!is(typeof(KRB5_PLUGIN_BAD_MODULE_SPEC))) {
        private enum enumMixinStr_KRB5_PLUGIN_BAD_MODULE_SPEC = `enum KRB5_PLUGIN_BAD_MODULE_SPEC = ( - 1750600191L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PLUGIN_BAD_MODULE_SPEC); }))) {
            mixin(enumMixinStr_KRB5_PLUGIN_BAD_MODULE_SPEC);
        }
    }




    static if(!is(typeof(KRB5_PLUGIN_NAME_NOTFOUND))) {
        private enum enumMixinStr_KRB5_PLUGIN_NAME_NOTFOUND = `enum KRB5_PLUGIN_NAME_NOTFOUND = ( - 1750600190L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_PLUGIN_NAME_NOTFOUND); }))) {
            mixin(enumMixinStr_KRB5_PLUGIN_NAME_NOTFOUND);
        }
    }




    static if(!is(typeof(KRB5KDC_ERR_DISCARD))) {
        private enum enumMixinStr_KRB5KDC_ERR_DISCARD = `enum KRB5KDC_ERR_DISCARD = ( - 1750600189L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5KDC_ERR_DISCARD); }))) {
            mixin(enumMixinStr_KRB5KDC_ERR_DISCARD);
        }
    }




    static if(!is(typeof(KRB5_DCC_CANNOT_CREATE))) {
        private enum enumMixinStr_KRB5_DCC_CANNOT_CREATE = `enum KRB5_DCC_CANNOT_CREATE = ( - 1750600188L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_DCC_CANNOT_CREATE); }))) {
            mixin(enumMixinStr_KRB5_DCC_CANNOT_CREATE);
        }
    }




    static if(!is(typeof(KRB5_KCC_INVALID_ANCHOR))) {
        private enum enumMixinStr_KRB5_KCC_INVALID_ANCHOR = `enum KRB5_KCC_INVALID_ANCHOR = ( - 1750600187L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KCC_INVALID_ANCHOR); }))) {
            mixin(enumMixinStr_KRB5_KCC_INVALID_ANCHOR);
        }
    }




    static if(!is(typeof(KRB5_KCC_UNKNOWN_VERSION))) {
        private enum enumMixinStr_KRB5_KCC_UNKNOWN_VERSION = `enum KRB5_KCC_UNKNOWN_VERSION = ( - 1750600186L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KCC_UNKNOWN_VERSION); }))) {
            mixin(enumMixinStr_KRB5_KCC_UNKNOWN_VERSION);
        }
    }




    static if(!is(typeof(KRB5_KCC_INVALID_UID))) {
        private enum enumMixinStr_KRB5_KCC_INVALID_UID = `enum KRB5_KCC_INVALID_UID = ( - 1750600185L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KCC_INVALID_UID); }))) {
            mixin(enumMixinStr_KRB5_KCC_INVALID_UID);
        }
    }




    static if(!is(typeof(KRB5_KCM_MALFORMED_REPLY))) {
        private enum enumMixinStr_KRB5_KCM_MALFORMED_REPLY = `enum KRB5_KCM_MALFORMED_REPLY = ( - 1750600184L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KCM_MALFORMED_REPLY); }))) {
            mixin(enumMixinStr_KRB5_KCM_MALFORMED_REPLY);
        }
    }




    static if(!is(typeof(KRB5_KCM_RPC_ERROR))) {
        private enum enumMixinStr_KRB5_KCM_RPC_ERROR = `enum KRB5_KCM_RPC_ERROR = ( - 1750600183L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KCM_RPC_ERROR); }))) {
            mixin(enumMixinStr_KRB5_KCM_RPC_ERROR);
        }
    }




    static if(!is(typeof(KRB5_KCM_REPLY_TOO_BIG))) {
        private enum enumMixinStr_KRB5_KCM_REPLY_TOO_BIG = `enum KRB5_KCM_REPLY_TOO_BIG = ( - 1750600182L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KCM_REPLY_TOO_BIG); }))) {
            mixin(enumMixinStr_KRB5_KCM_REPLY_TOO_BIG);
        }
    }




    static if(!is(typeof(KRB5_KCM_NO_SERVER))) {
        private enum enumMixinStr_KRB5_KCM_NO_SERVER = `enum KRB5_KCM_NO_SERVER = ( - 1750600181L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KCM_NO_SERVER); }))) {
            mixin(enumMixinStr_KRB5_KCM_NO_SERVER);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_AP_REP_ENCPART))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_AP_REP_ENCPART = `enum KRB5_KEYUSAGE_AP_REP_ENCPART = 12;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_AP_REP_ENCPART); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_AP_REP_ENCPART);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_AP_REQ_AUTH))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_AP_REQ_AUTH = `enum KRB5_KEYUSAGE_AP_REQ_AUTH = 11;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_AP_REQ_AUTH); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_AP_REQ_AUTH);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_AP_REQ_AUTH_CKSUM))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_AP_REQ_AUTH_CKSUM = `enum KRB5_KEYUSAGE_AP_REQ_AUTH_CKSUM = 10;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_AP_REQ_AUTH_CKSUM); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_AP_REQ_AUTH_CKSUM);
        }
    }




    static if(!is(typeof(ERROR_TABLE_BASE_k5e1))) {
        private enum enumMixinStr_ERROR_TABLE_BASE_k5e1 = `enum ERROR_TABLE_BASE_k5e1 = ( - 1750600192L );`;
        static if(is(typeof({ mixin(enumMixinStr_ERROR_TABLE_BASE_k5e1); }))) {
            mixin(enumMixinStr_ERROR_TABLE_BASE_k5e1);
        }
    }




    static if(!is(typeof(init_k5e1_err_tbl))) {
        private enum enumMixinStr_init_k5e1_err_tbl = `enum init_k5e1_err_tbl = initialize_k5e1_error_table;`;
        static if(is(typeof({ mixin(enumMixinStr_init_k5e1_err_tbl); }))) {
            mixin(enumMixinStr_init_k5e1_err_tbl);
        }
    }




    static if(!is(typeof(k5e1_err_base))) {
        private enum enumMixinStr_k5e1_err_base = `enum k5e1_err_base = ( - 1750600192L );`;
        static if(is(typeof({ mixin(enumMixinStr_k5e1_err_base); }))) {
            mixin(enumMixinStr_k5e1_err_base);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_TGS_REP_ENCPART_SUBKEY))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_TGS_REP_ENCPART_SUBKEY = `enum KRB5_KEYUSAGE_TGS_REP_ENCPART_SUBKEY = 9;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_TGS_REP_ENCPART_SUBKEY); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_TGS_REP_ENCPART_SUBKEY);
        }
    }




    static if(!is(typeof(KRB5_KDB_RCSID))) {
        private enum enumMixinStr_KRB5_KDB_RCSID = `enum KRB5_KDB_RCSID = ( - 1780008448L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_RCSID); }))) {
            mixin(enumMixinStr_KRB5_KDB_RCSID);
        }
    }




    static if(!is(typeof(KRB5_KDB_INUSE))) {
        private enum enumMixinStr_KRB5_KDB_INUSE = `enum KRB5_KDB_INUSE = ( - 1780008447L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_INUSE); }))) {
            mixin(enumMixinStr_KRB5_KDB_INUSE);
        }
    }




    static if(!is(typeof(KRB5_KDB_UK_SERROR))) {
        private enum enumMixinStr_KRB5_KDB_UK_SERROR = `enum KRB5_KDB_UK_SERROR = ( - 1780008446L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_UK_SERROR); }))) {
            mixin(enumMixinStr_KRB5_KDB_UK_SERROR);
        }
    }




    static if(!is(typeof(KRB5_KDB_UK_RERROR))) {
        private enum enumMixinStr_KRB5_KDB_UK_RERROR = `enum KRB5_KDB_UK_RERROR = ( - 1780008445L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_UK_RERROR); }))) {
            mixin(enumMixinStr_KRB5_KDB_UK_RERROR);
        }
    }




    static if(!is(typeof(KRB5_KDB_UNAUTH))) {
        private enum enumMixinStr_KRB5_KDB_UNAUTH = `enum KRB5_KDB_UNAUTH = ( - 1780008444L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_UNAUTH); }))) {
            mixin(enumMixinStr_KRB5_KDB_UNAUTH);
        }
    }




    static if(!is(typeof(KRB5_KDB_NOENTRY))) {
        private enum enumMixinStr_KRB5_KDB_NOENTRY = `enum KRB5_KDB_NOENTRY = ( - 1780008443L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_NOENTRY); }))) {
            mixin(enumMixinStr_KRB5_KDB_NOENTRY);
        }
    }




    static if(!is(typeof(KRB5_KDB_ILL_WILDCARD))) {
        private enum enumMixinStr_KRB5_KDB_ILL_WILDCARD = `enum KRB5_KDB_ILL_WILDCARD = ( - 1780008442L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_ILL_WILDCARD); }))) {
            mixin(enumMixinStr_KRB5_KDB_ILL_WILDCARD);
        }
    }




    static if(!is(typeof(KRB5_KDB_DB_INUSE))) {
        private enum enumMixinStr_KRB5_KDB_DB_INUSE = `enum KRB5_KDB_DB_INUSE = ( - 1780008441L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_DB_INUSE); }))) {
            mixin(enumMixinStr_KRB5_KDB_DB_INUSE);
        }
    }




    static if(!is(typeof(KRB5_KDB_DB_CHANGED))) {
        private enum enumMixinStr_KRB5_KDB_DB_CHANGED = `enum KRB5_KDB_DB_CHANGED = ( - 1780008440L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_DB_CHANGED); }))) {
            mixin(enumMixinStr_KRB5_KDB_DB_CHANGED);
        }
    }




    static if(!is(typeof(KRB5_KDB_TRUNCATED_RECORD))) {
        private enum enumMixinStr_KRB5_KDB_TRUNCATED_RECORD = `enum KRB5_KDB_TRUNCATED_RECORD = ( - 1780008439L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_TRUNCATED_RECORD); }))) {
            mixin(enumMixinStr_KRB5_KDB_TRUNCATED_RECORD);
        }
    }




    static if(!is(typeof(KRB5_KDB_RECURSIVELOCK))) {
        private enum enumMixinStr_KRB5_KDB_RECURSIVELOCK = `enum KRB5_KDB_RECURSIVELOCK = ( - 1780008438L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_RECURSIVELOCK); }))) {
            mixin(enumMixinStr_KRB5_KDB_RECURSIVELOCK);
        }
    }




    static if(!is(typeof(KRB5_KDB_NOTLOCKED))) {
        private enum enumMixinStr_KRB5_KDB_NOTLOCKED = `enum KRB5_KDB_NOTLOCKED = ( - 1780008437L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_NOTLOCKED); }))) {
            mixin(enumMixinStr_KRB5_KDB_NOTLOCKED);
        }
    }




    static if(!is(typeof(KRB5_KDB_BADLOCKMODE))) {
        private enum enumMixinStr_KRB5_KDB_BADLOCKMODE = `enum KRB5_KDB_BADLOCKMODE = ( - 1780008436L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_BADLOCKMODE); }))) {
            mixin(enumMixinStr_KRB5_KDB_BADLOCKMODE);
        }
    }




    static if(!is(typeof(KRB5_KDB_DBNOTINITED))) {
        private enum enumMixinStr_KRB5_KDB_DBNOTINITED = `enum KRB5_KDB_DBNOTINITED = ( - 1780008435L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_DBNOTINITED); }))) {
            mixin(enumMixinStr_KRB5_KDB_DBNOTINITED);
        }
    }




    static if(!is(typeof(KRB5_KDB_DBINITED))) {
        private enum enumMixinStr_KRB5_KDB_DBINITED = `enum KRB5_KDB_DBINITED = ( - 1780008434L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_DBINITED); }))) {
            mixin(enumMixinStr_KRB5_KDB_DBINITED);
        }
    }




    static if(!is(typeof(KRB5_KDB_ILLDIRECTION))) {
        private enum enumMixinStr_KRB5_KDB_ILLDIRECTION = `enum KRB5_KDB_ILLDIRECTION = ( - 1780008433L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_ILLDIRECTION); }))) {
            mixin(enumMixinStr_KRB5_KDB_ILLDIRECTION);
        }
    }




    static if(!is(typeof(KRB5_KDB_NOMASTERKEY))) {
        private enum enumMixinStr_KRB5_KDB_NOMASTERKEY = `enum KRB5_KDB_NOMASTERKEY = ( - 1780008432L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_NOMASTERKEY); }))) {
            mixin(enumMixinStr_KRB5_KDB_NOMASTERKEY);
        }
    }




    static if(!is(typeof(KRB5_KDB_BADMASTERKEY))) {
        private enum enumMixinStr_KRB5_KDB_BADMASTERKEY = `enum KRB5_KDB_BADMASTERKEY = ( - 1780008431L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_BADMASTERKEY); }))) {
            mixin(enumMixinStr_KRB5_KDB_BADMASTERKEY);
        }
    }




    static if(!is(typeof(KRB5_KDB_INVALIDKEYSIZE))) {
        private enum enumMixinStr_KRB5_KDB_INVALIDKEYSIZE = `enum KRB5_KDB_INVALIDKEYSIZE = ( - 1780008430L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_INVALIDKEYSIZE); }))) {
            mixin(enumMixinStr_KRB5_KDB_INVALIDKEYSIZE);
        }
    }




    static if(!is(typeof(KRB5_KDB_CANTREAD_STORED))) {
        private enum enumMixinStr_KRB5_KDB_CANTREAD_STORED = `enum KRB5_KDB_CANTREAD_STORED = ( - 1780008429L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_CANTREAD_STORED); }))) {
            mixin(enumMixinStr_KRB5_KDB_CANTREAD_STORED);
        }
    }




    static if(!is(typeof(KRB5_KDB_BADSTORED_MKEY))) {
        private enum enumMixinStr_KRB5_KDB_BADSTORED_MKEY = `enum KRB5_KDB_BADSTORED_MKEY = ( - 1780008428L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_BADSTORED_MKEY); }))) {
            mixin(enumMixinStr_KRB5_KDB_BADSTORED_MKEY);
        }
    }




    static if(!is(typeof(KRB5_KDB_NOACTMASTERKEY))) {
        private enum enumMixinStr_KRB5_KDB_NOACTMASTERKEY = `enum KRB5_KDB_NOACTMASTERKEY = ( - 1780008427L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_NOACTMASTERKEY); }))) {
            mixin(enumMixinStr_KRB5_KDB_NOACTMASTERKEY);
        }
    }




    static if(!is(typeof(KRB5_KDB_KVNONOMATCH))) {
        private enum enumMixinStr_KRB5_KDB_KVNONOMATCH = `enum KRB5_KDB_KVNONOMATCH = ( - 1780008426L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_KVNONOMATCH); }))) {
            mixin(enumMixinStr_KRB5_KDB_KVNONOMATCH);
        }
    }




    static if(!is(typeof(KRB5_KDB_STORED_MKEY_NOTCURRENT))) {
        private enum enumMixinStr_KRB5_KDB_STORED_MKEY_NOTCURRENT = `enum KRB5_KDB_STORED_MKEY_NOTCURRENT = ( - 1780008425L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_STORED_MKEY_NOTCURRENT); }))) {
            mixin(enumMixinStr_KRB5_KDB_STORED_MKEY_NOTCURRENT);
        }
    }




    static if(!is(typeof(KRB5_KDB_CANTLOCK_DB))) {
        private enum enumMixinStr_KRB5_KDB_CANTLOCK_DB = `enum KRB5_KDB_CANTLOCK_DB = ( - 1780008424L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_CANTLOCK_DB); }))) {
            mixin(enumMixinStr_KRB5_KDB_CANTLOCK_DB);
        }
    }




    static if(!is(typeof(KRB5_KDB_DB_CORRUPT))) {
        private enum enumMixinStr_KRB5_KDB_DB_CORRUPT = `enum KRB5_KDB_DB_CORRUPT = ( - 1780008423L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_DB_CORRUPT); }))) {
            mixin(enumMixinStr_KRB5_KDB_DB_CORRUPT);
        }
    }




    static if(!is(typeof(KRB5_KDB_BAD_VERSION))) {
        private enum enumMixinStr_KRB5_KDB_BAD_VERSION = `enum KRB5_KDB_BAD_VERSION = ( - 1780008422L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_BAD_VERSION); }))) {
            mixin(enumMixinStr_KRB5_KDB_BAD_VERSION);
        }
    }




    static if(!is(typeof(KRB5_KDB_BAD_SALTTYPE))) {
        private enum enumMixinStr_KRB5_KDB_BAD_SALTTYPE = `enum KRB5_KDB_BAD_SALTTYPE = ( - 1780008421L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_BAD_SALTTYPE); }))) {
            mixin(enumMixinStr_KRB5_KDB_BAD_SALTTYPE);
        }
    }




    static if(!is(typeof(KRB5_KDB_BAD_ENCTYPE))) {
        private enum enumMixinStr_KRB5_KDB_BAD_ENCTYPE = `enum KRB5_KDB_BAD_ENCTYPE = ( - 1780008420L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_BAD_ENCTYPE); }))) {
            mixin(enumMixinStr_KRB5_KDB_BAD_ENCTYPE);
        }
    }




    static if(!is(typeof(KRB5_KDB_BAD_CREATEFLAGS))) {
        private enum enumMixinStr_KRB5_KDB_BAD_CREATEFLAGS = `enum KRB5_KDB_BAD_CREATEFLAGS = ( - 1780008419L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_BAD_CREATEFLAGS); }))) {
            mixin(enumMixinStr_KRB5_KDB_BAD_CREATEFLAGS);
        }
    }




    static if(!is(typeof(KRB5_KDB_NO_PERMITTED_KEY))) {
        private enum enumMixinStr_KRB5_KDB_NO_PERMITTED_KEY = `enum KRB5_KDB_NO_PERMITTED_KEY = ( - 1780008418L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_NO_PERMITTED_KEY); }))) {
            mixin(enumMixinStr_KRB5_KDB_NO_PERMITTED_KEY);
        }
    }




    static if(!is(typeof(KRB5_KDB_NO_MATCHING_KEY))) {
        private enum enumMixinStr_KRB5_KDB_NO_MATCHING_KEY = `enum KRB5_KDB_NO_MATCHING_KEY = ( - 1780008417L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_NO_MATCHING_KEY); }))) {
            mixin(enumMixinStr_KRB5_KDB_NO_MATCHING_KEY);
        }
    }




    static if(!is(typeof(KRB5_KDB_DBTYPE_NOTFOUND))) {
        private enum enumMixinStr_KRB5_KDB_DBTYPE_NOTFOUND = `enum KRB5_KDB_DBTYPE_NOTFOUND = ( - 1780008416L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_DBTYPE_NOTFOUND); }))) {
            mixin(enumMixinStr_KRB5_KDB_DBTYPE_NOTFOUND);
        }
    }




    static if(!is(typeof(KRB5_KDB_DBTYPE_NOSUP))) {
        private enum enumMixinStr_KRB5_KDB_DBTYPE_NOSUP = `enum KRB5_KDB_DBTYPE_NOSUP = ( - 1780008415L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_DBTYPE_NOSUP); }))) {
            mixin(enumMixinStr_KRB5_KDB_DBTYPE_NOSUP);
        }
    }




    static if(!is(typeof(KRB5_KDB_DBTYPE_INIT))) {
        private enum enumMixinStr_KRB5_KDB_DBTYPE_INIT = `enum KRB5_KDB_DBTYPE_INIT = ( - 1780008414L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_DBTYPE_INIT); }))) {
            mixin(enumMixinStr_KRB5_KDB_DBTYPE_INIT);
        }
    }




    static if(!is(typeof(KRB5_KDB_SERVER_INTERNAL_ERR))) {
        private enum enumMixinStr_KRB5_KDB_SERVER_INTERNAL_ERR = `enum KRB5_KDB_SERVER_INTERNAL_ERR = ( - 1780008413L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_SERVER_INTERNAL_ERR); }))) {
            mixin(enumMixinStr_KRB5_KDB_SERVER_INTERNAL_ERR);
        }
    }




    static if(!is(typeof(KRB5_KDB_ACCESS_ERROR))) {
        private enum enumMixinStr_KRB5_KDB_ACCESS_ERROR = `enum KRB5_KDB_ACCESS_ERROR = ( - 1780008412L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_ACCESS_ERROR); }))) {
            mixin(enumMixinStr_KRB5_KDB_ACCESS_ERROR);
        }
    }




    static if(!is(typeof(KRB5_KDB_INTERNAL_ERROR))) {
        private enum enumMixinStr_KRB5_KDB_INTERNAL_ERROR = `enum KRB5_KDB_INTERNAL_ERROR = ( - 1780008411L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_INTERNAL_ERROR); }))) {
            mixin(enumMixinStr_KRB5_KDB_INTERNAL_ERROR);
        }
    }




    static if(!is(typeof(KRB5_KDB_CONSTRAINT_VIOLATION))) {
        private enum enumMixinStr_KRB5_KDB_CONSTRAINT_VIOLATION = `enum KRB5_KDB_CONSTRAINT_VIOLATION = ( - 1780008410L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_CONSTRAINT_VIOLATION); }))) {
            mixin(enumMixinStr_KRB5_KDB_CONSTRAINT_VIOLATION);
        }
    }




    static if(!is(typeof(KRB5_LOG_CONV))) {
        private enum enumMixinStr_KRB5_LOG_CONV = `enum KRB5_LOG_CONV = ( - 1780008409L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LOG_CONV); }))) {
            mixin(enumMixinStr_KRB5_LOG_CONV);
        }
    }




    static if(!is(typeof(KRB5_LOG_UNSTABLE))) {
        private enum enumMixinStr_KRB5_LOG_UNSTABLE = `enum KRB5_LOG_UNSTABLE = ( - 1780008408L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LOG_UNSTABLE); }))) {
            mixin(enumMixinStr_KRB5_LOG_UNSTABLE);
        }
    }




    static if(!is(typeof(KRB5_LOG_CORRUPT))) {
        private enum enumMixinStr_KRB5_LOG_CORRUPT = `enum KRB5_LOG_CORRUPT = ( - 1780008407L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LOG_CORRUPT); }))) {
            mixin(enumMixinStr_KRB5_LOG_CORRUPT);
        }
    }




    static if(!is(typeof(KRB5_LOG_ERROR))) {
        private enum enumMixinStr_KRB5_LOG_ERROR = `enum KRB5_LOG_ERROR = ( - 1780008406L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_LOG_ERROR); }))) {
            mixin(enumMixinStr_KRB5_LOG_ERROR);
        }
    }




    static if(!is(typeof(KRB5_KDB_DBTYPE_MISMATCH))) {
        private enum enumMixinStr_KRB5_KDB_DBTYPE_MISMATCH = `enum KRB5_KDB_DBTYPE_MISMATCH = ( - 1780008405L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_DBTYPE_MISMATCH); }))) {
            mixin(enumMixinStr_KRB5_KDB_DBTYPE_MISMATCH);
        }
    }




    static if(!is(typeof(KRB5_KDB_POLICY_REF))) {
        private enum enumMixinStr_KRB5_KDB_POLICY_REF = `enum KRB5_KDB_POLICY_REF = ( - 1780008404L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_POLICY_REF); }))) {
            mixin(enumMixinStr_KRB5_KDB_POLICY_REF);
        }
    }




    static if(!is(typeof(KRB5_KDB_STRINGS_TOOLONG))) {
        private enum enumMixinStr_KRB5_KDB_STRINGS_TOOLONG = `enum KRB5_KDB_STRINGS_TOOLONG = ( - 1780008403L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KDB_STRINGS_TOOLONG); }))) {
            mixin(enumMixinStr_KRB5_KDB_STRINGS_TOOLONG);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_TGS_REP_ENCPART_SESSKEY))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_TGS_REP_ENCPART_SESSKEY = `enum KRB5_KEYUSAGE_TGS_REP_ENCPART_SESSKEY = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_TGS_REP_ENCPART_SESSKEY); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_TGS_REP_ENCPART_SESSKEY);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_TGS_REQ_AUTH))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_TGS_REQ_AUTH = `enum KRB5_KEYUSAGE_TGS_REQ_AUTH = 7;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_TGS_REQ_AUTH); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_TGS_REQ_AUTH);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_TGS_REQ_AUTH_CKSUM))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_TGS_REQ_AUTH_CKSUM = `enum KRB5_KEYUSAGE_TGS_REQ_AUTH_CKSUM = 6;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_TGS_REQ_AUTH_CKSUM); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_TGS_REQ_AUTH_CKSUM);
        }
    }




    static if(!is(typeof(ERROR_TABLE_BASE_kdb5))) {
        private enum enumMixinStr_ERROR_TABLE_BASE_kdb5 = `enum ERROR_TABLE_BASE_kdb5 = ( - 1780008448L );`;
        static if(is(typeof({ mixin(enumMixinStr_ERROR_TABLE_BASE_kdb5); }))) {
            mixin(enumMixinStr_ERROR_TABLE_BASE_kdb5);
        }
    }




    static if(!is(typeof(init_kdb5_err_tbl))) {
        private enum enumMixinStr_init_kdb5_err_tbl = `enum init_kdb5_err_tbl = initialize_kdb5_error_table;`;
        static if(is(typeof({ mixin(enumMixinStr_init_kdb5_err_tbl); }))) {
            mixin(enumMixinStr_init_kdb5_err_tbl);
        }
    }




    static if(!is(typeof(kdb5_err_base))) {
        private enum enumMixinStr_kdb5_err_base = `enum kdb5_err_base = ( - 1780008448L );`;
        static if(is(typeof({ mixin(enumMixinStr_kdb5_err_base); }))) {
            mixin(enumMixinStr_kdb5_err_base);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_TGS_REQ_AD_SUBKEY))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_TGS_REQ_AD_SUBKEY = `enum KRB5_KEYUSAGE_TGS_REQ_AD_SUBKEY = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_TGS_REQ_AD_SUBKEY); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_TGS_REQ_AD_SUBKEY);
        }
    }




    static if(!is(typeof(KV5M_NONE))) {
        private enum enumMixinStr_KV5M_NONE = `enum KV5M_NONE = ( - 1760647424L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_NONE); }))) {
            mixin(enumMixinStr_KV5M_NONE);
        }
    }




    static if(!is(typeof(KV5M_PRINCIPAL))) {
        private enum enumMixinStr_KV5M_PRINCIPAL = `enum KV5M_PRINCIPAL = ( - 1760647423L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_PRINCIPAL); }))) {
            mixin(enumMixinStr_KV5M_PRINCIPAL);
        }
    }




    static if(!is(typeof(KV5M_DATA))) {
        private enum enumMixinStr_KV5M_DATA = `enum KV5M_DATA = ( - 1760647422L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_DATA); }))) {
            mixin(enumMixinStr_KV5M_DATA);
        }
    }




    static if(!is(typeof(KV5M_KEYBLOCK))) {
        private enum enumMixinStr_KV5M_KEYBLOCK = `enum KV5M_KEYBLOCK = ( - 1760647421L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_KEYBLOCK); }))) {
            mixin(enumMixinStr_KV5M_KEYBLOCK);
        }
    }




    static if(!is(typeof(KV5M_CHECKSUM))) {
        private enum enumMixinStr_KV5M_CHECKSUM = `enum KV5M_CHECKSUM = ( - 1760647420L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_CHECKSUM); }))) {
            mixin(enumMixinStr_KV5M_CHECKSUM);
        }
    }




    static if(!is(typeof(KV5M_ENCRYPT_BLOCK))) {
        private enum enumMixinStr_KV5M_ENCRYPT_BLOCK = `enum KV5M_ENCRYPT_BLOCK = ( - 1760647419L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_ENCRYPT_BLOCK); }))) {
            mixin(enumMixinStr_KV5M_ENCRYPT_BLOCK);
        }
    }




    static if(!is(typeof(KV5M_ENC_DATA))) {
        private enum enumMixinStr_KV5M_ENC_DATA = `enum KV5M_ENC_DATA = ( - 1760647418L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_ENC_DATA); }))) {
            mixin(enumMixinStr_KV5M_ENC_DATA);
        }
    }




    static if(!is(typeof(KV5M_CRYPTOSYSTEM_ENTRY))) {
        private enum enumMixinStr_KV5M_CRYPTOSYSTEM_ENTRY = `enum KV5M_CRYPTOSYSTEM_ENTRY = ( - 1760647417L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_CRYPTOSYSTEM_ENTRY); }))) {
            mixin(enumMixinStr_KV5M_CRYPTOSYSTEM_ENTRY);
        }
    }




    static if(!is(typeof(KV5M_CS_TABLE_ENTRY))) {
        private enum enumMixinStr_KV5M_CS_TABLE_ENTRY = `enum KV5M_CS_TABLE_ENTRY = ( - 1760647416L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_CS_TABLE_ENTRY); }))) {
            mixin(enumMixinStr_KV5M_CS_TABLE_ENTRY);
        }
    }




    static if(!is(typeof(KV5M_CHECKSUM_ENTRY))) {
        private enum enumMixinStr_KV5M_CHECKSUM_ENTRY = `enum KV5M_CHECKSUM_ENTRY = ( - 1760647415L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_CHECKSUM_ENTRY); }))) {
            mixin(enumMixinStr_KV5M_CHECKSUM_ENTRY);
        }
    }




    static if(!is(typeof(KV5M_AUTHDATA))) {
        private enum enumMixinStr_KV5M_AUTHDATA = `enum KV5M_AUTHDATA = ( - 1760647414L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_AUTHDATA); }))) {
            mixin(enumMixinStr_KV5M_AUTHDATA);
        }
    }




    static if(!is(typeof(KV5M_TRANSITED))) {
        private enum enumMixinStr_KV5M_TRANSITED = `enum KV5M_TRANSITED = ( - 1760647413L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_TRANSITED); }))) {
            mixin(enumMixinStr_KV5M_TRANSITED);
        }
    }




    static if(!is(typeof(KV5M_ENC_TKT_PART))) {
        private enum enumMixinStr_KV5M_ENC_TKT_PART = `enum KV5M_ENC_TKT_PART = ( - 1760647412L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_ENC_TKT_PART); }))) {
            mixin(enumMixinStr_KV5M_ENC_TKT_PART);
        }
    }




    static if(!is(typeof(KV5M_TICKET))) {
        private enum enumMixinStr_KV5M_TICKET = `enum KV5M_TICKET = ( - 1760647411L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_TICKET); }))) {
            mixin(enumMixinStr_KV5M_TICKET);
        }
    }




    static if(!is(typeof(KV5M_AUTHENTICATOR))) {
        private enum enumMixinStr_KV5M_AUTHENTICATOR = `enum KV5M_AUTHENTICATOR = ( - 1760647410L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_AUTHENTICATOR); }))) {
            mixin(enumMixinStr_KV5M_AUTHENTICATOR);
        }
    }




    static if(!is(typeof(KV5M_TKT_AUTHENT))) {
        private enum enumMixinStr_KV5M_TKT_AUTHENT = `enum KV5M_TKT_AUTHENT = ( - 1760647409L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_TKT_AUTHENT); }))) {
            mixin(enumMixinStr_KV5M_TKT_AUTHENT);
        }
    }




    static if(!is(typeof(KV5M_CREDS))) {
        private enum enumMixinStr_KV5M_CREDS = `enum KV5M_CREDS = ( - 1760647408L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_CREDS); }))) {
            mixin(enumMixinStr_KV5M_CREDS);
        }
    }




    static if(!is(typeof(KV5M_LAST_REQ_ENTRY))) {
        private enum enumMixinStr_KV5M_LAST_REQ_ENTRY = `enum KV5M_LAST_REQ_ENTRY = ( - 1760647407L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_LAST_REQ_ENTRY); }))) {
            mixin(enumMixinStr_KV5M_LAST_REQ_ENTRY);
        }
    }




    static if(!is(typeof(KV5M_PA_DATA))) {
        private enum enumMixinStr_KV5M_PA_DATA = `enum KV5M_PA_DATA = ( - 1760647406L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_PA_DATA); }))) {
            mixin(enumMixinStr_KV5M_PA_DATA);
        }
    }




    static if(!is(typeof(KV5M_KDC_REQ))) {
        private enum enumMixinStr_KV5M_KDC_REQ = `enum KV5M_KDC_REQ = ( - 1760647405L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_KDC_REQ); }))) {
            mixin(enumMixinStr_KV5M_KDC_REQ);
        }
    }




    static if(!is(typeof(KV5M_ENC_KDC_REP_PART))) {
        private enum enumMixinStr_KV5M_ENC_KDC_REP_PART = `enum KV5M_ENC_KDC_REP_PART = ( - 1760647404L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_ENC_KDC_REP_PART); }))) {
            mixin(enumMixinStr_KV5M_ENC_KDC_REP_PART);
        }
    }




    static if(!is(typeof(KV5M_KDC_REP))) {
        private enum enumMixinStr_KV5M_KDC_REP = `enum KV5M_KDC_REP = ( - 1760647403L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_KDC_REP); }))) {
            mixin(enumMixinStr_KV5M_KDC_REP);
        }
    }




    static if(!is(typeof(KV5M_ERROR))) {
        private enum enumMixinStr_KV5M_ERROR = `enum KV5M_ERROR = ( - 1760647402L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_ERROR); }))) {
            mixin(enumMixinStr_KV5M_ERROR);
        }
    }




    static if(!is(typeof(KV5M_AP_REQ))) {
        private enum enumMixinStr_KV5M_AP_REQ = `enum KV5M_AP_REQ = ( - 1760647401L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_AP_REQ); }))) {
            mixin(enumMixinStr_KV5M_AP_REQ);
        }
    }




    static if(!is(typeof(KV5M_AP_REP))) {
        private enum enumMixinStr_KV5M_AP_REP = `enum KV5M_AP_REP = ( - 1760647400L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_AP_REP); }))) {
            mixin(enumMixinStr_KV5M_AP_REP);
        }
    }




    static if(!is(typeof(KV5M_AP_REP_ENC_PART))) {
        private enum enumMixinStr_KV5M_AP_REP_ENC_PART = `enum KV5M_AP_REP_ENC_PART = ( - 1760647399L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_AP_REP_ENC_PART); }))) {
            mixin(enumMixinStr_KV5M_AP_REP_ENC_PART);
        }
    }




    static if(!is(typeof(KV5M_RESPONSE))) {
        private enum enumMixinStr_KV5M_RESPONSE = `enum KV5M_RESPONSE = ( - 1760647398L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_RESPONSE); }))) {
            mixin(enumMixinStr_KV5M_RESPONSE);
        }
    }




    static if(!is(typeof(KV5M_SAFE))) {
        private enum enumMixinStr_KV5M_SAFE = `enum KV5M_SAFE = ( - 1760647397L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_SAFE); }))) {
            mixin(enumMixinStr_KV5M_SAFE);
        }
    }




    static if(!is(typeof(KV5M_PRIV))) {
        private enum enumMixinStr_KV5M_PRIV = `enum KV5M_PRIV = ( - 1760647396L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_PRIV); }))) {
            mixin(enumMixinStr_KV5M_PRIV);
        }
    }




    static if(!is(typeof(KV5M_PRIV_ENC_PART))) {
        private enum enumMixinStr_KV5M_PRIV_ENC_PART = `enum KV5M_PRIV_ENC_PART = ( - 1760647395L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_PRIV_ENC_PART); }))) {
            mixin(enumMixinStr_KV5M_PRIV_ENC_PART);
        }
    }




    static if(!is(typeof(KV5M_CRED))) {
        private enum enumMixinStr_KV5M_CRED = `enum KV5M_CRED = ( - 1760647394L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_CRED); }))) {
            mixin(enumMixinStr_KV5M_CRED);
        }
    }




    static if(!is(typeof(KV5M_CRED_INFO))) {
        private enum enumMixinStr_KV5M_CRED_INFO = `enum KV5M_CRED_INFO = ( - 1760647393L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_CRED_INFO); }))) {
            mixin(enumMixinStr_KV5M_CRED_INFO);
        }
    }




    static if(!is(typeof(KV5M_CRED_ENC_PART))) {
        private enum enumMixinStr_KV5M_CRED_ENC_PART = `enum KV5M_CRED_ENC_PART = ( - 1760647392L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_CRED_ENC_PART); }))) {
            mixin(enumMixinStr_KV5M_CRED_ENC_PART);
        }
    }




    static if(!is(typeof(KV5M_PWD_DATA))) {
        private enum enumMixinStr_KV5M_PWD_DATA = `enum KV5M_PWD_DATA = ( - 1760647391L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_PWD_DATA); }))) {
            mixin(enumMixinStr_KV5M_PWD_DATA);
        }
    }




    static if(!is(typeof(KV5M_ADDRESS))) {
        private enum enumMixinStr_KV5M_ADDRESS = `enum KV5M_ADDRESS = ( - 1760647390L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_ADDRESS); }))) {
            mixin(enumMixinStr_KV5M_ADDRESS);
        }
    }




    static if(!is(typeof(KV5M_KEYTAB_ENTRY))) {
        private enum enumMixinStr_KV5M_KEYTAB_ENTRY = `enum KV5M_KEYTAB_ENTRY = ( - 1760647389L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_KEYTAB_ENTRY); }))) {
            mixin(enumMixinStr_KV5M_KEYTAB_ENTRY);
        }
    }




    static if(!is(typeof(KV5M_CONTEXT))) {
        private enum enumMixinStr_KV5M_CONTEXT = `enum KV5M_CONTEXT = ( - 1760647388L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_CONTEXT); }))) {
            mixin(enumMixinStr_KV5M_CONTEXT);
        }
    }




    static if(!is(typeof(KV5M_OS_CONTEXT))) {
        private enum enumMixinStr_KV5M_OS_CONTEXT = `enum KV5M_OS_CONTEXT = ( - 1760647387L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_OS_CONTEXT); }))) {
            mixin(enumMixinStr_KV5M_OS_CONTEXT);
        }
    }




    static if(!is(typeof(KV5M_ALT_METHOD))) {
        private enum enumMixinStr_KV5M_ALT_METHOD = `enum KV5M_ALT_METHOD = ( - 1760647386L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_ALT_METHOD); }))) {
            mixin(enumMixinStr_KV5M_ALT_METHOD);
        }
    }




    static if(!is(typeof(KV5M_ETYPE_INFO_ENTRY))) {
        private enum enumMixinStr_KV5M_ETYPE_INFO_ENTRY = `enum KV5M_ETYPE_INFO_ENTRY = ( - 1760647385L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_ETYPE_INFO_ENTRY); }))) {
            mixin(enumMixinStr_KV5M_ETYPE_INFO_ENTRY);
        }
    }




    static if(!is(typeof(KV5M_DB_CONTEXT))) {
        private enum enumMixinStr_KV5M_DB_CONTEXT = `enum KV5M_DB_CONTEXT = ( - 1760647384L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_DB_CONTEXT); }))) {
            mixin(enumMixinStr_KV5M_DB_CONTEXT);
        }
    }




    static if(!is(typeof(KV5M_AUTH_CONTEXT))) {
        private enum enumMixinStr_KV5M_AUTH_CONTEXT = `enum KV5M_AUTH_CONTEXT = ( - 1760647383L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_AUTH_CONTEXT); }))) {
            mixin(enumMixinStr_KV5M_AUTH_CONTEXT);
        }
    }




    static if(!is(typeof(KV5M_KEYTAB))) {
        private enum enumMixinStr_KV5M_KEYTAB = `enum KV5M_KEYTAB = ( - 1760647382L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_KEYTAB); }))) {
            mixin(enumMixinStr_KV5M_KEYTAB);
        }
    }




    static if(!is(typeof(KV5M_RCACHE))) {
        private enum enumMixinStr_KV5M_RCACHE = `enum KV5M_RCACHE = ( - 1760647381L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_RCACHE); }))) {
            mixin(enumMixinStr_KV5M_RCACHE);
        }
    }




    static if(!is(typeof(KV5M_CCACHE))) {
        private enum enumMixinStr_KV5M_CCACHE = `enum KV5M_CCACHE = ( - 1760647380L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_CCACHE); }))) {
            mixin(enumMixinStr_KV5M_CCACHE);
        }
    }




    static if(!is(typeof(KV5M_PREAUTH_OPS))) {
        private enum enumMixinStr_KV5M_PREAUTH_OPS = `enum KV5M_PREAUTH_OPS = ( - 1760647379L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_PREAUTH_OPS); }))) {
            mixin(enumMixinStr_KV5M_PREAUTH_OPS);
        }
    }




    static if(!is(typeof(KV5M_SAM_CHALLENGE))) {
        private enum enumMixinStr_KV5M_SAM_CHALLENGE = `enum KV5M_SAM_CHALLENGE = ( - 1760647378L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_SAM_CHALLENGE); }))) {
            mixin(enumMixinStr_KV5M_SAM_CHALLENGE);
        }
    }




    static if(!is(typeof(KV5M_SAM_CHALLENGE_2))) {
        private enum enumMixinStr_KV5M_SAM_CHALLENGE_2 = `enum KV5M_SAM_CHALLENGE_2 = ( - 1760647377L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_SAM_CHALLENGE_2); }))) {
            mixin(enumMixinStr_KV5M_SAM_CHALLENGE_2);
        }
    }




    static if(!is(typeof(KV5M_SAM_KEY))) {
        private enum enumMixinStr_KV5M_SAM_KEY = `enum KV5M_SAM_KEY = ( - 1760647376L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_SAM_KEY); }))) {
            mixin(enumMixinStr_KV5M_SAM_KEY);
        }
    }




    static if(!is(typeof(KV5M_ENC_SAM_RESPONSE_ENC))) {
        private enum enumMixinStr_KV5M_ENC_SAM_RESPONSE_ENC = `enum KV5M_ENC_SAM_RESPONSE_ENC = ( - 1760647375L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_ENC_SAM_RESPONSE_ENC); }))) {
            mixin(enumMixinStr_KV5M_ENC_SAM_RESPONSE_ENC);
        }
    }




    static if(!is(typeof(KV5M_ENC_SAM_RESPONSE_ENC_2))) {
        private enum enumMixinStr_KV5M_ENC_SAM_RESPONSE_ENC_2 = `enum KV5M_ENC_SAM_RESPONSE_ENC_2 = ( - 1760647374L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_ENC_SAM_RESPONSE_ENC_2); }))) {
            mixin(enumMixinStr_KV5M_ENC_SAM_RESPONSE_ENC_2);
        }
    }




    static if(!is(typeof(KV5M_SAM_RESPONSE))) {
        private enum enumMixinStr_KV5M_SAM_RESPONSE = `enum KV5M_SAM_RESPONSE = ( - 1760647373L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_SAM_RESPONSE); }))) {
            mixin(enumMixinStr_KV5M_SAM_RESPONSE);
        }
    }




    static if(!is(typeof(KV5M_SAM_RESPONSE_2))) {
        private enum enumMixinStr_KV5M_SAM_RESPONSE_2 = `enum KV5M_SAM_RESPONSE_2 = ( - 1760647372L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_SAM_RESPONSE_2); }))) {
            mixin(enumMixinStr_KV5M_SAM_RESPONSE_2);
        }
    }




    static if(!is(typeof(KV5M_PREDICTED_SAM_RESPONSE))) {
        private enum enumMixinStr_KV5M_PREDICTED_SAM_RESPONSE = `enum KV5M_PREDICTED_SAM_RESPONSE = ( - 1760647371L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_PREDICTED_SAM_RESPONSE); }))) {
            mixin(enumMixinStr_KV5M_PREDICTED_SAM_RESPONSE);
        }
    }




    static if(!is(typeof(KV5M_PASSWD_PHRASE_ELEMENT))) {
        private enum enumMixinStr_KV5M_PASSWD_PHRASE_ELEMENT = `enum KV5M_PASSWD_PHRASE_ELEMENT = ( - 1760647370L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_PASSWD_PHRASE_ELEMENT); }))) {
            mixin(enumMixinStr_KV5M_PASSWD_PHRASE_ELEMENT);
        }
    }




    static if(!is(typeof(KV5M_GSS_OID))) {
        private enum enumMixinStr_KV5M_GSS_OID = `enum KV5M_GSS_OID = ( - 1760647369L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_GSS_OID); }))) {
            mixin(enumMixinStr_KV5M_GSS_OID);
        }
    }




    static if(!is(typeof(KV5M_GSS_QUEUE))) {
        private enum enumMixinStr_KV5M_GSS_QUEUE = `enum KV5M_GSS_QUEUE = ( - 1760647368L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_GSS_QUEUE); }))) {
            mixin(enumMixinStr_KV5M_GSS_QUEUE);
        }
    }




    static if(!is(typeof(KV5M_FAST_ARMORED_REQ))) {
        private enum enumMixinStr_KV5M_FAST_ARMORED_REQ = `enum KV5M_FAST_ARMORED_REQ = ( - 1760647367L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_FAST_ARMORED_REQ); }))) {
            mixin(enumMixinStr_KV5M_FAST_ARMORED_REQ);
        }
    }




    static if(!is(typeof(KV5M_FAST_REQ))) {
        private enum enumMixinStr_KV5M_FAST_REQ = `enum KV5M_FAST_REQ = ( - 1760647366L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_FAST_REQ); }))) {
            mixin(enumMixinStr_KV5M_FAST_REQ);
        }
    }




    static if(!is(typeof(KV5M_FAST_RESPONSE))) {
        private enum enumMixinStr_KV5M_FAST_RESPONSE = `enum KV5M_FAST_RESPONSE = ( - 1760647365L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_FAST_RESPONSE); }))) {
            mixin(enumMixinStr_KV5M_FAST_RESPONSE);
        }
    }




    static if(!is(typeof(KV5M_AUTHDATA_CONTEXT))) {
        private enum enumMixinStr_KV5M_AUTHDATA_CONTEXT = `enum KV5M_AUTHDATA_CONTEXT = ( - 1760647364L );`;
        static if(is(typeof({ mixin(enumMixinStr_KV5M_AUTHDATA_CONTEXT); }))) {
            mixin(enumMixinStr_KV5M_AUTHDATA_CONTEXT);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_TGS_REQ_AD_SESSKEY))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_TGS_REQ_AD_SESSKEY = `enum KRB5_KEYUSAGE_TGS_REQ_AD_SESSKEY = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_TGS_REQ_AD_SESSKEY); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_TGS_REQ_AD_SESSKEY);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_AS_REP_ENCPART))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_AS_REP_ENCPART = `enum KRB5_KEYUSAGE_AS_REP_ENCPART = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_AS_REP_ENCPART); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_AS_REP_ENCPART);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_KDC_REP_TICKET))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_KDC_REP_TICKET = `enum KRB5_KEYUSAGE_KDC_REP_TICKET = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_KDC_REP_TICKET); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_KDC_REP_TICKET);
        }
    }




    static if(!is(typeof(ERROR_TABLE_BASE_kv5m))) {
        private enum enumMixinStr_ERROR_TABLE_BASE_kv5m = `enum ERROR_TABLE_BASE_kv5m = ( - 1760647424L );`;
        static if(is(typeof({ mixin(enumMixinStr_ERROR_TABLE_BASE_kv5m); }))) {
            mixin(enumMixinStr_ERROR_TABLE_BASE_kv5m);
        }
    }




    static if(!is(typeof(init_kv5m_err_tbl))) {
        private enum enumMixinStr_init_kv5m_err_tbl = `enum init_kv5m_err_tbl = initialize_kv5m_error_table;`;
        static if(is(typeof({ mixin(enumMixinStr_init_kv5m_err_tbl); }))) {
            mixin(enumMixinStr_init_kv5m_err_tbl);
        }
    }




    static if(!is(typeof(kv5m_err_base))) {
        private enum enumMixinStr_kv5m_err_base = `enum kv5m_err_base = ( - 1760647424L );`;
        static if(is(typeof({ mixin(enumMixinStr_kv5m_err_base); }))) {
            mixin(enumMixinStr_kv5m_err_base);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_AS_REQ_PA_ENC_TS))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_AS_REQ_PA_ENC_TS = `enum KRB5_KEYUSAGE_AS_REQ_PA_ENC_TS = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_AS_REQ_PA_ENC_TS); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_AS_REQ_PA_ENC_TS);
        }
    }




    static if(!is(typeof(KRB524_BADKEY))) {
        private enum enumMixinStr_KRB524_BADKEY = `enum KRB524_BADKEY = ( - 1750206208L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB524_BADKEY); }))) {
            mixin(enumMixinStr_KRB524_BADKEY);
        }
    }




    static if(!is(typeof(KRB524_BADADDR))) {
        private enum enumMixinStr_KRB524_BADADDR = `enum KRB524_BADADDR = ( - 1750206207L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB524_BADADDR); }))) {
            mixin(enumMixinStr_KRB524_BADADDR);
        }
    }




    static if(!is(typeof(KRB524_BADPRINC))) {
        private enum enumMixinStr_KRB524_BADPRINC = `enum KRB524_BADPRINC = ( - 1750206206L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB524_BADPRINC); }))) {
            mixin(enumMixinStr_KRB524_BADPRINC);
        }
    }




    static if(!is(typeof(KRB524_BADREALM))) {
        private enum enumMixinStr_KRB524_BADREALM = `enum KRB524_BADREALM = ( - 1750206205L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB524_BADREALM); }))) {
            mixin(enumMixinStr_KRB524_BADREALM);
        }
    }




    static if(!is(typeof(KRB524_V4ERR))) {
        private enum enumMixinStr_KRB524_V4ERR = `enum KRB524_V4ERR = ( - 1750206204L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB524_V4ERR); }))) {
            mixin(enumMixinStr_KRB524_V4ERR);
        }
    }




    static if(!is(typeof(KRB524_ENCFULL))) {
        private enum enumMixinStr_KRB524_ENCFULL = `enum KRB524_ENCFULL = ( - 1750206203L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB524_ENCFULL); }))) {
            mixin(enumMixinStr_KRB524_ENCFULL);
        }
    }




    static if(!is(typeof(KRB524_DECEMPTY))) {
        private enum enumMixinStr_KRB524_DECEMPTY = `enum KRB524_DECEMPTY = ( - 1750206202L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB524_DECEMPTY); }))) {
            mixin(enumMixinStr_KRB524_DECEMPTY);
        }
    }




    static if(!is(typeof(KRB524_NOTRESP))) {
        private enum enumMixinStr_KRB524_NOTRESP = `enum KRB524_NOTRESP = ( - 1750206201L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB524_NOTRESP); }))) {
            mixin(enumMixinStr_KRB524_NOTRESP);
        }
    }




    static if(!is(typeof(KRB524_KRB4_DISABLED))) {
        private enum enumMixinStr_KRB524_KRB4_DISABLED = `enum KRB524_KRB4_DISABLED = ( - 1750206200L );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB524_KRB4_DISABLED); }))) {
            mixin(enumMixinStr_KRB524_KRB4_DISABLED);
        }
    }
    static if(!is(typeof(ERROR_TABLE_BASE_k524))) {
        private enum enumMixinStr_ERROR_TABLE_BASE_k524 = `enum ERROR_TABLE_BASE_k524 = ( - 1750206208L );`;
        static if(is(typeof({ mixin(enumMixinStr_ERROR_TABLE_BASE_k524); }))) {
            mixin(enumMixinStr_ERROR_TABLE_BASE_k524);
        }
    }




    static if(!is(typeof(init_k524_err_tbl))) {
        private enum enumMixinStr_init_k524_err_tbl = `enum init_k524_err_tbl = initialize_k524_error_table;`;
        static if(is(typeof({ mixin(enumMixinStr_init_k524_err_tbl); }))) {
            mixin(enumMixinStr_init_k524_err_tbl);
        }
    }




    static if(!is(typeof(k524_err_base))) {
        private enum enumMixinStr_k524_err_base = `enum k524_err_base = ( - 1750206208L );`;
        static if(is(typeof({ mixin(enumMixinStr_k524_err_base); }))) {
            mixin(enumMixinStr_k524_err_base);
        }
    }




    static if(!is(typeof(CKSUMTYPE_HMAC_MD5_ARCFOUR))) {
        private enum enumMixinStr_CKSUMTYPE_HMAC_MD5_ARCFOUR = `enum CKSUMTYPE_HMAC_MD5_ARCFOUR = - 138;`;
        static if(is(typeof({ mixin(enumMixinStr_CKSUMTYPE_HMAC_MD5_ARCFOUR); }))) {
            mixin(enumMixinStr_CKSUMTYPE_HMAC_MD5_ARCFOUR);
        }
    }




    static if(!is(typeof(ASN1_BAD_TIMEFORMAT))) {
        private enum enumMixinStr_ASN1_BAD_TIMEFORMAT = `enum ASN1_BAD_TIMEFORMAT = ( 1859794432L );`;
        static if(is(typeof({ mixin(enumMixinStr_ASN1_BAD_TIMEFORMAT); }))) {
            mixin(enumMixinStr_ASN1_BAD_TIMEFORMAT);
        }
    }




    static if(!is(typeof(ASN1_MISSING_FIELD))) {
        private enum enumMixinStr_ASN1_MISSING_FIELD = `enum ASN1_MISSING_FIELD = ( 1859794433L );`;
        static if(is(typeof({ mixin(enumMixinStr_ASN1_MISSING_FIELD); }))) {
            mixin(enumMixinStr_ASN1_MISSING_FIELD);
        }
    }




    static if(!is(typeof(ASN1_MISPLACED_FIELD))) {
        private enum enumMixinStr_ASN1_MISPLACED_FIELD = `enum ASN1_MISPLACED_FIELD = ( 1859794434L );`;
        static if(is(typeof({ mixin(enumMixinStr_ASN1_MISPLACED_FIELD); }))) {
            mixin(enumMixinStr_ASN1_MISPLACED_FIELD);
        }
    }




    static if(!is(typeof(ASN1_TYPE_MISMATCH))) {
        private enum enumMixinStr_ASN1_TYPE_MISMATCH = `enum ASN1_TYPE_MISMATCH = ( 1859794435L );`;
        static if(is(typeof({ mixin(enumMixinStr_ASN1_TYPE_MISMATCH); }))) {
            mixin(enumMixinStr_ASN1_TYPE_MISMATCH);
        }
    }




    static if(!is(typeof(ASN1_OVERFLOW))) {
        private enum enumMixinStr_ASN1_OVERFLOW = `enum ASN1_OVERFLOW = ( 1859794436L );`;
        static if(is(typeof({ mixin(enumMixinStr_ASN1_OVERFLOW); }))) {
            mixin(enumMixinStr_ASN1_OVERFLOW);
        }
    }




    static if(!is(typeof(ASN1_OVERRUN))) {
        private enum enumMixinStr_ASN1_OVERRUN = `enum ASN1_OVERRUN = ( 1859794437L );`;
        static if(is(typeof({ mixin(enumMixinStr_ASN1_OVERRUN); }))) {
            mixin(enumMixinStr_ASN1_OVERRUN);
        }
    }




    static if(!is(typeof(ASN1_BAD_ID))) {
        private enum enumMixinStr_ASN1_BAD_ID = `enum ASN1_BAD_ID = ( 1859794438L );`;
        static if(is(typeof({ mixin(enumMixinStr_ASN1_BAD_ID); }))) {
            mixin(enumMixinStr_ASN1_BAD_ID);
        }
    }




    static if(!is(typeof(ASN1_BAD_LENGTH))) {
        private enum enumMixinStr_ASN1_BAD_LENGTH = `enum ASN1_BAD_LENGTH = ( 1859794439L );`;
        static if(is(typeof({ mixin(enumMixinStr_ASN1_BAD_LENGTH); }))) {
            mixin(enumMixinStr_ASN1_BAD_LENGTH);
        }
    }




    static if(!is(typeof(ASN1_BAD_FORMAT))) {
        private enum enumMixinStr_ASN1_BAD_FORMAT = `enum ASN1_BAD_FORMAT = ( 1859794440L );`;
        static if(is(typeof({ mixin(enumMixinStr_ASN1_BAD_FORMAT); }))) {
            mixin(enumMixinStr_ASN1_BAD_FORMAT);
        }
    }




    static if(!is(typeof(ASN1_PARSE_ERROR))) {
        private enum enumMixinStr_ASN1_PARSE_ERROR = `enum ASN1_PARSE_ERROR = ( 1859794441L );`;
        static if(is(typeof({ mixin(enumMixinStr_ASN1_PARSE_ERROR); }))) {
            mixin(enumMixinStr_ASN1_PARSE_ERROR);
        }
    }




    static if(!is(typeof(ASN1_BAD_GMTIME))) {
        private enum enumMixinStr_ASN1_BAD_GMTIME = `enum ASN1_BAD_GMTIME = ( 1859794442L );`;
        static if(is(typeof({ mixin(enumMixinStr_ASN1_BAD_GMTIME); }))) {
            mixin(enumMixinStr_ASN1_BAD_GMTIME);
        }
    }




    static if(!is(typeof(ASN1_MISMATCH_INDEF))) {
        private enum enumMixinStr_ASN1_MISMATCH_INDEF = `enum ASN1_MISMATCH_INDEF = ( 1859794443L );`;
        static if(is(typeof({ mixin(enumMixinStr_ASN1_MISMATCH_INDEF); }))) {
            mixin(enumMixinStr_ASN1_MISMATCH_INDEF);
        }
    }




    static if(!is(typeof(ASN1_MISSING_EOC))) {
        private enum enumMixinStr_ASN1_MISSING_EOC = `enum ASN1_MISSING_EOC = ( 1859794444L );`;
        static if(is(typeof({ mixin(enumMixinStr_ASN1_MISSING_EOC); }))) {
            mixin(enumMixinStr_ASN1_MISSING_EOC);
        }
    }




    static if(!is(typeof(ASN1_OMITTED))) {
        private enum enumMixinStr_ASN1_OMITTED = `enum ASN1_OMITTED = ( 1859794445L );`;
        static if(is(typeof({ mixin(enumMixinStr_ASN1_OMITTED); }))) {
            mixin(enumMixinStr_ASN1_OMITTED);
        }
    }




    static if(!is(typeof(CKSUMTYPE_MD5_HMAC_ARCFOUR))) {
        private enum enumMixinStr_CKSUMTYPE_MD5_HMAC_ARCFOUR = `enum CKSUMTYPE_MD5_HMAC_ARCFOUR = - 137;`;
        static if(is(typeof({ mixin(enumMixinStr_CKSUMTYPE_MD5_HMAC_ARCFOUR); }))) {
            mixin(enumMixinStr_CKSUMTYPE_MD5_HMAC_ARCFOUR);
        }
    }




    static if(!is(typeof(CKSUMTYPE_CMAC_CAMELLIA256))) {
        private enum enumMixinStr_CKSUMTYPE_CMAC_CAMELLIA256 = `enum CKSUMTYPE_CMAC_CAMELLIA256 = 0x0012;`;
        static if(is(typeof({ mixin(enumMixinStr_CKSUMTYPE_CMAC_CAMELLIA256); }))) {
            mixin(enumMixinStr_CKSUMTYPE_CMAC_CAMELLIA256);
        }
    }




    static if(!is(typeof(CKSUMTYPE_CMAC_CAMELLIA128))) {
        private enum enumMixinStr_CKSUMTYPE_CMAC_CAMELLIA128 = `enum CKSUMTYPE_CMAC_CAMELLIA128 = 0x0011;`;
        static if(is(typeof({ mixin(enumMixinStr_CKSUMTYPE_CMAC_CAMELLIA128); }))) {
            mixin(enumMixinStr_CKSUMTYPE_CMAC_CAMELLIA128);
        }
    }




    static if(!is(typeof(ERROR_TABLE_BASE_asn1))) {
        private enum enumMixinStr_ERROR_TABLE_BASE_asn1 = `enum ERROR_TABLE_BASE_asn1 = ( 1859794432L );`;
        static if(is(typeof({ mixin(enumMixinStr_ERROR_TABLE_BASE_asn1); }))) {
            mixin(enumMixinStr_ERROR_TABLE_BASE_asn1);
        }
    }




    static if(!is(typeof(init_asn1_err_tbl))) {
        private enum enumMixinStr_init_asn1_err_tbl = `enum init_asn1_err_tbl = initialize_asn1_error_table;`;
        static if(is(typeof({ mixin(enumMixinStr_init_asn1_err_tbl); }))) {
            mixin(enumMixinStr_init_asn1_err_tbl);
        }
    }




    static if(!is(typeof(asn1_err_base))) {
        private enum enumMixinStr_asn1_err_base = `enum asn1_err_base = ( 1859794432L );`;
        static if(is(typeof({ mixin(enumMixinStr_asn1_err_base); }))) {
            mixin(enumMixinStr_asn1_err_base);
        }
    }




    static if(!is(typeof(_LIBC_LIMITS_H_))) {
        private enum enumMixinStr__LIBC_LIMITS_H_ = `enum _LIBC_LIMITS_H_ = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__LIBC_LIMITS_H_); }))) {
            mixin(enumMixinStr__LIBC_LIMITS_H_);
        }
    }






    static if(!is(typeof(CKSUMTYPE_HMAC_SHA384_192_AES256))) {
        private enum enumMixinStr_CKSUMTYPE_HMAC_SHA384_192_AES256 = `enum CKSUMTYPE_HMAC_SHA384_192_AES256 = 0x0014;`;
        static if(is(typeof({ mixin(enumMixinStr_CKSUMTYPE_HMAC_SHA384_192_AES256); }))) {
            mixin(enumMixinStr_CKSUMTYPE_HMAC_SHA384_192_AES256);
        }
    }




    static if(!is(typeof(MB_LEN_MAX))) {
        private enum enumMixinStr_MB_LEN_MAX = `enum MB_LEN_MAX = 16;`;
        static if(is(typeof({ mixin(enumMixinStr_MB_LEN_MAX); }))) {
            mixin(enumMixinStr_MB_LEN_MAX);
        }
    }




    static if(!is(typeof(CKSUMTYPE_HMAC_SHA256_128_AES128))) {
        private enum enumMixinStr_CKSUMTYPE_HMAC_SHA256_128_AES128 = `enum CKSUMTYPE_HMAC_SHA256_128_AES128 = 0x0013;`;
        static if(is(typeof({ mixin(enumMixinStr_CKSUMTYPE_HMAC_SHA256_128_AES128); }))) {
            mixin(enumMixinStr_CKSUMTYPE_HMAC_SHA256_128_AES128);
        }
    }




    static if(!is(typeof(CKSUMTYPE_HMAC_SHA1_96_AES256))) {
        private enum enumMixinStr_CKSUMTYPE_HMAC_SHA1_96_AES256 = `enum CKSUMTYPE_HMAC_SHA1_96_AES256 = 0x0010;`;
        static if(is(typeof({ mixin(enumMixinStr_CKSUMTYPE_HMAC_SHA1_96_AES256); }))) {
            mixin(enumMixinStr_CKSUMTYPE_HMAC_SHA1_96_AES256);
        }
    }




    static if(!is(typeof(CKSUMTYPE_HMAC_SHA1_96_AES128))) {
        private enum enumMixinStr_CKSUMTYPE_HMAC_SHA1_96_AES128 = `enum CKSUMTYPE_HMAC_SHA1_96_AES128 = 0x000f;`;
        static if(is(typeof({ mixin(enumMixinStr_CKSUMTYPE_HMAC_SHA1_96_AES128); }))) {
            mixin(enumMixinStr_CKSUMTYPE_HMAC_SHA1_96_AES128);
        }
    }




    static if(!is(typeof(CKSUMTYPE_HMAC_SHA1_DES3))) {
        private enum enumMixinStr_CKSUMTYPE_HMAC_SHA1_DES3 = `enum CKSUMTYPE_HMAC_SHA1_DES3 = 0x000c;`;
        static if(is(typeof({ mixin(enumMixinStr_CKSUMTYPE_HMAC_SHA1_DES3); }))) {
            mixin(enumMixinStr_CKSUMTYPE_HMAC_SHA1_DES3);
        }
    }




    static if(!is(typeof(CKSUMTYPE_NIST_SHA))) {
        private enum enumMixinStr_CKSUMTYPE_NIST_SHA = `enum CKSUMTYPE_NIST_SHA = 0x0009;`;
        static if(is(typeof({ mixin(enumMixinStr_CKSUMTYPE_NIST_SHA); }))) {
            mixin(enumMixinStr_CKSUMTYPE_NIST_SHA);
        }
    }




    static if(!is(typeof(CKSUMTYPE_RSA_MD5_DES))) {
        private enum enumMixinStr_CKSUMTYPE_RSA_MD5_DES = `enum CKSUMTYPE_RSA_MD5_DES = 0x0008;`;
        static if(is(typeof({ mixin(enumMixinStr_CKSUMTYPE_RSA_MD5_DES); }))) {
            mixin(enumMixinStr_CKSUMTYPE_RSA_MD5_DES);
        }
    }




    static if(!is(typeof(LLONG_MIN))) {
        private enum enumMixinStr_LLONG_MIN = `enum LLONG_MIN = ( - LLONG_MAX - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_LLONG_MIN); }))) {
            mixin(enumMixinStr_LLONG_MIN);
        }
    }




    static if(!is(typeof(LLONG_MAX))) {
        private enum enumMixinStr_LLONG_MAX = `enum LLONG_MAX = 0x7fffffffffffffffLL;`;
        static if(is(typeof({ mixin(enumMixinStr_LLONG_MAX); }))) {
            mixin(enumMixinStr_LLONG_MAX);
        }
    }




    static if(!is(typeof(ULLONG_MAX))) {
        private enum enumMixinStr_ULLONG_MAX = `enum ULLONG_MAX = ( 0x7fffffffffffffffLL * 2ULL + 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_ULLONG_MAX); }))) {
            mixin(enumMixinStr_ULLONG_MAX);
        }
    }




    static if(!is(typeof(CKSUMTYPE_RSA_MD5))) {
        private enum enumMixinStr_CKSUMTYPE_RSA_MD5 = `enum CKSUMTYPE_RSA_MD5 = 0x0007;`;
        static if(is(typeof({ mixin(enumMixinStr_CKSUMTYPE_RSA_MD5); }))) {
            mixin(enumMixinStr_CKSUMTYPE_RSA_MD5);
        }
    }




    static if(!is(typeof(CKSUMTYPE_DESCBC))) {
        private enum enumMixinStr_CKSUMTYPE_DESCBC = `enum CKSUMTYPE_DESCBC = 0x0004;`;
        static if(is(typeof({ mixin(enumMixinStr_CKSUMTYPE_DESCBC); }))) {
            mixin(enumMixinStr_CKSUMTYPE_DESCBC);
        }
    }




    static if(!is(typeof(CKSUMTYPE_RSA_MD4_DES))) {
        private enum enumMixinStr_CKSUMTYPE_RSA_MD4_DES = `enum CKSUMTYPE_RSA_MD4_DES = 0x0003;`;
        static if(is(typeof({ mixin(enumMixinStr_CKSUMTYPE_RSA_MD4_DES); }))) {
            mixin(enumMixinStr_CKSUMTYPE_RSA_MD4_DES);
        }
    }




    static if(!is(typeof(CKSUMTYPE_RSA_MD4))) {
        private enum enumMixinStr_CKSUMTYPE_RSA_MD4 = `enum CKSUMTYPE_RSA_MD4 = 0x0002;`;
        static if(is(typeof({ mixin(enumMixinStr_CKSUMTYPE_RSA_MD4); }))) {
            mixin(enumMixinStr_CKSUMTYPE_RSA_MD4);
        }
    }




    static if(!is(typeof(CKSUMTYPE_CRC32))) {
        private enum enumMixinStr_CKSUMTYPE_CRC32 = `enum CKSUMTYPE_CRC32 = 0x0001;`;
        static if(is(typeof({ mixin(enumMixinStr_CKSUMTYPE_CRC32); }))) {
            mixin(enumMixinStr_CKSUMTYPE_CRC32);
        }
    }




    static if(!is(typeof(ENCTYPE_UNKNOWN))) {
        private enum enumMixinStr_ENCTYPE_UNKNOWN = `enum ENCTYPE_UNKNOWN = 0x01ff;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_UNKNOWN); }))) {
            mixin(enumMixinStr_ENCTYPE_UNKNOWN);
        }
    }






    static if(!is(typeof(NR_OPEN))) {
        private enum enumMixinStr_NR_OPEN = `enum NR_OPEN = 1024;`;
        static if(is(typeof({ mixin(enumMixinStr_NR_OPEN); }))) {
            mixin(enumMixinStr_NR_OPEN);
        }
    }




    static if(!is(typeof(NGROUPS_MAX))) {
        private enum enumMixinStr_NGROUPS_MAX = `enum NGROUPS_MAX = 65536;`;
        static if(is(typeof({ mixin(enumMixinStr_NGROUPS_MAX); }))) {
            mixin(enumMixinStr_NGROUPS_MAX);
        }
    }




    static if(!is(typeof(ARG_MAX))) {
        private enum enumMixinStr_ARG_MAX = `enum ARG_MAX = 131072;`;
        static if(is(typeof({ mixin(enumMixinStr_ARG_MAX); }))) {
            mixin(enumMixinStr_ARG_MAX);
        }
    }




    static if(!is(typeof(LINK_MAX))) {
        private enum enumMixinStr_LINK_MAX = `enum LINK_MAX = 127;`;
        static if(is(typeof({ mixin(enumMixinStr_LINK_MAX); }))) {
            mixin(enumMixinStr_LINK_MAX);
        }
    }




    static if(!is(typeof(MAX_CANON))) {
        private enum enumMixinStr_MAX_CANON = `enum MAX_CANON = 255;`;
        static if(is(typeof({ mixin(enumMixinStr_MAX_CANON); }))) {
            mixin(enumMixinStr_MAX_CANON);
        }
    }




    static if(!is(typeof(MAX_INPUT))) {
        private enum enumMixinStr_MAX_INPUT = `enum MAX_INPUT = 255;`;
        static if(is(typeof({ mixin(enumMixinStr_MAX_INPUT); }))) {
            mixin(enumMixinStr_MAX_INPUT);
        }
    }




    static if(!is(typeof(NAME_MAX))) {
        private enum enumMixinStr_NAME_MAX = `enum NAME_MAX = 255;`;
        static if(is(typeof({ mixin(enumMixinStr_NAME_MAX); }))) {
            mixin(enumMixinStr_NAME_MAX);
        }
    }




    static if(!is(typeof(PATH_MAX))) {
        private enum enumMixinStr_PATH_MAX = `enum PATH_MAX = 4096;`;
        static if(is(typeof({ mixin(enumMixinStr_PATH_MAX); }))) {
            mixin(enumMixinStr_PATH_MAX);
        }
    }




    static if(!is(typeof(PIPE_BUF))) {
        private enum enumMixinStr_PIPE_BUF = `enum PIPE_BUF = 4096;`;
        static if(is(typeof({ mixin(enumMixinStr_PIPE_BUF); }))) {
            mixin(enumMixinStr_PIPE_BUF);
        }
    }




    static if(!is(typeof(XATTR_NAME_MAX))) {
        private enum enumMixinStr_XATTR_NAME_MAX = `enum XATTR_NAME_MAX = 255;`;
        static if(is(typeof({ mixin(enumMixinStr_XATTR_NAME_MAX); }))) {
            mixin(enumMixinStr_XATTR_NAME_MAX);
        }
    }




    static if(!is(typeof(XATTR_SIZE_MAX))) {
        private enum enumMixinStr_XATTR_SIZE_MAX = `enum XATTR_SIZE_MAX = 65536;`;
        static if(is(typeof({ mixin(enumMixinStr_XATTR_SIZE_MAX); }))) {
            mixin(enumMixinStr_XATTR_SIZE_MAX);
        }
    }




    static if(!is(typeof(XATTR_LIST_MAX))) {
        private enum enumMixinStr_XATTR_LIST_MAX = `enum XATTR_LIST_MAX = 65536;`;
        static if(is(typeof({ mixin(enumMixinStr_XATTR_LIST_MAX); }))) {
            mixin(enumMixinStr_XATTR_LIST_MAX);
        }
    }




    static if(!is(typeof(RTSIG_MAX))) {
        private enum enumMixinStr_RTSIG_MAX = `enum RTSIG_MAX = 32;`;
        static if(is(typeof({ mixin(enumMixinStr_RTSIG_MAX); }))) {
            mixin(enumMixinStr_RTSIG_MAX);
        }
    }




    static if(!is(typeof(_STDC_PREDEF_H))) {
        private enum enumMixinStr__STDC_PREDEF_H = `enum _STDC_PREDEF_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STDC_PREDEF_H); }))) {
            mixin(enumMixinStr__STDC_PREDEF_H);
        }
    }




    static if(!is(typeof(_STDINT_H))) {
        private enum enumMixinStr__STDINT_H = `enum _STDINT_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STDINT_H); }))) {
            mixin(enumMixinStr__STDINT_H);
        }
    }




    static if(!is(typeof(ENCTYPE_CAMELLIA256_CTS_CMAC))) {
        private enum enumMixinStr_ENCTYPE_CAMELLIA256_CTS_CMAC = `enum ENCTYPE_CAMELLIA256_CTS_CMAC = 0x001a;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_CAMELLIA256_CTS_CMAC); }))) {
            mixin(enumMixinStr_ENCTYPE_CAMELLIA256_CTS_CMAC);
        }
    }




    static if(!is(typeof(ENCTYPE_CAMELLIA128_CTS_CMAC))) {
        private enum enumMixinStr_ENCTYPE_CAMELLIA128_CTS_CMAC = `enum ENCTYPE_CAMELLIA128_CTS_CMAC = 0x0019;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_CAMELLIA128_CTS_CMAC); }))) {
            mixin(enumMixinStr_ENCTYPE_CAMELLIA128_CTS_CMAC);
        }
    }




    static if(!is(typeof(ENCTYPE_ARCFOUR_HMAC_EXP))) {
        private enum enumMixinStr_ENCTYPE_ARCFOUR_HMAC_EXP = `enum ENCTYPE_ARCFOUR_HMAC_EXP = 0x0018;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_ARCFOUR_HMAC_EXP); }))) {
            mixin(enumMixinStr_ENCTYPE_ARCFOUR_HMAC_EXP);
        }
    }




    static if(!is(typeof(ENCTYPE_ARCFOUR_HMAC))) {
        private enum enumMixinStr_ENCTYPE_ARCFOUR_HMAC = `enum ENCTYPE_ARCFOUR_HMAC = 0x0017;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_ARCFOUR_HMAC); }))) {
            mixin(enumMixinStr_ENCTYPE_ARCFOUR_HMAC);
        }
    }




    static if(!is(typeof(ENCTYPE_AES256_CTS_HMAC_SHA384_192))) {
        private enum enumMixinStr_ENCTYPE_AES256_CTS_HMAC_SHA384_192 = `enum ENCTYPE_AES256_CTS_HMAC_SHA384_192 = 0x0014;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_AES256_CTS_HMAC_SHA384_192); }))) {
            mixin(enumMixinStr_ENCTYPE_AES256_CTS_HMAC_SHA384_192);
        }
    }




    static if(!is(typeof(ENCTYPE_AES128_CTS_HMAC_SHA256_128))) {
        private enum enumMixinStr_ENCTYPE_AES128_CTS_HMAC_SHA256_128 = `enum ENCTYPE_AES128_CTS_HMAC_SHA256_128 = 0x0013;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_AES128_CTS_HMAC_SHA256_128); }))) {
            mixin(enumMixinStr_ENCTYPE_AES128_CTS_HMAC_SHA256_128);
        }
    }




    static if(!is(typeof(ENCTYPE_AES256_CTS_HMAC_SHA1_96))) {
        private enum enumMixinStr_ENCTYPE_AES256_CTS_HMAC_SHA1_96 = `enum ENCTYPE_AES256_CTS_HMAC_SHA1_96 = 0x0012;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_AES256_CTS_HMAC_SHA1_96); }))) {
            mixin(enumMixinStr_ENCTYPE_AES256_CTS_HMAC_SHA1_96);
        }
    }




    static if(!is(typeof(ENCTYPE_AES128_CTS_HMAC_SHA1_96))) {
        private enum enumMixinStr_ENCTYPE_AES128_CTS_HMAC_SHA1_96 = `enum ENCTYPE_AES128_CTS_HMAC_SHA1_96 = 0x0011;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_AES128_CTS_HMAC_SHA1_96); }))) {
            mixin(enumMixinStr_ENCTYPE_AES128_CTS_HMAC_SHA1_96);
        }
    }




    static if(!is(typeof(ENCTYPE_DES3_CBC_SHA1))) {
        private enum enumMixinStr_ENCTYPE_DES3_CBC_SHA1 = `enum ENCTYPE_DES3_CBC_SHA1 = 0x0010;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_DES3_CBC_SHA1); }))) {
            mixin(enumMixinStr_ENCTYPE_DES3_CBC_SHA1);
        }
    }




    static if(!is(typeof(ENCTYPE_DES3_CBC_ENV))) {
        private enum enumMixinStr_ENCTYPE_DES3_CBC_ENV = `enum ENCTYPE_DES3_CBC_ENV = 0x000f;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_DES3_CBC_ENV); }))) {
            mixin(enumMixinStr_ENCTYPE_DES3_CBC_ENV);
        }
    }




    static if(!is(typeof(ENCTYPE_RSA_ES_OAEP_ENV))) {
        private enum enumMixinStr_ENCTYPE_RSA_ES_OAEP_ENV = `enum ENCTYPE_RSA_ES_OAEP_ENV = 0x000e;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_RSA_ES_OAEP_ENV); }))) {
            mixin(enumMixinStr_ENCTYPE_RSA_ES_OAEP_ENV);
        }
    }




    static if(!is(typeof(ENCTYPE_RSA_ENV))) {
        private enum enumMixinStr_ENCTYPE_RSA_ENV = `enum ENCTYPE_RSA_ENV = 0x000d;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_RSA_ENV); }))) {
            mixin(enumMixinStr_ENCTYPE_RSA_ENV);
        }
    }




    static if(!is(typeof(ENCTYPE_RC2_CBC_ENV))) {
        private enum enumMixinStr_ENCTYPE_RC2_CBC_ENV = `enum ENCTYPE_RC2_CBC_ENV = 0x000c;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_RC2_CBC_ENV); }))) {
            mixin(enumMixinStr_ENCTYPE_RC2_CBC_ENV);
        }
    }




    static if(!is(typeof(ENCTYPE_SHA1_RSA_CMS))) {
        private enum enumMixinStr_ENCTYPE_SHA1_RSA_CMS = `enum ENCTYPE_SHA1_RSA_CMS = 0x000b;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_SHA1_RSA_CMS); }))) {
            mixin(enumMixinStr_ENCTYPE_SHA1_RSA_CMS);
        }
    }




    static if(!is(typeof(ENCTYPE_MD5_RSA_CMS))) {
        private enum enumMixinStr_ENCTYPE_MD5_RSA_CMS = `enum ENCTYPE_MD5_RSA_CMS = 0x000a;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_MD5_RSA_CMS); }))) {
            mixin(enumMixinStr_ENCTYPE_MD5_RSA_CMS);
        }
    }




    static if(!is(typeof(ENCTYPE_DSA_SHA1_CMS))) {
        private enum enumMixinStr_ENCTYPE_DSA_SHA1_CMS = `enum ENCTYPE_DSA_SHA1_CMS = 0x0009;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_DSA_SHA1_CMS); }))) {
            mixin(enumMixinStr_ENCTYPE_DSA_SHA1_CMS);
        }
    }




    static if(!is(typeof(ENCTYPE_DES_HMAC_SHA1))) {
        private enum enumMixinStr_ENCTYPE_DES_HMAC_SHA1 = `enum ENCTYPE_DES_HMAC_SHA1 = 0x0008;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_DES_HMAC_SHA1); }))) {
            mixin(enumMixinStr_ENCTYPE_DES_HMAC_SHA1);
        }
    }




    static if(!is(typeof(ENCTYPE_DES3_CBC_RAW))) {
        private enum enumMixinStr_ENCTYPE_DES3_CBC_RAW = `enum ENCTYPE_DES3_CBC_RAW = 0x0006;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_DES3_CBC_RAW); }))) {
            mixin(enumMixinStr_ENCTYPE_DES3_CBC_RAW);
        }
    }




    static if(!is(typeof(ENCTYPE_DES3_CBC_SHA))) {
        private enum enumMixinStr_ENCTYPE_DES3_CBC_SHA = `enum ENCTYPE_DES3_CBC_SHA = 0x0005;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_DES3_CBC_SHA); }))) {
            mixin(enumMixinStr_ENCTYPE_DES3_CBC_SHA);
        }
    }




    static if(!is(typeof(ENCTYPE_DES_CBC_RAW))) {
        private enum enumMixinStr_ENCTYPE_DES_CBC_RAW = `enum ENCTYPE_DES_CBC_RAW = 0x0004;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_DES_CBC_RAW); }))) {
            mixin(enumMixinStr_ENCTYPE_DES_CBC_RAW);
        }
    }




    static if(!is(typeof(ENCTYPE_DES_CBC_MD5))) {
        private enum enumMixinStr_ENCTYPE_DES_CBC_MD5 = `enum ENCTYPE_DES_CBC_MD5 = 0x0003;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_DES_CBC_MD5); }))) {
            mixin(enumMixinStr_ENCTYPE_DES_CBC_MD5);
        }
    }




    static if(!is(typeof(ENCTYPE_DES_CBC_MD4))) {
        private enum enumMixinStr_ENCTYPE_DES_CBC_MD4 = `enum ENCTYPE_DES_CBC_MD4 = 0x0002;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_DES_CBC_MD4); }))) {
            mixin(enumMixinStr_ENCTYPE_DES_CBC_MD4);
        }
    }




    static if(!is(typeof(ENCTYPE_DES_CBC_CRC))) {
        private enum enumMixinStr_ENCTYPE_DES_CBC_CRC = `enum ENCTYPE_DES_CBC_CRC = 0x0001;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_DES_CBC_CRC); }))) {
            mixin(enumMixinStr_ENCTYPE_DES_CBC_CRC);
        }
    }




    static if(!is(typeof(ENCTYPE_NULL))) {
        private enum enumMixinStr_ENCTYPE_NULL = `enum ENCTYPE_NULL = 0x0000;`;
        static if(is(typeof({ mixin(enumMixinStr_ENCTYPE_NULL); }))) {
            mixin(enumMixinStr_ENCTYPE_NULL);
        }
    }






    static if(!is(typeof(ADDRTYPE_IPPORT))) {
        private enum enumMixinStr_ADDRTYPE_IPPORT = `enum ADDRTYPE_IPPORT = 0x0101;`;
        static if(is(typeof({ mixin(enumMixinStr_ADDRTYPE_IPPORT); }))) {
            mixin(enumMixinStr_ADDRTYPE_IPPORT);
        }
    }




    static if(!is(typeof(ADDRTYPE_ADDRPORT))) {
        private enum enumMixinStr_ADDRTYPE_ADDRPORT = `enum ADDRTYPE_ADDRPORT = 0x0100;`;
        static if(is(typeof({ mixin(enumMixinStr_ADDRTYPE_ADDRPORT); }))) {
            mixin(enumMixinStr_ADDRTYPE_ADDRPORT);
        }
    }




    static if(!is(typeof(ADDRTYPE_INET6))) {
        private enum enumMixinStr_ADDRTYPE_INET6 = `enum ADDRTYPE_INET6 = 0x0018;`;
        static if(is(typeof({ mixin(enumMixinStr_ADDRTYPE_INET6); }))) {
            mixin(enumMixinStr_ADDRTYPE_INET6);
        }
    }




    static if(!is(typeof(ADDRTYPE_NETBIOS))) {
        private enum enumMixinStr_ADDRTYPE_NETBIOS = `enum ADDRTYPE_NETBIOS = 0x0014;`;
        static if(is(typeof({ mixin(enumMixinStr_ADDRTYPE_NETBIOS); }))) {
            mixin(enumMixinStr_ADDRTYPE_NETBIOS);
        }
    }




    static if(!is(typeof(ADDRTYPE_DDP))) {
        private enum enumMixinStr_ADDRTYPE_DDP = `enum ADDRTYPE_DDP = 0x0010;`;
        static if(is(typeof({ mixin(enumMixinStr_ADDRTYPE_DDP); }))) {
            mixin(enumMixinStr_ADDRTYPE_DDP);
        }
    }
    static if(!is(typeof(INT8_MIN))) {
        private enum enumMixinStr_INT8_MIN = `enum INT8_MIN = ( - 128 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT8_MIN); }))) {
            mixin(enumMixinStr_INT8_MIN);
        }
    }




    static if(!is(typeof(INT16_MIN))) {
        private enum enumMixinStr_INT16_MIN = `enum INT16_MIN = ( - 32767 - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT16_MIN); }))) {
            mixin(enumMixinStr_INT16_MIN);
        }
    }




    static if(!is(typeof(INT32_MIN))) {
        private enum enumMixinStr_INT32_MIN = `enum INT32_MIN = ( - 2147483647 - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT32_MIN); }))) {
            mixin(enumMixinStr_INT32_MIN);
        }
    }




    static if(!is(typeof(INT64_MIN))) {
        private enum enumMixinStr_INT64_MIN = `enum INT64_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT64_MIN); }))) {
            mixin(enumMixinStr_INT64_MIN);
        }
    }




    static if(!is(typeof(INT8_MAX))) {
        private enum enumMixinStr_INT8_MAX = `enum INT8_MAX = ( 127 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT8_MAX); }))) {
            mixin(enumMixinStr_INT8_MAX);
        }
    }




    static if(!is(typeof(INT16_MAX))) {
        private enum enumMixinStr_INT16_MAX = `enum INT16_MAX = ( 32767 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT16_MAX); }))) {
            mixin(enumMixinStr_INT16_MAX);
        }
    }




    static if(!is(typeof(INT32_MAX))) {
        private enum enumMixinStr_INT32_MAX = `enum INT32_MAX = ( 2147483647 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT32_MAX); }))) {
            mixin(enumMixinStr_INT32_MAX);
        }
    }




    static if(!is(typeof(INT64_MAX))) {
        private enum enumMixinStr_INT64_MAX = `enum INT64_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INT64_MAX); }))) {
            mixin(enumMixinStr_INT64_MAX);
        }
    }




    static if(!is(typeof(UINT8_MAX))) {
        private enum enumMixinStr_UINT8_MAX = `enum UINT8_MAX = ( 255 );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT8_MAX); }))) {
            mixin(enumMixinStr_UINT8_MAX);
        }
    }




    static if(!is(typeof(UINT16_MAX))) {
        private enum enumMixinStr_UINT16_MAX = `enum UINT16_MAX = ( 65535 );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT16_MAX); }))) {
            mixin(enumMixinStr_UINT16_MAX);
        }
    }




    static if(!is(typeof(UINT32_MAX))) {
        private enum enumMixinStr_UINT32_MAX = `enum UINT32_MAX = ( 4294967295U );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT32_MAX); }))) {
            mixin(enumMixinStr_UINT32_MAX);
        }
    }




    static if(!is(typeof(UINT64_MAX))) {
        private enum enumMixinStr_UINT64_MAX = `enum UINT64_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT64_MAX); }))) {
            mixin(enumMixinStr_UINT64_MAX);
        }
    }




    static if(!is(typeof(INT_LEAST8_MIN))) {
        private enum enumMixinStr_INT_LEAST8_MIN = `enum INT_LEAST8_MIN = ( - 128 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST8_MIN); }))) {
            mixin(enumMixinStr_INT_LEAST8_MIN);
        }
    }




    static if(!is(typeof(INT_LEAST16_MIN))) {
        private enum enumMixinStr_INT_LEAST16_MIN = `enum INT_LEAST16_MIN = ( - 32767 - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST16_MIN); }))) {
            mixin(enumMixinStr_INT_LEAST16_MIN);
        }
    }




    static if(!is(typeof(INT_LEAST32_MIN))) {
        private enum enumMixinStr_INT_LEAST32_MIN = `enum INT_LEAST32_MIN = ( - 2147483647 - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST32_MIN); }))) {
            mixin(enumMixinStr_INT_LEAST32_MIN);
        }
    }




    static if(!is(typeof(INT_LEAST64_MIN))) {
        private enum enumMixinStr_INT_LEAST64_MIN = `enum INT_LEAST64_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST64_MIN); }))) {
            mixin(enumMixinStr_INT_LEAST64_MIN);
        }
    }




    static if(!is(typeof(INT_LEAST8_MAX))) {
        private enum enumMixinStr_INT_LEAST8_MAX = `enum INT_LEAST8_MAX = ( 127 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST8_MAX); }))) {
            mixin(enumMixinStr_INT_LEAST8_MAX);
        }
    }




    static if(!is(typeof(INT_LEAST16_MAX))) {
        private enum enumMixinStr_INT_LEAST16_MAX = `enum INT_LEAST16_MAX = ( 32767 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST16_MAX); }))) {
            mixin(enumMixinStr_INT_LEAST16_MAX);
        }
    }




    static if(!is(typeof(INT_LEAST32_MAX))) {
        private enum enumMixinStr_INT_LEAST32_MAX = `enum INT_LEAST32_MAX = ( 2147483647 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST32_MAX); }))) {
            mixin(enumMixinStr_INT_LEAST32_MAX);
        }
    }




    static if(!is(typeof(INT_LEAST64_MAX))) {
        private enum enumMixinStr_INT_LEAST64_MAX = `enum INT_LEAST64_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_LEAST64_MAX); }))) {
            mixin(enumMixinStr_INT_LEAST64_MAX);
        }
    }




    static if(!is(typeof(UINT_LEAST8_MAX))) {
        private enum enumMixinStr_UINT_LEAST8_MAX = `enum UINT_LEAST8_MAX = ( 255 );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_LEAST8_MAX); }))) {
            mixin(enumMixinStr_UINT_LEAST8_MAX);
        }
    }




    static if(!is(typeof(UINT_LEAST16_MAX))) {
        private enum enumMixinStr_UINT_LEAST16_MAX = `enum UINT_LEAST16_MAX = ( 65535 );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_LEAST16_MAX); }))) {
            mixin(enumMixinStr_UINT_LEAST16_MAX);
        }
    }




    static if(!is(typeof(UINT_LEAST32_MAX))) {
        private enum enumMixinStr_UINT_LEAST32_MAX = `enum UINT_LEAST32_MAX = ( 4294967295U );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_LEAST32_MAX); }))) {
            mixin(enumMixinStr_UINT_LEAST32_MAX);
        }
    }




    static if(!is(typeof(UINT_LEAST64_MAX))) {
        private enum enumMixinStr_UINT_LEAST64_MAX = `enum UINT_LEAST64_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_LEAST64_MAX); }))) {
            mixin(enumMixinStr_UINT_LEAST64_MAX);
        }
    }




    static if(!is(typeof(INT_FAST8_MIN))) {
        private enum enumMixinStr_INT_FAST8_MIN = `enum INT_FAST8_MIN = ( - 128 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST8_MIN); }))) {
            mixin(enumMixinStr_INT_FAST8_MIN);
        }
    }




    static if(!is(typeof(ADDRTYPE_ISO))) {
        private enum enumMixinStr_ADDRTYPE_ISO = `enum ADDRTYPE_ISO = 0x0007;`;
        static if(is(typeof({ mixin(enumMixinStr_ADDRTYPE_ISO); }))) {
            mixin(enumMixinStr_ADDRTYPE_ISO);
        }
    }




    static if(!is(typeof(INT_FAST16_MIN))) {
        private enum enumMixinStr_INT_FAST16_MIN = `enum INT_FAST16_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST16_MIN); }))) {
            mixin(enumMixinStr_INT_FAST16_MIN);
        }
    }




    static if(!is(typeof(INT_FAST32_MIN))) {
        private enum enumMixinStr_INT_FAST32_MIN = `enum INT_FAST32_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST32_MIN); }))) {
            mixin(enumMixinStr_INT_FAST32_MIN);
        }
    }




    static if(!is(typeof(INT_FAST64_MIN))) {
        private enum enumMixinStr_INT_FAST64_MIN = `enum INT_FAST64_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST64_MIN); }))) {
            mixin(enumMixinStr_INT_FAST64_MIN);
        }
    }




    static if(!is(typeof(INT_FAST8_MAX))) {
        private enum enumMixinStr_INT_FAST8_MAX = `enum INT_FAST8_MAX = ( 127 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST8_MAX); }))) {
            mixin(enumMixinStr_INT_FAST8_MAX);
        }
    }




    static if(!is(typeof(ADDRTYPE_XNS))) {
        private enum enumMixinStr_ADDRTYPE_XNS = `enum ADDRTYPE_XNS = 0x0006;`;
        static if(is(typeof({ mixin(enumMixinStr_ADDRTYPE_XNS); }))) {
            mixin(enumMixinStr_ADDRTYPE_XNS);
        }
    }




    static if(!is(typeof(INT_FAST16_MAX))) {
        private enum enumMixinStr_INT_FAST16_MAX = `enum INT_FAST16_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST16_MAX); }))) {
            mixin(enumMixinStr_INT_FAST16_MAX);
        }
    }




    static if(!is(typeof(INT_FAST32_MAX))) {
        private enum enumMixinStr_INT_FAST32_MAX = `enum INT_FAST32_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST32_MAX); }))) {
            mixin(enumMixinStr_INT_FAST32_MAX);
        }
    }




    static if(!is(typeof(INT_FAST64_MAX))) {
        private enum enumMixinStr_INT_FAST64_MAX = `enum INT_FAST64_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_FAST64_MAX); }))) {
            mixin(enumMixinStr_INT_FAST64_MAX);
        }
    }




    static if(!is(typeof(UINT_FAST8_MAX))) {
        private enum enumMixinStr_UINT_FAST8_MAX = `enum UINT_FAST8_MAX = ( 255 );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_FAST8_MAX); }))) {
            mixin(enumMixinStr_UINT_FAST8_MAX);
        }
    }




    static if(!is(typeof(ADDRTYPE_CHAOS))) {
        private enum enumMixinStr_ADDRTYPE_CHAOS = `enum ADDRTYPE_CHAOS = 0x0005;`;
        static if(is(typeof({ mixin(enumMixinStr_ADDRTYPE_CHAOS); }))) {
            mixin(enumMixinStr_ADDRTYPE_CHAOS);
        }
    }




    static if(!is(typeof(UINT_FAST16_MAX))) {
        private enum enumMixinStr_UINT_FAST16_MAX = `enum UINT_FAST16_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_FAST16_MAX); }))) {
            mixin(enumMixinStr_UINT_FAST16_MAX);
        }
    }




    static if(!is(typeof(UINT_FAST32_MAX))) {
        private enum enumMixinStr_UINT_FAST32_MAX = `enum UINT_FAST32_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_FAST32_MAX); }))) {
            mixin(enumMixinStr_UINT_FAST32_MAX);
        }
    }




    static if(!is(typeof(UINT_FAST64_MAX))) {
        private enum enumMixinStr_UINT_FAST64_MAX = `enum UINT_FAST64_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_FAST64_MAX); }))) {
            mixin(enumMixinStr_UINT_FAST64_MAX);
        }
    }




    static if(!is(typeof(ADDRTYPE_INET))) {
        private enum enumMixinStr_ADDRTYPE_INET = `enum ADDRTYPE_INET = 0x0002;`;
        static if(is(typeof({ mixin(enumMixinStr_ADDRTYPE_INET); }))) {
            mixin(enumMixinStr_ADDRTYPE_INET);
        }
    }




    static if(!is(typeof(INTPTR_MIN))) {
        private enum enumMixinStr_INTPTR_MIN = `enum INTPTR_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INTPTR_MIN); }))) {
            mixin(enumMixinStr_INTPTR_MIN);
        }
    }




    static if(!is(typeof(INTPTR_MAX))) {
        private enum enumMixinStr_INTPTR_MAX = `enum INTPTR_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INTPTR_MAX); }))) {
            mixin(enumMixinStr_INTPTR_MAX);
        }
    }




    static if(!is(typeof(UINTPTR_MAX))) {
        private enum enumMixinStr_UINTPTR_MAX = `enum UINTPTR_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINTPTR_MAX); }))) {
            mixin(enumMixinStr_UINTPTR_MAX);
        }
    }




    static if(!is(typeof(INTMAX_MIN))) {
        private enum enumMixinStr_INTMAX_MIN = `enum INTMAX_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INTMAX_MIN); }))) {
            mixin(enumMixinStr_INTMAX_MIN);
        }
    }




    static if(!is(typeof(INTMAX_MAX))) {
        private enum enumMixinStr_INTMAX_MAX = `enum INTMAX_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_INTMAX_MAX); }))) {
            mixin(enumMixinStr_INTMAX_MAX);
        }
    }




    static if(!is(typeof(UINTMAX_MAX))) {
        private enum enumMixinStr_UINTMAX_MAX = `enum UINTMAX_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_UINTMAX_MAX); }))) {
            mixin(enumMixinStr_UINTMAX_MAX);
        }
    }




    static if(!is(typeof(KRB5_ANONYMOUS_PRINCSTR))) {
        private enum enumMixinStr_KRB5_ANONYMOUS_PRINCSTR = `enum KRB5_ANONYMOUS_PRINCSTR = "ANONYMOUS";`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_ANONYMOUS_PRINCSTR); }))) {
            mixin(enumMixinStr_KRB5_ANONYMOUS_PRINCSTR);
        }
    }




    static if(!is(typeof(PTRDIFF_MIN))) {
        private enum enumMixinStr_PTRDIFF_MIN = `enum PTRDIFF_MIN = ( - 9223372036854775807L - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_PTRDIFF_MIN); }))) {
            mixin(enumMixinStr_PTRDIFF_MIN);
        }
    }




    static if(!is(typeof(PTRDIFF_MAX))) {
        private enum enumMixinStr_PTRDIFF_MAX = `enum PTRDIFF_MAX = ( 9223372036854775807L );`;
        static if(is(typeof({ mixin(enumMixinStr_PTRDIFF_MAX); }))) {
            mixin(enumMixinStr_PTRDIFF_MAX);
        }
    }




    static if(!is(typeof(SIG_ATOMIC_MIN))) {
        private enum enumMixinStr_SIG_ATOMIC_MIN = `enum SIG_ATOMIC_MIN = ( - 2147483647 - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_SIG_ATOMIC_MIN); }))) {
            mixin(enumMixinStr_SIG_ATOMIC_MIN);
        }
    }




    static if(!is(typeof(SIG_ATOMIC_MAX))) {
        private enum enumMixinStr_SIG_ATOMIC_MAX = `enum SIG_ATOMIC_MAX = ( 2147483647 );`;
        static if(is(typeof({ mixin(enumMixinStr_SIG_ATOMIC_MAX); }))) {
            mixin(enumMixinStr_SIG_ATOMIC_MAX);
        }
    }




    static if(!is(typeof(KRB5_ANONYMOUS_REALMSTR))) {
        private enum enumMixinStr_KRB5_ANONYMOUS_REALMSTR = `enum KRB5_ANONYMOUS_REALMSTR = "WELLKNOWN:ANONYMOUS";`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_ANONYMOUS_REALMSTR); }))) {
            mixin(enumMixinStr_KRB5_ANONYMOUS_REALMSTR);
        }
    }




    static if(!is(typeof(SIZE_MAX))) {
        private enum enumMixinStr_SIZE_MAX = `enum SIZE_MAX = ( 18446744073709551615UL );`;
        static if(is(typeof({ mixin(enumMixinStr_SIZE_MAX); }))) {
            mixin(enumMixinStr_SIZE_MAX);
        }
    }




    static if(!is(typeof(WCHAR_MIN))) {
        private enum enumMixinStr_WCHAR_MIN = `enum WCHAR_MIN = __WCHAR_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr_WCHAR_MIN); }))) {
            mixin(enumMixinStr_WCHAR_MIN);
        }
    }




    static if(!is(typeof(WCHAR_MAX))) {
        private enum enumMixinStr_WCHAR_MAX = `enum WCHAR_MAX = __WCHAR_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_WCHAR_MAX); }))) {
            mixin(enumMixinStr_WCHAR_MAX);
        }
    }




    static if(!is(typeof(WINT_MIN))) {
        private enum enumMixinStr_WINT_MIN = `enum WINT_MIN = ( 0u );`;
        static if(is(typeof({ mixin(enumMixinStr_WINT_MIN); }))) {
            mixin(enumMixinStr_WINT_MIN);
        }
    }




    static if(!is(typeof(WINT_MAX))) {
        private enum enumMixinStr_WINT_MAX = `enum WINT_MAX = ( 4294967295u );`;
        static if(is(typeof({ mixin(enumMixinStr_WINT_MAX); }))) {
            mixin(enumMixinStr_WINT_MAX);
        }
    }
    static if(!is(typeof(KRB5_REFERRAL_REALM))) {
        private enum enumMixinStr_KRB5_REFERRAL_REALM = `enum KRB5_REFERRAL_REALM = "";`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_REFERRAL_REALM); }))) {
            mixin(enumMixinStr_KRB5_REFERRAL_REALM);
        }
    }
    static if(!is(typeof(_STDIO_H))) {
        private enum enumMixinStr__STDIO_H = `enum _STDIO_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STDIO_H); }))) {
            mixin(enumMixinStr__STDIO_H);
        }
    }
    static if(!is(typeof(KRB5_NT_ENT_PRINCIPAL_AND_ID))) {
        private enum enumMixinStr_KRB5_NT_ENT_PRINCIPAL_AND_ID = `enum KRB5_NT_ENT_PRINCIPAL_AND_ID = - 130;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NT_ENT_PRINCIPAL_AND_ID); }))) {
            mixin(enumMixinStr_KRB5_NT_ENT_PRINCIPAL_AND_ID);
        }
    }




    static if(!is(typeof(KRB5_NT_MS_PRINCIPAL_AND_ID))) {
        private enum enumMixinStr_KRB5_NT_MS_PRINCIPAL_AND_ID = `enum KRB5_NT_MS_PRINCIPAL_AND_ID = - 129;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NT_MS_PRINCIPAL_AND_ID); }))) {
            mixin(enumMixinStr_KRB5_NT_MS_PRINCIPAL_AND_ID);
        }
    }




    static if(!is(typeof(KRB5_NT_MS_PRINCIPAL))) {
        private enum enumMixinStr_KRB5_NT_MS_PRINCIPAL = `enum KRB5_NT_MS_PRINCIPAL = - 128;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NT_MS_PRINCIPAL); }))) {
            mixin(enumMixinStr_KRB5_NT_MS_PRINCIPAL);
        }
    }




    static if(!is(typeof(KRB5_WELLKNOWN_NAMESTR))) {
        private enum enumMixinStr_KRB5_WELLKNOWN_NAMESTR = `enum KRB5_WELLKNOWN_NAMESTR = "WELLKNOWN";`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_WELLKNOWN_NAMESTR); }))) {
            mixin(enumMixinStr_KRB5_WELLKNOWN_NAMESTR);
        }
    }




    static if(!is(typeof(KRB5_NT_WELLKNOWN))) {
        private enum enumMixinStr_KRB5_NT_WELLKNOWN = `enum KRB5_NT_WELLKNOWN = 11;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NT_WELLKNOWN); }))) {
            mixin(enumMixinStr_KRB5_NT_WELLKNOWN);
        }
    }




    static if(!is(typeof(KRB5_NT_ENTERPRISE_PRINCIPAL))) {
        private enum enumMixinStr_KRB5_NT_ENTERPRISE_PRINCIPAL = `enum KRB5_NT_ENTERPRISE_PRINCIPAL = 10;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NT_ENTERPRISE_PRINCIPAL); }))) {
            mixin(enumMixinStr_KRB5_NT_ENTERPRISE_PRINCIPAL);
        }
    }




    static if(!is(typeof(KRB5_NT_SMTP_NAME))) {
        private enum enumMixinStr_KRB5_NT_SMTP_NAME = `enum KRB5_NT_SMTP_NAME = 7;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NT_SMTP_NAME); }))) {
            mixin(enumMixinStr_KRB5_NT_SMTP_NAME);
        }
    }






    static if(!is(typeof(KRB5_NT_X500_PRINCIPAL))) {
        private enum enumMixinStr_KRB5_NT_X500_PRINCIPAL = `enum KRB5_NT_X500_PRINCIPAL = 6;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NT_X500_PRINCIPAL); }))) {
            mixin(enumMixinStr_KRB5_NT_X500_PRINCIPAL);
        }
    }




    static if(!is(typeof(KRB5_NT_UID))) {
        private enum enumMixinStr_KRB5_NT_UID = `enum KRB5_NT_UID = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NT_UID); }))) {
            mixin(enumMixinStr_KRB5_NT_UID);
        }
    }




    static if(!is(typeof(KRB5_NT_SRV_XHST))) {
        private enum enumMixinStr_KRB5_NT_SRV_XHST = `enum KRB5_NT_SRV_XHST = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NT_SRV_XHST); }))) {
            mixin(enumMixinStr_KRB5_NT_SRV_XHST);
        }
    }




    static if(!is(typeof(KRB5_NT_SRV_HST))) {
        private enum enumMixinStr_KRB5_NT_SRV_HST = `enum KRB5_NT_SRV_HST = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NT_SRV_HST); }))) {
            mixin(enumMixinStr_KRB5_NT_SRV_HST);
        }
    }




    static if(!is(typeof(KRB5_NT_SRV_INST))) {
        private enum enumMixinStr_KRB5_NT_SRV_INST = `enum KRB5_NT_SRV_INST = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NT_SRV_INST); }))) {
            mixin(enumMixinStr_KRB5_NT_SRV_INST);
        }
    }




    static if(!is(typeof(_IOFBF))) {
        private enum enumMixinStr__IOFBF = `enum _IOFBF = 0;`;
        static if(is(typeof({ mixin(enumMixinStr__IOFBF); }))) {
            mixin(enumMixinStr__IOFBF);
        }
    }




    static if(!is(typeof(_IOLBF))) {
        private enum enumMixinStr__IOLBF = `enum _IOLBF = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__IOLBF); }))) {
            mixin(enumMixinStr__IOLBF);
        }
    }




    static if(!is(typeof(_IONBF))) {
        private enum enumMixinStr__IONBF = `enum _IONBF = 2;`;
        static if(is(typeof({ mixin(enumMixinStr__IONBF); }))) {
            mixin(enumMixinStr__IONBF);
        }
    }




    static if(!is(typeof(BUFSIZ))) {
        private enum enumMixinStr_BUFSIZ = `enum BUFSIZ = 8192;`;
        static if(is(typeof({ mixin(enumMixinStr_BUFSIZ); }))) {
            mixin(enumMixinStr_BUFSIZ);
        }
    }




    static if(!is(typeof(EOF))) {
        private enum enumMixinStr_EOF = `enum EOF = ( - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_EOF); }))) {
            mixin(enumMixinStr_EOF);
        }
    }




    static if(!is(typeof(SEEK_SET))) {
        private enum enumMixinStr_SEEK_SET = `enum SEEK_SET = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_SEEK_SET); }))) {
            mixin(enumMixinStr_SEEK_SET);
        }
    }




    static if(!is(typeof(SEEK_CUR))) {
        private enum enumMixinStr_SEEK_CUR = `enum SEEK_CUR = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_SEEK_CUR); }))) {
            mixin(enumMixinStr_SEEK_CUR);
        }
    }




    static if(!is(typeof(SEEK_END))) {
        private enum enumMixinStr_SEEK_END = `enum SEEK_END = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_SEEK_END); }))) {
            mixin(enumMixinStr_SEEK_END);
        }
    }




    static if(!is(typeof(KRB5_NT_PRINCIPAL))) {
        private enum enumMixinStr_KRB5_NT_PRINCIPAL = `enum KRB5_NT_PRINCIPAL = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NT_PRINCIPAL); }))) {
            mixin(enumMixinStr_KRB5_NT_PRINCIPAL);
        }
    }




    static if(!is(typeof(P_tmpdir))) {
        private enum enumMixinStr_P_tmpdir = `enum P_tmpdir = "/tmp";`;
        static if(is(typeof({ mixin(enumMixinStr_P_tmpdir); }))) {
            mixin(enumMixinStr_P_tmpdir);
        }
    }




    static if(!is(typeof(KRB5_NT_UNKNOWN))) {
        private enum enumMixinStr_KRB5_NT_UNKNOWN = `enum KRB5_NT_UNKNOWN = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NT_UNKNOWN); }))) {
            mixin(enumMixinStr_KRB5_NT_UNKNOWN);
        }
    }




    static if(!is(typeof(SALT_TYPE_NO_LENGTH))) {
        private enum enumMixinStr_SALT_TYPE_NO_LENGTH = `enum SALT_TYPE_NO_LENGTH = UINT_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_SALT_TYPE_NO_LENGTH); }))) {
            mixin(enumMixinStr_SALT_TYPE_NO_LENGTH);
        }
    }




    static if(!is(typeof(SALT_TYPE_AFS_LENGTH))) {
        private enum enumMixinStr_SALT_TYPE_AFS_LENGTH = `enum SALT_TYPE_AFS_LENGTH = UINT_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_SALT_TYPE_AFS_LENGTH); }))) {
            mixin(enumMixinStr_SALT_TYPE_AFS_LENGTH);
        }
    }




    static if(!is(typeof(TRUE))) {
        private enum enumMixinStr_TRUE = `enum TRUE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_TRUE); }))) {
            mixin(enumMixinStr_TRUE);
        }
    }




    static if(!is(typeof(stdin))) {
        private enum enumMixinStr_stdin = `enum stdin = stdin;`;
        static if(is(typeof({ mixin(enumMixinStr_stdin); }))) {
            mixin(enumMixinStr_stdin);
        }
    }




    static if(!is(typeof(stdout))) {
        private enum enumMixinStr_stdout = `enum stdout = stdout;`;
        static if(is(typeof({ mixin(enumMixinStr_stdout); }))) {
            mixin(enumMixinStr_stdout);
        }
    }




    static if(!is(typeof(stderr))) {
        private enum enumMixinStr_stderr = `enum stderr = stderr;`;
        static if(is(typeof({ mixin(enumMixinStr_stderr); }))) {
            mixin(enumMixinStr_stderr);
        }
    }




    static if(!is(typeof(FALSE))) {
        private enum enumMixinStr_FALSE = `enum FALSE = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_FALSE); }))) {
            mixin(enumMixinStr_FALSE);
        }
    }




    static if(!is(typeof(KRB5_INT16_MIN))) {
        private enum enumMixinStr_KRB5_INT16_MIN = `enum KRB5_INT16_MIN = ( - KRB5_INT16_MAX - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_INT16_MIN); }))) {
            mixin(enumMixinStr_KRB5_INT16_MIN);
        }
    }




    static if(!is(typeof(KRB5_INT16_MAX))) {
        private enum enumMixinStr_KRB5_INT16_MAX = `enum KRB5_INT16_MAX = 65535;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_INT16_MAX); }))) {
            mixin(enumMixinStr_KRB5_INT16_MAX);
        }
    }




    static if(!is(typeof(KRB5_INT32_MIN))) {
        private enum enumMixinStr_KRB5_INT32_MIN = `enum KRB5_INT32_MIN = ( - KRB5_INT32_MAX - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_INT32_MIN); }))) {
            mixin(enumMixinStr_KRB5_INT32_MIN);
        }
    }




    static if(!is(typeof(KRB5_INT32_MAX))) {
        private enum enumMixinStr_KRB5_INT32_MAX = `enum KRB5_INT32_MAX = 2147483647;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_INT32_MAX); }))) {
            mixin(enumMixinStr_KRB5_INT32_MAX);
        }
    }




    static if(!is(typeof(VALID_UINT_BITS))) {
        private enum enumMixinStr_VALID_UINT_BITS = `enum VALID_UINT_BITS = UINT_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_VALID_UINT_BITS); }))) {
            mixin(enumMixinStr_VALID_UINT_BITS);
        }
    }




    static if(!is(typeof(VALID_INT_BITS))) {
        private enum enumMixinStr_VALID_INT_BITS = `enum VALID_INT_BITS = INT_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_VALID_INT_BITS); }))) {
            mixin(enumMixinStr_VALID_INT_BITS);
        }
    }




    static if(!is(typeof(KRB5_ATTR_DEPRECATED))) {
        private enum enumMixinStr_KRB5_ATTR_DEPRECATED = `enum KRB5_ATTR_DEPRECATED = __attribute__ ( ( deprecated ) );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_ATTR_DEPRECATED); }))) {
            mixin(enumMixinStr_KRB5_ATTR_DEPRECATED);
        }
    }
    static if(!is(typeof(KRB5_DEPRECATED))) {
        private enum enumMixinStr_KRB5_DEPRECATED = `enum KRB5_DEPRECATED = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_DEPRECATED); }))) {
            mixin(enumMixinStr_KRB5_DEPRECATED);
        }
    }
    static if(!is(typeof(gsskrb5_register_acceptor_identity))) {
        private enum enumMixinStr_gsskrb5_register_acceptor_identity = `enum gsskrb5_register_acceptor_identity = krb5_gss_register_acceptor_identity;`;
        static if(is(typeof({ mixin(enumMixinStr_gsskrb5_register_acceptor_identity); }))) {
            mixin(enumMixinStr_gsskrb5_register_acceptor_identity);
        }
    }




    static if(!is(typeof(gss_krb5_nt_string_uid_name))) {
        private enum enumMixinStr_gss_krb5_nt_string_uid_name = `enum gss_krb5_nt_string_uid_name = gss_nt_string_uid_name;`;
        static if(is(typeof({ mixin(enumMixinStr_gss_krb5_nt_string_uid_name); }))) {
            mixin(enumMixinStr_gss_krb5_nt_string_uid_name);
        }
    }




    static if(!is(typeof(gss_krb5_nt_machine_uid_name))) {
        private enum enumMixinStr_gss_krb5_nt_machine_uid_name = `enum gss_krb5_nt_machine_uid_name = gss_nt_machine_uid_name;`;
        static if(is(typeof({ mixin(enumMixinStr_gss_krb5_nt_machine_uid_name); }))) {
            mixin(enumMixinStr_gss_krb5_nt_machine_uid_name);
        }
    }




    static if(!is(typeof(gss_krb5_nt_user_name))) {
        private enum enumMixinStr_gss_krb5_nt_user_name = `enum gss_krb5_nt_user_name = gss_nt_user_name;`;
        static if(is(typeof({ mixin(enumMixinStr_gss_krb5_nt_user_name); }))) {
            mixin(enumMixinStr_gss_krb5_nt_user_name);
        }
    }




    static if(!is(typeof(gss_krb5_nt_service_name))) {
        private enum enumMixinStr_gss_krb5_nt_service_name = `enum gss_krb5_nt_service_name = gss_nt_service_name;`;
        static if(is(typeof({ mixin(enumMixinStr_gss_krb5_nt_service_name); }))) {
            mixin(enumMixinStr_gss_krb5_nt_service_name);
        }
    }




    static if(!is(typeof(gss_krb5_nt_principal))) {
        private enum enumMixinStr_gss_krb5_nt_principal = `enum gss_krb5_nt_principal = gss_nt_krb5_principal;`;
        static if(is(typeof({ mixin(enumMixinStr_gss_krb5_nt_principal); }))) {
            mixin(enumMixinStr_gss_krb5_nt_principal);
        }
    }




    static if(!is(typeof(gss_krb5_nt_general_name))) {
        private enum enumMixinStr_gss_krb5_nt_general_name = `enum gss_krb5_nt_general_name = gss_nt_krb5_name;`;
        static if(is(typeof({ mixin(enumMixinStr_gss_krb5_nt_general_name); }))) {
            mixin(enumMixinStr_gss_krb5_nt_general_name);
        }
    }




    static if(!is(typeof(GSS_KRB5_NT_STRING_UID_NAME))) {
        private enum enumMixinStr_GSS_KRB5_NT_STRING_UID_NAME = `enum GSS_KRB5_NT_STRING_UID_NAME = GSS_C_NT_STRING_UID_NAME;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_KRB5_NT_STRING_UID_NAME); }))) {
            mixin(enumMixinStr_GSS_KRB5_NT_STRING_UID_NAME);
        }
    }




    static if(!is(typeof(GSS_KRB5_NT_MACHINE_UID_NAME))) {
        private enum enumMixinStr_GSS_KRB5_NT_MACHINE_UID_NAME = `enum GSS_KRB5_NT_MACHINE_UID_NAME = GSS_C_NT_MACHINE_UID_NAME;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_KRB5_NT_MACHINE_UID_NAME); }))) {
            mixin(enumMixinStr_GSS_KRB5_NT_MACHINE_UID_NAME);
        }
    }




    static if(!is(typeof(GSS_KRB5_NT_USER_NAME))) {
        private enum enumMixinStr_GSS_KRB5_NT_USER_NAME = `enum GSS_KRB5_NT_USER_NAME = GSS_C_NT_USER_NAME;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_KRB5_NT_USER_NAME); }))) {
            mixin(enumMixinStr_GSS_KRB5_NT_USER_NAME);
        }
    }




    static if(!is(typeof(GSS_KRB5_NT_HOSTBASED_SERVICE_NAME))) {
        private enum enumMixinStr_GSS_KRB5_NT_HOSTBASED_SERVICE_NAME = `enum GSS_KRB5_NT_HOSTBASED_SERVICE_NAME = GSS_C_NT_HOSTBASED_SERVICE;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_KRB5_NT_HOSTBASED_SERVICE_NAME); }))) {
            mixin(enumMixinStr_GSS_KRB5_NT_HOSTBASED_SERVICE_NAME);
        }
    }
    static if(!is(typeof(GSS_C_NO_CRED_STORE))) {
        private enum enumMixinStr_GSS_C_NO_CRED_STORE = `enum GSS_C_NO_CRED_STORE = ( cast( gss_const_key_value_set_t ) 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_NO_CRED_STORE); }))) {
            mixin(enumMixinStr_GSS_C_NO_CRED_STORE);
        }
    }
    static if(!is(typeof(GSS_IOV_BUFFER_FLAG_ALLOCATED))) {
        private enum enumMixinStr_GSS_IOV_BUFFER_FLAG_ALLOCATED = `enum GSS_IOV_BUFFER_FLAG_ALLOCATED = 0x00020000;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_IOV_BUFFER_FLAG_ALLOCATED); }))) {
            mixin(enumMixinStr_GSS_IOV_BUFFER_FLAG_ALLOCATED);
        }
    }




    static if(!is(typeof(GSS_IOV_BUFFER_FLAG_ALLOCATE))) {
        private enum enumMixinStr_GSS_IOV_BUFFER_FLAG_ALLOCATE = `enum GSS_IOV_BUFFER_FLAG_ALLOCATE = 0x00010000;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_IOV_BUFFER_FLAG_ALLOCATE); }))) {
            mixin(enumMixinStr_GSS_IOV_BUFFER_FLAG_ALLOCATE);
        }
    }




    static if(!is(typeof(GSS_IOV_BUFFER_FLAG_MASK))) {
        private enum enumMixinStr_GSS_IOV_BUFFER_FLAG_MASK = `enum GSS_IOV_BUFFER_FLAG_MASK = 0xFFFF0000;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_IOV_BUFFER_FLAG_MASK); }))) {
            mixin(enumMixinStr_GSS_IOV_BUFFER_FLAG_MASK);
        }
    }




    static if(!is(typeof(GSS_IOV_BUFFER_TYPE_MIC_TOKEN))) {
        private enum enumMixinStr_GSS_IOV_BUFFER_TYPE_MIC_TOKEN = `enum GSS_IOV_BUFFER_TYPE_MIC_TOKEN = 12;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_IOV_BUFFER_TYPE_MIC_TOKEN); }))) {
            mixin(enumMixinStr_GSS_IOV_BUFFER_TYPE_MIC_TOKEN);
        }
    }




    static if(!is(typeof(GSS_IOV_BUFFER_TYPE_SIGN_ONLY))) {
        private enum enumMixinStr_GSS_IOV_BUFFER_TYPE_SIGN_ONLY = `enum GSS_IOV_BUFFER_TYPE_SIGN_ONLY = 11;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_IOV_BUFFER_TYPE_SIGN_ONLY); }))) {
            mixin(enumMixinStr_GSS_IOV_BUFFER_TYPE_SIGN_ONLY);
        }
    }




    static if(!is(typeof(GSS_IOV_BUFFER_TYPE_STREAM))) {
        private enum enumMixinStr_GSS_IOV_BUFFER_TYPE_STREAM = `enum GSS_IOV_BUFFER_TYPE_STREAM = 10;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_IOV_BUFFER_TYPE_STREAM); }))) {
            mixin(enumMixinStr_GSS_IOV_BUFFER_TYPE_STREAM);
        }
    }




    static if(!is(typeof(GSS_IOV_BUFFER_TYPE_PADDING))) {
        private enum enumMixinStr_GSS_IOV_BUFFER_TYPE_PADDING = `enum GSS_IOV_BUFFER_TYPE_PADDING = 9;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_IOV_BUFFER_TYPE_PADDING); }))) {
            mixin(enumMixinStr_GSS_IOV_BUFFER_TYPE_PADDING);
        }
    }




    static if(!is(typeof(GSS_IOV_BUFFER_TYPE_TRAILER))) {
        private enum enumMixinStr_GSS_IOV_BUFFER_TYPE_TRAILER = `enum GSS_IOV_BUFFER_TYPE_TRAILER = 7;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_IOV_BUFFER_TYPE_TRAILER); }))) {
            mixin(enumMixinStr_GSS_IOV_BUFFER_TYPE_TRAILER);
        }
    }




    static if(!is(typeof(GSS_IOV_BUFFER_TYPE_MECH_PARAMS))) {
        private enum enumMixinStr_GSS_IOV_BUFFER_TYPE_MECH_PARAMS = `enum GSS_IOV_BUFFER_TYPE_MECH_PARAMS = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_IOV_BUFFER_TYPE_MECH_PARAMS); }))) {
            mixin(enumMixinStr_GSS_IOV_BUFFER_TYPE_MECH_PARAMS);
        }
    }




    static if(!is(typeof(GSS_IOV_BUFFER_TYPE_HEADER))) {
        private enum enumMixinStr_GSS_IOV_BUFFER_TYPE_HEADER = `enum GSS_IOV_BUFFER_TYPE_HEADER = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_IOV_BUFFER_TYPE_HEADER); }))) {
            mixin(enumMixinStr_GSS_IOV_BUFFER_TYPE_HEADER);
        }
    }




    static if(!is(typeof(GSS_IOV_BUFFER_TYPE_DATA))) {
        private enum enumMixinStr_GSS_IOV_BUFFER_TYPE_DATA = `enum GSS_IOV_BUFFER_TYPE_DATA = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_IOV_BUFFER_TYPE_DATA); }))) {
            mixin(enumMixinStr_GSS_IOV_BUFFER_TYPE_DATA);
        }
    }




    static if(!is(typeof(GSS_IOV_BUFFER_TYPE_EMPTY))) {
        private enum enumMixinStr_GSS_IOV_BUFFER_TYPE_EMPTY = `enum GSS_IOV_BUFFER_TYPE_EMPTY = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_IOV_BUFFER_TYPE_EMPTY); }))) {
            mixin(enumMixinStr_GSS_IOV_BUFFER_TYPE_EMPTY);
        }
    }




    static if(!is(typeof(GSS_C_NO_IOV_BUFFER))) {
        private enum enumMixinStr_GSS_C_NO_IOV_BUFFER = `enum GSS_C_NO_IOV_BUFFER = ( cast( gss_iov_buffer_t ) 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_NO_IOV_BUFFER); }))) {
            mixin(enumMixinStr_GSS_C_NO_IOV_BUFFER);
        }
    }




    static if(!is(typeof(GSS_C_EXTENDED_ERROR_FLAG))) {
        private enum enumMixinStr_GSS_C_EXTENDED_ERROR_FLAG = `enum GSS_C_EXTENDED_ERROR_FLAG = 0x4000;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_EXTENDED_ERROR_FLAG); }))) {
            mixin(enumMixinStr_GSS_C_EXTENDED_ERROR_FLAG);
        }
    }




    static if(!is(typeof(GSS_C_IDENTIFY_FLAG))) {
        private enum enumMixinStr_GSS_C_IDENTIFY_FLAG = `enum GSS_C_IDENTIFY_FLAG = 0x2000;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_IDENTIFY_FLAG); }))) {
            mixin(enumMixinStr_GSS_C_IDENTIFY_FLAG);
        }
    }




    static if(!is(typeof(GSS_C_DCE_STYLE))) {
        private enum enumMixinStr_GSS_C_DCE_STYLE = `enum GSS_C_DCE_STYLE = 0x1000;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_DCE_STYLE); }))) {
            mixin(enumMixinStr_GSS_C_DCE_STYLE);
        }
    }




    static if(!is(typeof(GSS_C_NO_BUFFER_SET))) {
        private enum enumMixinStr_GSS_C_NO_BUFFER_SET = `enum GSS_C_NO_BUFFER_SET = ( cast( gss_buffer_set_t ) 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_NO_BUFFER_SET); }))) {
            mixin(enumMixinStr_GSS_C_NO_BUFFER_SET);
        }
    }






    static if(!is(typeof(GSS_S_CRED_UNAVAIL))) {
        private enum enumMixinStr_GSS_S_CRED_UNAVAIL = `enum GSS_S_CRED_UNAVAIL = GSS_S_FAILURE;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_CRED_UNAVAIL); }))) {
            mixin(enumMixinStr_GSS_S_CRED_UNAVAIL);
        }
    }
    static if(!is(typeof(GSS_C_PRF_KEY_PARTIAL))) {
        private enum enumMixinStr_GSS_C_PRF_KEY_PARTIAL = `enum GSS_C_PRF_KEY_PARTIAL = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_PRF_KEY_PARTIAL); }))) {
            mixin(enumMixinStr_GSS_C_PRF_KEY_PARTIAL);
        }
    }




    static if(!is(typeof(GSS_C_PRF_KEY_FULL))) {
        private enum enumMixinStr_GSS_C_PRF_KEY_FULL = `enum GSS_C_PRF_KEY_FULL = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_PRF_KEY_FULL); }))) {
            mixin(enumMixinStr_GSS_C_PRF_KEY_FULL);
        }
    }






    static if(!is(typeof(GSS_S_GAP_TOKEN))) {
        private enum enumMixinStr_GSS_S_GAP_TOKEN = `enum GSS_S_GAP_TOKEN = ( 1 << ( GSS_C_SUPPLEMENTARY_OFFSET + 4 ) );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_GAP_TOKEN); }))) {
            mixin(enumMixinStr_GSS_S_GAP_TOKEN);
        }
    }




    static if(!is(typeof(GSS_S_UNSEQ_TOKEN))) {
        private enum enumMixinStr_GSS_S_UNSEQ_TOKEN = `enum GSS_S_UNSEQ_TOKEN = ( 1 << ( GSS_C_SUPPLEMENTARY_OFFSET + 3 ) );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_UNSEQ_TOKEN); }))) {
            mixin(enumMixinStr_GSS_S_UNSEQ_TOKEN);
        }
    }




    static if(!is(typeof(GSS_S_OLD_TOKEN))) {
        private enum enumMixinStr_GSS_S_OLD_TOKEN = `enum GSS_S_OLD_TOKEN = ( 1 << ( GSS_C_SUPPLEMENTARY_OFFSET + 2 ) );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_OLD_TOKEN); }))) {
            mixin(enumMixinStr_GSS_S_OLD_TOKEN);
        }
    }




    static if(!is(typeof(GSS_S_DUPLICATE_TOKEN))) {
        private enum enumMixinStr_GSS_S_DUPLICATE_TOKEN = `enum GSS_S_DUPLICATE_TOKEN = ( 1 << ( GSS_C_SUPPLEMENTARY_OFFSET + 1 ) );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_DUPLICATE_TOKEN); }))) {
            mixin(enumMixinStr_GSS_S_DUPLICATE_TOKEN);
        }
    }




    static if(!is(typeof(GSS_S_CONTINUE_NEEDED))) {
        private enum enumMixinStr_GSS_S_CONTINUE_NEEDED = `enum GSS_S_CONTINUE_NEEDED = ( 1 << ( GSS_C_SUPPLEMENTARY_OFFSET + 0 ) );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_CONTINUE_NEEDED); }))) {
            mixin(enumMixinStr_GSS_S_CONTINUE_NEEDED);
        }
    }




    static if(!is(typeof(GSS_S_BAD_MECH_ATTR))) {
        private enum enumMixinStr_GSS_S_BAD_MECH_ATTR = `enum GSS_S_BAD_MECH_ATTR = ( ( cast( OM_uint32 ) 19ul ) << GSS_C_ROUTINE_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_BAD_MECH_ATTR); }))) {
            mixin(enumMixinStr_GSS_S_BAD_MECH_ATTR);
        }
    }




    static if(!is(typeof(GSS_S_NAME_NOT_MN))) {
        private enum enumMixinStr_GSS_S_NAME_NOT_MN = `enum GSS_S_NAME_NOT_MN = ( ( cast( OM_uint32 ) 18ul ) << GSS_C_ROUTINE_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_NAME_NOT_MN); }))) {
            mixin(enumMixinStr_GSS_S_NAME_NOT_MN);
        }
    }




    static if(!is(typeof(GSS_S_DUPLICATE_ELEMENT))) {
        private enum enumMixinStr_GSS_S_DUPLICATE_ELEMENT = `enum GSS_S_DUPLICATE_ELEMENT = ( ( cast( OM_uint32 ) 17ul ) << GSS_C_ROUTINE_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_DUPLICATE_ELEMENT); }))) {
            mixin(enumMixinStr_GSS_S_DUPLICATE_ELEMENT);
        }
    }




    static if(!is(typeof(GSS_S_UNAVAILABLE))) {
        private enum enumMixinStr_GSS_S_UNAVAILABLE = `enum GSS_S_UNAVAILABLE = ( ( cast( OM_uint32 ) 16ul ) << GSS_C_ROUTINE_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_UNAVAILABLE); }))) {
            mixin(enumMixinStr_GSS_S_UNAVAILABLE);
        }
    }




    static if(!is(typeof(GSS_S_UNAUTHORIZED))) {
        private enum enumMixinStr_GSS_S_UNAUTHORIZED = `enum GSS_S_UNAUTHORIZED = ( ( cast( OM_uint32 ) 15ul ) << GSS_C_ROUTINE_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_UNAUTHORIZED); }))) {
            mixin(enumMixinStr_GSS_S_UNAUTHORIZED);
        }
    }




    static if(!is(typeof(GSS_S_BAD_QOP))) {
        private enum enumMixinStr_GSS_S_BAD_QOP = `enum GSS_S_BAD_QOP = ( ( cast( OM_uint32 ) 14ul ) << GSS_C_ROUTINE_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_BAD_QOP); }))) {
            mixin(enumMixinStr_GSS_S_BAD_QOP);
        }
    }




    static if(!is(typeof(GSS_S_FAILURE))) {
        private enum enumMixinStr_GSS_S_FAILURE = `enum GSS_S_FAILURE = ( ( cast( OM_uint32 ) 13ul ) << GSS_C_ROUTINE_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_FAILURE); }))) {
            mixin(enumMixinStr_GSS_S_FAILURE);
        }
    }




    static if(!is(typeof(GSS_S_CONTEXT_EXPIRED))) {
        private enum enumMixinStr_GSS_S_CONTEXT_EXPIRED = `enum GSS_S_CONTEXT_EXPIRED = ( ( cast( OM_uint32 ) 12ul ) << GSS_C_ROUTINE_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_CONTEXT_EXPIRED); }))) {
            mixin(enumMixinStr_GSS_S_CONTEXT_EXPIRED);
        }
    }




    static if(!is(typeof(GSS_S_CREDENTIALS_EXPIRED))) {
        private enum enumMixinStr_GSS_S_CREDENTIALS_EXPIRED = `enum GSS_S_CREDENTIALS_EXPIRED = ( ( cast( OM_uint32 ) 11ul ) << GSS_C_ROUTINE_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_CREDENTIALS_EXPIRED); }))) {
            mixin(enumMixinStr_GSS_S_CREDENTIALS_EXPIRED);
        }
    }




    static if(!is(typeof(GSS_S_DEFECTIVE_CREDENTIAL))) {
        private enum enumMixinStr_GSS_S_DEFECTIVE_CREDENTIAL = `enum GSS_S_DEFECTIVE_CREDENTIAL = ( ( cast( OM_uint32 ) 10ul ) << GSS_C_ROUTINE_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_DEFECTIVE_CREDENTIAL); }))) {
            mixin(enumMixinStr_GSS_S_DEFECTIVE_CREDENTIAL);
        }
    }




    static if(!is(typeof(GSS_S_DEFECTIVE_TOKEN))) {
        private enum enumMixinStr_GSS_S_DEFECTIVE_TOKEN = `enum GSS_S_DEFECTIVE_TOKEN = ( ( cast( OM_uint32 ) 9ul ) << GSS_C_ROUTINE_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_DEFECTIVE_TOKEN); }))) {
            mixin(enumMixinStr_GSS_S_DEFECTIVE_TOKEN);
        }
    }




    static if(!is(typeof(GSS_S_NO_CONTEXT))) {
        private enum enumMixinStr_GSS_S_NO_CONTEXT = `enum GSS_S_NO_CONTEXT = ( ( cast( OM_uint32 ) 8ul ) << GSS_C_ROUTINE_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_NO_CONTEXT); }))) {
            mixin(enumMixinStr_GSS_S_NO_CONTEXT);
        }
    }




    static if(!is(typeof(GSS_S_NO_CRED))) {
        private enum enumMixinStr_GSS_S_NO_CRED = `enum GSS_S_NO_CRED = ( ( cast( OM_uint32 ) 7ul ) << GSS_C_ROUTINE_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_NO_CRED); }))) {
            mixin(enumMixinStr_GSS_S_NO_CRED);
        }
    }




    static if(!is(typeof(GSS_S_BAD_MIC))) {
        private enum enumMixinStr_GSS_S_BAD_MIC = `enum GSS_S_BAD_MIC = GSS_S_BAD_SIG;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_BAD_MIC); }))) {
            mixin(enumMixinStr_GSS_S_BAD_MIC);
        }
    }




    static if(!is(typeof(GSS_S_BAD_SIG))) {
        private enum enumMixinStr_GSS_S_BAD_SIG = `enum GSS_S_BAD_SIG = ( ( cast( OM_uint32 ) 6ul ) << GSS_C_ROUTINE_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_BAD_SIG); }))) {
            mixin(enumMixinStr_GSS_S_BAD_SIG);
        }
    }




    static if(!is(typeof(GSS_S_BAD_STATUS))) {
        private enum enumMixinStr_GSS_S_BAD_STATUS = `enum GSS_S_BAD_STATUS = ( ( cast( OM_uint32 ) 5ul ) << GSS_C_ROUTINE_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_BAD_STATUS); }))) {
            mixin(enumMixinStr_GSS_S_BAD_STATUS);
        }
    }




    static if(!is(typeof(GSS_S_BAD_BINDINGS))) {
        private enum enumMixinStr_GSS_S_BAD_BINDINGS = `enum GSS_S_BAD_BINDINGS = ( ( cast( OM_uint32 ) 4ul ) << GSS_C_ROUTINE_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_BAD_BINDINGS); }))) {
            mixin(enumMixinStr_GSS_S_BAD_BINDINGS);
        }
    }




    static if(!is(typeof(GSS_S_BAD_NAMETYPE))) {
        private enum enumMixinStr_GSS_S_BAD_NAMETYPE = `enum GSS_S_BAD_NAMETYPE = ( ( cast( OM_uint32 ) 3ul ) << GSS_C_ROUTINE_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_BAD_NAMETYPE); }))) {
            mixin(enumMixinStr_GSS_S_BAD_NAMETYPE);
        }
    }




    static if(!is(typeof(GSS_S_BAD_NAME))) {
        private enum enumMixinStr_GSS_S_BAD_NAME = `enum GSS_S_BAD_NAME = ( ( cast( OM_uint32 ) 2ul ) << GSS_C_ROUTINE_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_BAD_NAME); }))) {
            mixin(enumMixinStr_GSS_S_BAD_NAME);
        }
    }




    static if(!is(typeof(GSS_S_BAD_MECH))) {
        private enum enumMixinStr_GSS_S_BAD_MECH = `enum GSS_S_BAD_MECH = ( ( cast( OM_uint32 ) 1ul ) << GSS_C_ROUTINE_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_BAD_MECH); }))) {
            mixin(enumMixinStr_GSS_S_BAD_MECH);
        }
    }




    static if(!is(typeof(GSS_S_CALL_BAD_STRUCTURE))) {
        private enum enumMixinStr_GSS_S_CALL_BAD_STRUCTURE = `enum GSS_S_CALL_BAD_STRUCTURE = ( ( cast( OM_uint32 ) 3ul ) << GSS_C_CALLING_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_CALL_BAD_STRUCTURE); }))) {
            mixin(enumMixinStr_GSS_S_CALL_BAD_STRUCTURE);
        }
    }




    static if(!is(typeof(GSS_S_CALL_INACCESSIBLE_WRITE))) {
        private enum enumMixinStr_GSS_S_CALL_INACCESSIBLE_WRITE = `enum GSS_S_CALL_INACCESSIBLE_WRITE = ( ( cast( OM_uint32 ) 2ul ) << GSS_C_CALLING_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_CALL_INACCESSIBLE_WRITE); }))) {
            mixin(enumMixinStr_GSS_S_CALL_INACCESSIBLE_WRITE);
        }
    }




    static if(!is(typeof(GSS_S_CALL_INACCESSIBLE_READ))) {
        private enum enumMixinStr_GSS_S_CALL_INACCESSIBLE_READ = `enum GSS_S_CALL_INACCESSIBLE_READ = ( ( cast( OM_uint32 ) 1ul ) << GSS_C_CALLING_ERROR_OFFSET );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_CALL_INACCESSIBLE_READ); }))) {
            mixin(enumMixinStr_GSS_S_CALL_INACCESSIBLE_READ);
        }
    }
    static if(!is(typeof(GSS_C_SUPPLEMENTARY_MASK))) {
        private enum enumMixinStr_GSS_C_SUPPLEMENTARY_MASK = `enum GSS_C_SUPPLEMENTARY_MASK = ( cast( OM_uint32 ) 0177777ul );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_SUPPLEMENTARY_MASK); }))) {
            mixin(enumMixinStr_GSS_C_SUPPLEMENTARY_MASK);
        }
    }




    static if(!is(typeof(GSS_C_ROUTINE_ERROR_MASK))) {
        private enum enumMixinStr_GSS_C_ROUTINE_ERROR_MASK = `enum GSS_C_ROUTINE_ERROR_MASK = ( cast( OM_uint32 ) 0377ul );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_ROUTINE_ERROR_MASK); }))) {
            mixin(enumMixinStr_GSS_C_ROUTINE_ERROR_MASK);
        }
    }




    static if(!is(typeof(GSS_C_CALLING_ERROR_MASK))) {
        private enum enumMixinStr_GSS_C_CALLING_ERROR_MASK = `enum GSS_C_CALLING_ERROR_MASK = ( cast( OM_uint32 ) 0377ul );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_CALLING_ERROR_MASK); }))) {
            mixin(enumMixinStr_GSS_C_CALLING_ERROR_MASK);
        }
    }




    static if(!is(typeof(GSS_C_SUPPLEMENTARY_OFFSET))) {
        private enum enumMixinStr_GSS_C_SUPPLEMENTARY_OFFSET = `enum GSS_C_SUPPLEMENTARY_OFFSET = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_SUPPLEMENTARY_OFFSET); }))) {
            mixin(enumMixinStr_GSS_C_SUPPLEMENTARY_OFFSET);
        }
    }




    static if(!is(typeof(GSS_C_ROUTINE_ERROR_OFFSET))) {
        private enum enumMixinStr_GSS_C_ROUTINE_ERROR_OFFSET = `enum GSS_C_ROUTINE_ERROR_OFFSET = 16;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_ROUTINE_ERROR_OFFSET); }))) {
            mixin(enumMixinStr_GSS_C_ROUTINE_ERROR_OFFSET);
        }
    }




    static if(!is(typeof(GSS_C_CALLING_ERROR_OFFSET))) {
        private enum enumMixinStr_GSS_C_CALLING_ERROR_OFFSET = `enum GSS_C_CALLING_ERROR_OFFSET = 24;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_CALLING_ERROR_OFFSET); }))) {
            mixin(enumMixinStr_GSS_C_CALLING_ERROR_OFFSET);
        }
    }




    static if(!is(typeof(GSS_S_COMPLETE))) {
        private enum enumMixinStr_GSS_S_COMPLETE = `enum GSS_S_COMPLETE = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_S_COMPLETE); }))) {
            mixin(enumMixinStr_GSS_S_COMPLETE);
        }
    }




    static if(!is(typeof(GSS_C_INDEFINITE))) {
        private enum enumMixinStr_GSS_C_INDEFINITE = `enum GSS_C_INDEFINITE = ( cast( OM_uint32 ) 0xfffffffful );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_INDEFINITE); }))) {
            mixin(enumMixinStr_GSS_C_INDEFINITE);
        }
    }




    static if(!is(typeof(GSS_C_QOP_DEFAULT))) {
        private enum enumMixinStr_GSS_C_QOP_DEFAULT = `enum GSS_C_QOP_DEFAULT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_QOP_DEFAULT); }))) {
            mixin(enumMixinStr_GSS_C_QOP_DEFAULT);
        }
    }




    static if(!is(typeof(GSS_C_NULL_OID_SET))) {
        private enum enumMixinStr_GSS_C_NULL_OID_SET = `enum GSS_C_NULL_OID_SET = GSS_C_NO_OID_SET;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_NULL_OID_SET); }))) {
            mixin(enumMixinStr_GSS_C_NULL_OID_SET);
        }
    }




    static if(!is(typeof(GSS_C_NULL_OID))) {
        private enum enumMixinStr_GSS_C_NULL_OID = `enum GSS_C_NULL_OID = GSS_C_NO_OID;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_NULL_OID); }))) {
            mixin(enumMixinStr_GSS_C_NULL_OID);
        }
    }




    static if(!is(typeof(GSS_C_EMPTY_BUFFER))) {
        private enum enumMixinStr_GSS_C_EMPTY_BUFFER = `enum GSS_C_EMPTY_BUFFER = { 0 , null };`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_EMPTY_BUFFER); }))) {
            mixin(enumMixinStr_GSS_C_EMPTY_BUFFER);
        }
    }




    static if(!is(typeof(GSS_C_NO_CHANNEL_BINDINGS))) {
        private enum enumMixinStr_GSS_C_NO_CHANNEL_BINDINGS = `enum GSS_C_NO_CHANNEL_BINDINGS = ( cast( gss_channel_bindings_t ) 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_NO_CHANNEL_BINDINGS); }))) {
            mixin(enumMixinStr_GSS_C_NO_CHANNEL_BINDINGS);
        }
    }




    static if(!is(typeof(GSS_C_NO_CREDENTIAL))) {
        private enum enumMixinStr_GSS_C_NO_CREDENTIAL = `enum GSS_C_NO_CREDENTIAL = ( cast( gss_cred_id_t ) 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_NO_CREDENTIAL); }))) {
            mixin(enumMixinStr_GSS_C_NO_CREDENTIAL);
        }
    }




    static if(!is(typeof(GSS_C_NO_CONTEXT))) {
        private enum enumMixinStr_GSS_C_NO_CONTEXT = `enum GSS_C_NO_CONTEXT = ( cast( gss_ctx_id_t ) 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_NO_CONTEXT); }))) {
            mixin(enumMixinStr_GSS_C_NO_CONTEXT);
        }
    }




    static if(!is(typeof(GSS_C_NO_OID_SET))) {
        private enum enumMixinStr_GSS_C_NO_OID_SET = `enum GSS_C_NO_OID_SET = ( cast( gss_OID_set ) 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_NO_OID_SET); }))) {
            mixin(enumMixinStr_GSS_C_NO_OID_SET);
        }
    }




    static if(!is(typeof(GSS_C_NO_OID))) {
        private enum enumMixinStr_GSS_C_NO_OID = `enum GSS_C_NO_OID = ( cast( gss_OID ) 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_NO_OID); }))) {
            mixin(enumMixinStr_GSS_C_NO_OID);
        }
    }




    static if(!is(typeof(GSS_C_NO_BUFFER))) {
        private enum enumMixinStr_GSS_C_NO_BUFFER = `enum GSS_C_NO_BUFFER = ( cast( gss_buffer_t ) 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_NO_BUFFER); }))) {
            mixin(enumMixinStr_GSS_C_NO_BUFFER);
        }
    }




    static if(!is(typeof(GSS_C_NO_NAME))) {
        private enum enumMixinStr_GSS_C_NO_NAME = `enum GSS_C_NO_NAME = ( cast( gss_name_t ) 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_NO_NAME); }))) {
            mixin(enumMixinStr_GSS_C_NO_NAME);
        }
    }




    static if(!is(typeof(GSS_C_AF_NULLADDR))) {
        private enum enumMixinStr_GSS_C_AF_NULLADDR = `enum GSS_C_AF_NULLADDR = 255;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_NULLADDR); }))) {
            mixin(enumMixinStr_GSS_C_AF_NULLADDR);
        }
    }




    static if(!is(typeof(GSS_C_AF_X25))) {
        private enum enumMixinStr_GSS_C_AF_X25 = `enum GSS_C_AF_X25 = 21;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_X25); }))) {
            mixin(enumMixinStr_GSS_C_AF_X25);
        }
    }




    static if(!is(typeof(GSS_C_AF_NETBIOS))) {
        private enum enumMixinStr_GSS_C_AF_NETBIOS = `enum GSS_C_AF_NETBIOS = 20;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_NETBIOS); }))) {
            mixin(enumMixinStr_GSS_C_AF_NETBIOS);
        }
    }




    static if(!is(typeof(GSS_C_AF_OSI))) {
        private enum enumMixinStr_GSS_C_AF_OSI = `enum GSS_C_AF_OSI = 19;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_OSI); }))) {
            mixin(enumMixinStr_GSS_C_AF_OSI);
        }
    }




    static if(!is(typeof(GSS_C_AF_DSS))) {
        private enum enumMixinStr_GSS_C_AF_DSS = `enum GSS_C_AF_DSS = 18;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_DSS); }))) {
            mixin(enumMixinStr_GSS_C_AF_DSS);
        }
    }




    static if(!is(typeof(GSS_C_AF_BSC))) {
        private enum enumMixinStr_GSS_C_AF_BSC = `enum GSS_C_AF_BSC = 17;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_BSC); }))) {
            mixin(enumMixinStr_GSS_C_AF_BSC);
        }
    }




    static if(!is(typeof(GSS_C_AF_APPLETALK))) {
        private enum enumMixinStr_GSS_C_AF_APPLETALK = `enum GSS_C_AF_APPLETALK = 16;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_APPLETALK); }))) {
            mixin(enumMixinStr_GSS_C_AF_APPLETALK);
        }
    }




    static if(!is(typeof(GSS_C_AF_HYLINK))) {
        private enum enumMixinStr_GSS_C_AF_HYLINK = `enum GSS_C_AF_HYLINK = 15;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_HYLINK); }))) {
            mixin(enumMixinStr_GSS_C_AF_HYLINK);
        }
    }




    static if(!is(typeof(GSS_C_AF_LAT))) {
        private enum enumMixinStr_GSS_C_AF_LAT = `enum GSS_C_AF_LAT = 14;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_LAT); }))) {
            mixin(enumMixinStr_GSS_C_AF_LAT);
        }
    }




    static if(!is(typeof(GSS_C_AF_DLI))) {
        private enum enumMixinStr_GSS_C_AF_DLI = `enum GSS_C_AF_DLI = 13;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_DLI); }))) {
            mixin(enumMixinStr_GSS_C_AF_DLI);
        }
    }




    static if(!is(typeof(GSS_C_AF_DECnet))) {
        private enum enumMixinStr_GSS_C_AF_DECnet = `enum GSS_C_AF_DECnet = 12;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_DECnet); }))) {
            mixin(enumMixinStr_GSS_C_AF_DECnet);
        }
    }




    static if(!is(typeof(GSS_C_AF_SNA))) {
        private enum enumMixinStr_GSS_C_AF_SNA = `enum GSS_C_AF_SNA = 11;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_SNA); }))) {
            mixin(enumMixinStr_GSS_C_AF_SNA);
        }
    }




    static if(!is(typeof(GSS_C_AF_CCITT))) {
        private enum enumMixinStr_GSS_C_AF_CCITT = `enum GSS_C_AF_CCITT = 10;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_CCITT); }))) {
            mixin(enumMixinStr_GSS_C_AF_CCITT);
        }
    }




    static if(!is(typeof(GSS_C_AF_DATAKIT))) {
        private enum enumMixinStr_GSS_C_AF_DATAKIT = `enum GSS_C_AF_DATAKIT = 9;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_DATAKIT); }))) {
            mixin(enumMixinStr_GSS_C_AF_DATAKIT);
        }
    }




    static if(!is(typeof(GSS_C_AF_ECMA))) {
        private enum enumMixinStr_GSS_C_AF_ECMA = `enum GSS_C_AF_ECMA = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_ECMA); }))) {
            mixin(enumMixinStr_GSS_C_AF_ECMA);
        }
    }




    static if(!is(typeof(GSS_C_AF_NBS))) {
        private enum enumMixinStr_GSS_C_AF_NBS = `enum GSS_C_AF_NBS = 7;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_NBS); }))) {
            mixin(enumMixinStr_GSS_C_AF_NBS);
        }
    }




    static if(!is(typeof(GSS_C_AF_NS))) {
        private enum enumMixinStr_GSS_C_AF_NS = `enum GSS_C_AF_NS = 6;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_NS); }))) {
            mixin(enumMixinStr_GSS_C_AF_NS);
        }
    }




    static if(!is(typeof(GSS_C_AF_CHAOS))) {
        private enum enumMixinStr_GSS_C_AF_CHAOS = `enum GSS_C_AF_CHAOS = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_CHAOS); }))) {
            mixin(enumMixinStr_GSS_C_AF_CHAOS);
        }
    }




    static if(!is(typeof(GSS_C_AF_PUP))) {
        private enum enumMixinStr_GSS_C_AF_PUP = `enum GSS_C_AF_PUP = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_PUP); }))) {
            mixin(enumMixinStr_GSS_C_AF_PUP);
        }
    }




    static if(!is(typeof(GSS_C_AF_IMPLINK))) {
        private enum enumMixinStr_GSS_C_AF_IMPLINK = `enum GSS_C_AF_IMPLINK = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_IMPLINK); }))) {
            mixin(enumMixinStr_GSS_C_AF_IMPLINK);
        }
    }




    static if(!is(typeof(GSS_C_AF_INET))) {
        private enum enumMixinStr_GSS_C_AF_INET = `enum GSS_C_AF_INET = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_INET); }))) {
            mixin(enumMixinStr_GSS_C_AF_INET);
        }
    }




    static if(!is(typeof(GSS_C_AF_LOCAL))) {
        private enum enumMixinStr_GSS_C_AF_LOCAL = `enum GSS_C_AF_LOCAL = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_LOCAL); }))) {
            mixin(enumMixinStr_GSS_C_AF_LOCAL);
        }
    }




    static if(!is(typeof(GSS_C_AF_UNSPEC))) {
        private enum enumMixinStr_GSS_C_AF_UNSPEC = `enum GSS_C_AF_UNSPEC = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_AF_UNSPEC); }))) {
            mixin(enumMixinStr_GSS_C_AF_UNSPEC);
        }
    }




    static if(!is(typeof(GSS_C_MECH_CODE))) {
        private enum enumMixinStr_GSS_C_MECH_CODE = `enum GSS_C_MECH_CODE = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_MECH_CODE); }))) {
            mixin(enumMixinStr_GSS_C_MECH_CODE);
        }
    }




    static if(!is(typeof(GSS_C_GSS_CODE))) {
        private enum enumMixinStr_GSS_C_GSS_CODE = `enum GSS_C_GSS_CODE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_GSS_CODE); }))) {
            mixin(enumMixinStr_GSS_C_GSS_CODE);
        }
    }




    static if(!is(typeof(GSS_C_ACCEPT))) {
        private enum enumMixinStr_GSS_C_ACCEPT = `enum GSS_C_ACCEPT = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_ACCEPT); }))) {
            mixin(enumMixinStr_GSS_C_ACCEPT);
        }
    }




    static if(!is(typeof(GSS_C_INITIATE))) {
        private enum enumMixinStr_GSS_C_INITIATE = `enum GSS_C_INITIATE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_INITIATE); }))) {
            mixin(enumMixinStr_GSS_C_INITIATE);
        }
    }




    static if(!is(typeof(GSS_C_BOTH))) {
        private enum enumMixinStr_GSS_C_BOTH = `enum GSS_C_BOTH = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_BOTH); }))) {
            mixin(enumMixinStr_GSS_C_BOTH);
        }
    }




    static if(!is(typeof(GSS_C_DELEG_POLICY_FLAG))) {
        private enum enumMixinStr_GSS_C_DELEG_POLICY_FLAG = `enum GSS_C_DELEG_POLICY_FLAG = 32768;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_DELEG_POLICY_FLAG); }))) {
            mixin(enumMixinStr_GSS_C_DELEG_POLICY_FLAG);
        }
    }




    static if(!is(typeof(GSS_C_TRANS_FLAG))) {
        private enum enumMixinStr_GSS_C_TRANS_FLAG = `enum GSS_C_TRANS_FLAG = 256;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_TRANS_FLAG); }))) {
            mixin(enumMixinStr_GSS_C_TRANS_FLAG);
        }
    }




    static if(!is(typeof(GSS_C_PROT_READY_FLAG))) {
        private enum enumMixinStr_GSS_C_PROT_READY_FLAG = `enum GSS_C_PROT_READY_FLAG = 128;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_PROT_READY_FLAG); }))) {
            mixin(enumMixinStr_GSS_C_PROT_READY_FLAG);
        }
    }




    static if(!is(typeof(GSS_C_ANON_FLAG))) {
        private enum enumMixinStr_GSS_C_ANON_FLAG = `enum GSS_C_ANON_FLAG = 64;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_ANON_FLAG); }))) {
            mixin(enumMixinStr_GSS_C_ANON_FLAG);
        }
    }




    static if(!is(typeof(GSS_C_INTEG_FLAG))) {
        private enum enumMixinStr_GSS_C_INTEG_FLAG = `enum GSS_C_INTEG_FLAG = 32;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_INTEG_FLAG); }))) {
            mixin(enumMixinStr_GSS_C_INTEG_FLAG);
        }
    }




    static if(!is(typeof(GSS_C_CONF_FLAG))) {
        private enum enumMixinStr_GSS_C_CONF_FLAG = `enum GSS_C_CONF_FLAG = 16;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_CONF_FLAG); }))) {
            mixin(enumMixinStr_GSS_C_CONF_FLAG);
        }
    }




    static if(!is(typeof(GSS_C_SEQUENCE_FLAG))) {
        private enum enumMixinStr_GSS_C_SEQUENCE_FLAG = `enum GSS_C_SEQUENCE_FLAG = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_SEQUENCE_FLAG); }))) {
            mixin(enumMixinStr_GSS_C_SEQUENCE_FLAG);
        }
    }




    static if(!is(typeof(GSS_C_REPLAY_FLAG))) {
        private enum enumMixinStr_GSS_C_REPLAY_FLAG = `enum GSS_C_REPLAY_FLAG = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_REPLAY_FLAG); }))) {
            mixin(enumMixinStr_GSS_C_REPLAY_FLAG);
        }
    }




    static if(!is(typeof(GSS_C_MUTUAL_FLAG))) {
        private enum enumMixinStr_GSS_C_MUTUAL_FLAG = `enum GSS_C_MUTUAL_FLAG = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_MUTUAL_FLAG); }))) {
            mixin(enumMixinStr_GSS_C_MUTUAL_FLAG);
        }
    }




    static if(!is(typeof(GSS_C_DELEG_FLAG))) {
        private enum enumMixinStr_GSS_C_DELEG_FLAG = `enum GSS_C_DELEG_FLAG = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_GSS_C_DELEG_FLAG); }))) {
            mixin(enumMixinStr_GSS_C_DELEG_FLAG);
        }
    }
    static if(!is(typeof(__GLIBC_MINOR__))) {
        private enum enumMixinStr___GLIBC_MINOR__ = `enum __GLIBC_MINOR__ = 30;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_MINOR__); }))) {
            mixin(enumMixinStr___GLIBC_MINOR__);
        }
    }




    static if(!is(typeof(__GLIBC__))) {
        private enum enumMixinStr___GLIBC__ = `enum __GLIBC__ = 2;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC__); }))) {
            mixin(enumMixinStr___GLIBC__);
        }
    }




    static if(!is(typeof(__GNU_LIBRARY__))) {
        private enum enumMixinStr___GNU_LIBRARY__ = `enum __GNU_LIBRARY__ = 6;`;
        static if(is(typeof({ mixin(enumMixinStr___GNU_LIBRARY__); }))) {
            mixin(enumMixinStr___GNU_LIBRARY__);
        }
    }




    static if(!is(typeof(__GLIBC_USE_DEPRECATED_SCANF))) {
        private enum enumMixinStr___GLIBC_USE_DEPRECATED_SCANF = `enum __GLIBC_USE_DEPRECATED_SCANF = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_DEPRECATED_SCANF); }))) {
            mixin(enumMixinStr___GLIBC_USE_DEPRECATED_SCANF);
        }
    }




    static if(!is(typeof(__GLIBC_USE_DEPRECATED_GETS))) {
        private enum enumMixinStr___GLIBC_USE_DEPRECATED_GETS = `enum __GLIBC_USE_DEPRECATED_GETS = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_DEPRECATED_GETS); }))) {
            mixin(enumMixinStr___GLIBC_USE_DEPRECATED_GETS);
        }
    }




    static if(!is(typeof(__USE_FORTIFY_LEVEL))) {
        private enum enumMixinStr___USE_FORTIFY_LEVEL = `enum __USE_FORTIFY_LEVEL = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_FORTIFY_LEVEL); }))) {
            mixin(enumMixinStr___USE_FORTIFY_LEVEL);
        }
    }




    static if(!is(typeof(__USE_ATFILE))) {
        private enum enumMixinStr___USE_ATFILE = `enum __USE_ATFILE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ATFILE); }))) {
            mixin(enumMixinStr___USE_ATFILE);
        }
    }




    static if(!is(typeof(__USE_MISC))) {
        private enum enumMixinStr___USE_MISC = `enum __USE_MISC = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_MISC); }))) {
            mixin(enumMixinStr___USE_MISC);
        }
    }




    static if(!is(typeof(_ATFILE_SOURCE))) {
        private enum enumMixinStr__ATFILE_SOURCE = `enum _ATFILE_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__ATFILE_SOURCE); }))) {
            mixin(enumMixinStr__ATFILE_SOURCE);
        }
    }




    static if(!is(typeof(__USE_XOPEN2K8))) {
        private enum enumMixinStr___USE_XOPEN2K8 = `enum __USE_XOPEN2K8 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_XOPEN2K8); }))) {
            mixin(enumMixinStr___USE_XOPEN2K8);
        }
    }




    static if(!is(typeof(__USE_ISOC99))) {
        private enum enumMixinStr___USE_ISOC99 = `enum __USE_ISOC99 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ISOC99); }))) {
            mixin(enumMixinStr___USE_ISOC99);
        }
    }




    static if(!is(typeof(__USE_ISOC95))) {
        private enum enumMixinStr___USE_ISOC95 = `enum __USE_ISOC95 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ISOC95); }))) {
            mixin(enumMixinStr___USE_ISOC95);
        }
    }




    static if(!is(typeof(__USE_XOPEN2K))) {
        private enum enumMixinStr___USE_XOPEN2K = `enum __USE_XOPEN2K = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_XOPEN2K); }))) {
            mixin(enumMixinStr___USE_XOPEN2K);
        }
    }




    static if(!is(typeof(__USE_POSIX199506))) {
        private enum enumMixinStr___USE_POSIX199506 = `enum __USE_POSIX199506 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX199506); }))) {
            mixin(enumMixinStr___USE_POSIX199506);
        }
    }




    static if(!is(typeof(__USE_POSIX199309))) {
        private enum enumMixinStr___USE_POSIX199309 = `enum __USE_POSIX199309 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX199309); }))) {
            mixin(enumMixinStr___USE_POSIX199309);
        }
    }




    static if(!is(typeof(__USE_POSIX2))) {
        private enum enumMixinStr___USE_POSIX2 = `enum __USE_POSIX2 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX2); }))) {
            mixin(enumMixinStr___USE_POSIX2);
        }
    }




    static if(!is(typeof(__USE_POSIX))) {
        private enum enumMixinStr___USE_POSIX = `enum __USE_POSIX = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX); }))) {
            mixin(enumMixinStr___USE_POSIX);
        }
    }




    static if(!is(typeof(_POSIX_C_SOURCE))) {
        private enum enumMixinStr__POSIX_C_SOURCE = `enum _POSIX_C_SOURCE = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_C_SOURCE); }))) {
            mixin(enumMixinStr__POSIX_C_SOURCE);
        }
    }




    static if(!is(typeof(_POSIX_SOURCE))) {
        private enum enumMixinStr__POSIX_SOURCE = `enum _POSIX_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SOURCE); }))) {
            mixin(enumMixinStr__POSIX_SOURCE);
        }
    }




    static if(!is(typeof(__USE_POSIX_IMPLICITLY))) {
        private enum enumMixinStr___USE_POSIX_IMPLICITLY = `enum __USE_POSIX_IMPLICITLY = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_POSIX_IMPLICITLY); }))) {
            mixin(enumMixinStr___USE_POSIX_IMPLICITLY);
        }
    }




    static if(!is(typeof(__USE_ISOC11))) {
        private enum enumMixinStr___USE_ISOC11 = `enum __USE_ISOC11 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___USE_ISOC11); }))) {
            mixin(enumMixinStr___USE_ISOC11);
        }
    }




    static if(!is(typeof(_DEFAULT_SOURCE))) {
        private enum enumMixinStr__DEFAULT_SOURCE = `enum _DEFAULT_SOURCE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__DEFAULT_SOURCE); }))) {
            mixin(enumMixinStr__DEFAULT_SOURCE);
        }
    }
    static if(!is(typeof(_FEATURES_H))) {
        private enum enumMixinStr__FEATURES_H = `enum _FEATURES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__FEATURES_H); }))) {
            mixin(enumMixinStr__FEATURES_H);
        }
    }
    static if(!is(typeof(errno))) {
        private enum enumMixinStr_errno = `enum errno = ( * __errno_location ( ) );`;
        static if(is(typeof({ mixin(enumMixinStr_errno); }))) {
            mixin(enumMixinStr_errno);
        }
    }




    static if(!is(typeof(_ERRNO_H))) {
        private enum enumMixinStr__ERRNO_H = `enum _ERRNO_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__ERRNO_H); }))) {
            mixin(enumMixinStr__ERRNO_H);
        }
    }




    static if(!is(typeof(_STDLIB_H))) {
        private enum enumMixinStr__STDLIB_H = `enum _STDLIB_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STDLIB_H); }))) {
            mixin(enumMixinStr__STDLIB_H);
        }
    }
    static if(!is(typeof(__ldiv_t_defined))) {
        private enum enumMixinStr___ldiv_t_defined = `enum __ldiv_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___ldiv_t_defined); }))) {
            mixin(enumMixinStr___ldiv_t_defined);
        }
    }
    static if(!is(typeof(__lldiv_t_defined))) {
        private enum enumMixinStr___lldiv_t_defined = `enum __lldiv_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___lldiv_t_defined); }))) {
            mixin(enumMixinStr___lldiv_t_defined);
        }
    }




    static if(!is(typeof(RAND_MAX))) {
        private enum enumMixinStr_RAND_MAX = `enum RAND_MAX = 2147483647;`;
        static if(is(typeof({ mixin(enumMixinStr_RAND_MAX); }))) {
            mixin(enumMixinStr_RAND_MAX);
        }
    }




    static if(!is(typeof(EXIT_FAILURE))) {
        private enum enumMixinStr_EXIT_FAILURE = `enum EXIT_FAILURE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_EXIT_FAILURE); }))) {
            mixin(enumMixinStr_EXIT_FAILURE);
        }
    }




    static if(!is(typeof(EXIT_SUCCESS))) {
        private enum enumMixinStr_EXIT_SUCCESS = `enum EXIT_SUCCESS = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_EXIT_SUCCESS); }))) {
            mixin(enumMixinStr_EXIT_SUCCESS);
        }
    }




    static if(!is(typeof(MB_CUR_MAX))) {
        private enum enumMixinStr_MB_CUR_MAX = `enum MB_CUR_MAX = ( __ctype_get_mb_cur_max ( ) );`;
        static if(is(typeof({ mixin(enumMixinStr_MB_CUR_MAX); }))) {
            mixin(enumMixinStr_MB_CUR_MAX);
        }
    }






    static if(!is(typeof(BYTE_ORDER))) {
        private enum enumMixinStr_BYTE_ORDER = `enum BYTE_ORDER = __BYTE_ORDER;`;
        static if(is(typeof({ mixin(enumMixinStr_BYTE_ORDER); }))) {
            mixin(enumMixinStr_BYTE_ORDER);
        }
    }




    static if(!is(typeof(PDP_ENDIAN))) {
        private enum enumMixinStr_PDP_ENDIAN = `enum PDP_ENDIAN = __PDP_ENDIAN;`;
        static if(is(typeof({ mixin(enumMixinStr_PDP_ENDIAN); }))) {
            mixin(enumMixinStr_PDP_ENDIAN);
        }
    }




    static if(!is(typeof(BIG_ENDIAN))) {
        private enum enumMixinStr_BIG_ENDIAN = `enum BIG_ENDIAN = __BIG_ENDIAN;`;
        static if(is(typeof({ mixin(enumMixinStr_BIG_ENDIAN); }))) {
            mixin(enumMixinStr_BIG_ENDIAN);
        }
    }




    static if(!is(typeof(LITTLE_ENDIAN))) {
        private enum enumMixinStr_LITTLE_ENDIAN = `enum LITTLE_ENDIAN = __LITTLE_ENDIAN;`;
        static if(is(typeof({ mixin(enumMixinStr_LITTLE_ENDIAN); }))) {
            mixin(enumMixinStr_LITTLE_ENDIAN);
        }
    }




    static if(!is(typeof(__FLOAT_WORD_ORDER))) {
        private enum enumMixinStr___FLOAT_WORD_ORDER = `enum __FLOAT_WORD_ORDER = __BYTE_ORDER;`;
        static if(is(typeof({ mixin(enumMixinStr___FLOAT_WORD_ORDER); }))) {
            mixin(enumMixinStr___FLOAT_WORD_ORDER);
        }
    }




    static if(!is(typeof(__PDP_ENDIAN))) {
        private enum enumMixinStr___PDP_ENDIAN = `enum __PDP_ENDIAN = 3412;`;
        static if(is(typeof({ mixin(enumMixinStr___PDP_ENDIAN); }))) {
            mixin(enumMixinStr___PDP_ENDIAN);
        }
    }




    static if(!is(typeof(__BIG_ENDIAN))) {
        private enum enumMixinStr___BIG_ENDIAN = `enum __BIG_ENDIAN = 4321;`;
        static if(is(typeof({ mixin(enumMixinStr___BIG_ENDIAN); }))) {
            mixin(enumMixinStr___BIG_ENDIAN);
        }
    }




    static if(!is(typeof(__LITTLE_ENDIAN))) {
        private enum enumMixinStr___LITTLE_ENDIAN = `enum __LITTLE_ENDIAN = 1234;`;
        static if(is(typeof({ mixin(enumMixinStr___LITTLE_ENDIAN); }))) {
            mixin(enumMixinStr___LITTLE_ENDIAN);
        }
    }




    static if(!is(typeof(_ENDIAN_H))) {
        private enum enumMixinStr__ENDIAN_H = `enum _ENDIAN_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__ENDIAN_H); }))) {
            mixin(enumMixinStr__ENDIAN_H);
        }
    }




    static if(!is(typeof(__SYSCALL_WORDSIZE))) {
        private enum enumMixinStr___SYSCALL_WORDSIZE = `enum __SYSCALL_WORDSIZE = 64;`;
        static if(is(typeof({ mixin(enumMixinStr___SYSCALL_WORDSIZE); }))) {
            mixin(enumMixinStr___SYSCALL_WORDSIZE);
        }
    }




    static if(!is(typeof(__WORDSIZE_TIME64_COMPAT32))) {
        private enum enumMixinStr___WORDSIZE_TIME64_COMPAT32 = `enum __WORDSIZE_TIME64_COMPAT32 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___WORDSIZE_TIME64_COMPAT32); }))) {
            mixin(enumMixinStr___WORDSIZE_TIME64_COMPAT32);
        }
    }




    static if(!is(typeof(__WORDSIZE))) {
        private enum enumMixinStr___WORDSIZE = `enum __WORDSIZE = 64;`;
        static if(is(typeof({ mixin(enumMixinStr___WORDSIZE); }))) {
            mixin(enumMixinStr___WORDSIZE);
        }
    }




    static if(!is(typeof(__WCHAR_MIN))) {
        private enum enumMixinStr___WCHAR_MIN = `enum __WCHAR_MIN = ( - __WCHAR_MAX - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr___WCHAR_MIN); }))) {
            mixin(enumMixinStr___WCHAR_MIN);
        }
    }




    static if(!is(typeof(__WCHAR_MAX))) {
        private enum enumMixinStr___WCHAR_MAX = `enum __WCHAR_MAX = 0x7fffffff;`;
        static if(is(typeof({ mixin(enumMixinStr___WCHAR_MAX); }))) {
            mixin(enumMixinStr___WCHAR_MAX);
        }
    }




    static if(!is(typeof(_BITS_WCHAR_H))) {
        private enum enumMixinStr__BITS_WCHAR_H = `enum _BITS_WCHAR_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_WCHAR_H); }))) {
            mixin(enumMixinStr__BITS_WCHAR_H);
        }
    }




    static if(!is(typeof(__WCOREFLAG))) {
        private enum enumMixinStr___WCOREFLAG = `enum __WCOREFLAG = 0x80;`;
        static if(is(typeof({ mixin(enumMixinStr___WCOREFLAG); }))) {
            mixin(enumMixinStr___WCOREFLAG);
        }
    }




    static if(!is(typeof(__W_CONTINUED))) {
        private enum enumMixinStr___W_CONTINUED = `enum __W_CONTINUED = 0xffff;`;
        static if(is(typeof({ mixin(enumMixinStr___W_CONTINUED); }))) {
            mixin(enumMixinStr___W_CONTINUED);
        }
    }
    static if(!is(typeof(__WCLONE))) {
        private enum enumMixinStr___WCLONE = `enum __WCLONE = 0x80000000;`;
        static if(is(typeof({ mixin(enumMixinStr___WCLONE); }))) {
            mixin(enumMixinStr___WCLONE);
        }
    }




    static if(!is(typeof(__WALL))) {
        private enum enumMixinStr___WALL = `enum __WALL = 0x40000000;`;
        static if(is(typeof({ mixin(enumMixinStr___WALL); }))) {
            mixin(enumMixinStr___WALL);
        }
    }




    static if(!is(typeof(__WNOTHREAD))) {
        private enum enumMixinStr___WNOTHREAD = `enum __WNOTHREAD = 0x20000000;`;
        static if(is(typeof({ mixin(enumMixinStr___WNOTHREAD); }))) {
            mixin(enumMixinStr___WNOTHREAD);
        }
    }




    static if(!is(typeof(WNOWAIT))) {
        private enum enumMixinStr_WNOWAIT = `enum WNOWAIT = 0x01000000;`;
        static if(is(typeof({ mixin(enumMixinStr_WNOWAIT); }))) {
            mixin(enumMixinStr_WNOWAIT);
        }
    }




    static if(!is(typeof(WCONTINUED))) {
        private enum enumMixinStr_WCONTINUED = `enum WCONTINUED = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_WCONTINUED); }))) {
            mixin(enumMixinStr_WCONTINUED);
        }
    }




    static if(!is(typeof(WEXITED))) {
        private enum enumMixinStr_WEXITED = `enum WEXITED = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_WEXITED); }))) {
            mixin(enumMixinStr_WEXITED);
        }
    }




    static if(!is(typeof(WSTOPPED))) {
        private enum enumMixinStr_WSTOPPED = `enum WSTOPPED = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_WSTOPPED); }))) {
            mixin(enumMixinStr_WSTOPPED);
        }
    }




    static if(!is(typeof(WUNTRACED))) {
        private enum enumMixinStr_WUNTRACED = `enum WUNTRACED = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_WUNTRACED); }))) {
            mixin(enumMixinStr_WUNTRACED);
        }
    }




    static if(!is(typeof(WNOHANG))) {
        private enum enumMixinStr_WNOHANG = `enum WNOHANG = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_WNOHANG); }))) {
            mixin(enumMixinStr_WNOHANG);
        }
    }




    static if(!is(typeof(_BITS_UINTN_IDENTITY_H))) {
        private enum enumMixinStr__BITS_UINTN_IDENTITY_H = `enum _BITS_UINTN_IDENTITY_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_UINTN_IDENTITY_H); }))) {
            mixin(enumMixinStr__BITS_UINTN_IDENTITY_H);
        }
    }




    static if(!is(typeof(__FD_SETSIZE))) {
        private enum enumMixinStr___FD_SETSIZE = `enum __FD_SETSIZE = 1024;`;
        static if(is(typeof({ mixin(enumMixinStr___FD_SETSIZE); }))) {
            mixin(enumMixinStr___FD_SETSIZE);
        }
    }




    static if(!is(typeof(__RLIM_T_MATCHES_RLIM64_T))) {
        private enum enumMixinStr___RLIM_T_MATCHES_RLIM64_T = `enum __RLIM_T_MATCHES_RLIM64_T = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___RLIM_T_MATCHES_RLIM64_T); }))) {
            mixin(enumMixinStr___RLIM_T_MATCHES_RLIM64_T);
        }
    }




    static if(!is(typeof(__INO_T_MATCHES_INO64_T))) {
        private enum enumMixinStr___INO_T_MATCHES_INO64_T = `enum __INO_T_MATCHES_INO64_T = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___INO_T_MATCHES_INO64_T); }))) {
            mixin(enumMixinStr___INO_T_MATCHES_INO64_T);
        }
    }




    static if(!is(typeof(__OFF_T_MATCHES_OFF64_T))) {
        private enum enumMixinStr___OFF_T_MATCHES_OFF64_T = `enum __OFF_T_MATCHES_OFF64_T = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___OFF_T_MATCHES_OFF64_T); }))) {
            mixin(enumMixinStr___OFF_T_MATCHES_OFF64_T);
        }
    }




    static if(!is(typeof(__CPU_MASK_TYPE))) {
        private enum enumMixinStr___CPU_MASK_TYPE = `enum __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___CPU_MASK_TYPE); }))) {
            mixin(enumMixinStr___CPU_MASK_TYPE);
        }
    }




    static if(!is(typeof(__SSIZE_T_TYPE))) {
        private enum enumMixinStr___SSIZE_T_TYPE = `enum __SSIZE_T_TYPE = __SWORD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___SSIZE_T_TYPE); }))) {
            mixin(enumMixinStr___SSIZE_T_TYPE);
        }
    }




    static if(!is(typeof(__FSID_T_TYPE))) {
        private enum enumMixinStr___FSID_T_TYPE = `enum __FSID_T_TYPE = { int __val [ 2 ] ; };`;
        static if(is(typeof({ mixin(enumMixinStr___FSID_T_TYPE); }))) {
            mixin(enumMixinStr___FSID_T_TYPE);
        }
    }




    static if(!is(typeof(__BLKSIZE_T_TYPE))) {
        private enum enumMixinStr___BLKSIZE_T_TYPE = `enum __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___BLKSIZE_T_TYPE); }))) {
            mixin(enumMixinStr___BLKSIZE_T_TYPE);
        }
    }




    static if(!is(typeof(__TIMER_T_TYPE))) {
        private enum enumMixinStr___TIMER_T_TYPE = `enum __TIMER_T_TYPE = void *;`;
        static if(is(typeof({ mixin(enumMixinStr___TIMER_T_TYPE); }))) {
            mixin(enumMixinStr___TIMER_T_TYPE);
        }
    }




    static if(!is(typeof(__CLOCKID_T_TYPE))) {
        private enum enumMixinStr___CLOCKID_T_TYPE = `enum __CLOCKID_T_TYPE = __S32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___CLOCKID_T_TYPE); }))) {
            mixin(enumMixinStr___CLOCKID_T_TYPE);
        }
    }




    static if(!is(typeof(__KEY_T_TYPE))) {
        private enum enumMixinStr___KEY_T_TYPE = `enum __KEY_T_TYPE = __S32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___KEY_T_TYPE); }))) {
            mixin(enumMixinStr___KEY_T_TYPE);
        }
    }




    static if(!is(typeof(__DADDR_T_TYPE))) {
        private enum enumMixinStr___DADDR_T_TYPE = `enum __DADDR_T_TYPE = __S32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___DADDR_T_TYPE); }))) {
            mixin(enumMixinStr___DADDR_T_TYPE);
        }
    }




    static if(!is(typeof(__SUSECONDS_T_TYPE))) {
        private enum enumMixinStr___SUSECONDS_T_TYPE = `enum __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___SUSECONDS_T_TYPE); }))) {
            mixin(enumMixinStr___SUSECONDS_T_TYPE);
        }
    }




    static if(!is(typeof(__USECONDS_T_TYPE))) {
        private enum enumMixinStr___USECONDS_T_TYPE = `enum __USECONDS_T_TYPE = __U32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___USECONDS_T_TYPE); }))) {
            mixin(enumMixinStr___USECONDS_T_TYPE);
        }
    }




    static if(!is(typeof(__TIME_T_TYPE))) {
        private enum enumMixinStr___TIME_T_TYPE = `enum __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___TIME_T_TYPE); }))) {
            mixin(enumMixinStr___TIME_T_TYPE);
        }
    }




    static if(!is(typeof(__CLOCK_T_TYPE))) {
        private enum enumMixinStr___CLOCK_T_TYPE = `enum __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___CLOCK_T_TYPE); }))) {
            mixin(enumMixinStr___CLOCK_T_TYPE);
        }
    }




    static if(!is(typeof(__ID_T_TYPE))) {
        private enum enumMixinStr___ID_T_TYPE = `enum __ID_T_TYPE = __U32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___ID_T_TYPE); }))) {
            mixin(enumMixinStr___ID_T_TYPE);
        }
    }




    static if(!is(typeof(__FSFILCNT64_T_TYPE))) {
        private enum enumMixinStr___FSFILCNT64_T_TYPE = `enum __FSFILCNT64_T_TYPE = __UQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___FSFILCNT64_T_TYPE); }))) {
            mixin(enumMixinStr___FSFILCNT64_T_TYPE);
        }
    }




    static if(!is(typeof(__FSFILCNT_T_TYPE))) {
        private enum enumMixinStr___FSFILCNT_T_TYPE = `enum __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___FSFILCNT_T_TYPE); }))) {
            mixin(enumMixinStr___FSFILCNT_T_TYPE);
        }
    }




    static if(!is(typeof(__FSBLKCNT64_T_TYPE))) {
        private enum enumMixinStr___FSBLKCNT64_T_TYPE = `enum __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___FSBLKCNT64_T_TYPE); }))) {
            mixin(enumMixinStr___FSBLKCNT64_T_TYPE);
        }
    }




    static if(!is(typeof(__FSBLKCNT_T_TYPE))) {
        private enum enumMixinStr___FSBLKCNT_T_TYPE = `enum __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___FSBLKCNT_T_TYPE); }))) {
            mixin(enumMixinStr___FSBLKCNT_T_TYPE);
        }
    }




    static if(!is(typeof(__BLKCNT64_T_TYPE))) {
        private enum enumMixinStr___BLKCNT64_T_TYPE = `enum __BLKCNT64_T_TYPE = __SQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___BLKCNT64_T_TYPE); }))) {
            mixin(enumMixinStr___BLKCNT64_T_TYPE);
        }
    }




    static if(!is(typeof(__BLKCNT_T_TYPE))) {
        private enum enumMixinStr___BLKCNT_T_TYPE = `enum __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___BLKCNT_T_TYPE); }))) {
            mixin(enumMixinStr___BLKCNT_T_TYPE);
        }
    }




    static if(!is(typeof(__RLIM64_T_TYPE))) {
        private enum enumMixinStr___RLIM64_T_TYPE = `enum __RLIM64_T_TYPE = __UQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___RLIM64_T_TYPE); }))) {
            mixin(enumMixinStr___RLIM64_T_TYPE);
        }
    }




    static if(!is(typeof(__RLIM_T_TYPE))) {
        private enum enumMixinStr___RLIM_T_TYPE = `enum __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___RLIM_T_TYPE); }))) {
            mixin(enumMixinStr___RLIM_T_TYPE);
        }
    }




    static if(!is(typeof(__PID_T_TYPE))) {
        private enum enumMixinStr___PID_T_TYPE = `enum __PID_T_TYPE = __S32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___PID_T_TYPE); }))) {
            mixin(enumMixinStr___PID_T_TYPE);
        }
    }




    static if(!is(typeof(__OFF64_T_TYPE))) {
        private enum enumMixinStr___OFF64_T_TYPE = `enum __OFF64_T_TYPE = __SQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___OFF64_T_TYPE); }))) {
            mixin(enumMixinStr___OFF64_T_TYPE);
        }
    }




    static if(!is(typeof(__OFF_T_TYPE))) {
        private enum enumMixinStr___OFF_T_TYPE = `enum __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___OFF_T_TYPE); }))) {
            mixin(enumMixinStr___OFF_T_TYPE);
        }
    }




    static if(!is(typeof(__FSWORD_T_TYPE))) {
        private enum enumMixinStr___FSWORD_T_TYPE = `enum __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___FSWORD_T_TYPE); }))) {
            mixin(enumMixinStr___FSWORD_T_TYPE);
        }
    }




    static if(!is(typeof(__NLINK_T_TYPE))) {
        private enum enumMixinStr___NLINK_T_TYPE = `enum __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___NLINK_T_TYPE); }))) {
            mixin(enumMixinStr___NLINK_T_TYPE);
        }
    }




    static if(!is(typeof(__MODE_T_TYPE))) {
        private enum enumMixinStr___MODE_T_TYPE = `enum __MODE_T_TYPE = __U32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___MODE_T_TYPE); }))) {
            mixin(enumMixinStr___MODE_T_TYPE);
        }
    }




    static if(!is(typeof(__INO64_T_TYPE))) {
        private enum enumMixinStr___INO64_T_TYPE = `enum __INO64_T_TYPE = __UQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___INO64_T_TYPE); }))) {
            mixin(enumMixinStr___INO64_T_TYPE);
        }
    }




    static if(!is(typeof(__INO_T_TYPE))) {
        private enum enumMixinStr___INO_T_TYPE = `enum __INO_T_TYPE = __SYSCALL_ULONG_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___INO_T_TYPE); }))) {
            mixin(enumMixinStr___INO_T_TYPE);
        }
    }




    static if(!is(typeof(__GID_T_TYPE))) {
        private enum enumMixinStr___GID_T_TYPE = `enum __GID_T_TYPE = __U32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___GID_T_TYPE); }))) {
            mixin(enumMixinStr___GID_T_TYPE);
        }
    }




    static if(!is(typeof(__UID_T_TYPE))) {
        private enum enumMixinStr___UID_T_TYPE = `enum __UID_T_TYPE = __U32_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___UID_T_TYPE); }))) {
            mixin(enumMixinStr___UID_T_TYPE);
        }
    }




    static if(!is(typeof(__DEV_T_TYPE))) {
        private enum enumMixinStr___DEV_T_TYPE = `enum __DEV_T_TYPE = __UQUAD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___DEV_T_TYPE); }))) {
            mixin(enumMixinStr___DEV_T_TYPE);
        }
    }




    static if(!is(typeof(__SYSCALL_ULONG_TYPE))) {
        private enum enumMixinStr___SYSCALL_ULONG_TYPE = `enum __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___SYSCALL_ULONG_TYPE); }))) {
            mixin(enumMixinStr___SYSCALL_ULONG_TYPE);
        }
    }




    static if(!is(typeof(__SYSCALL_SLONG_TYPE))) {
        private enum enumMixinStr___SYSCALL_SLONG_TYPE = `enum __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;`;
        static if(is(typeof({ mixin(enumMixinStr___SYSCALL_SLONG_TYPE); }))) {
            mixin(enumMixinStr___SYSCALL_SLONG_TYPE);
        }
    }




    static if(!is(typeof(_BITS_TYPESIZES_H))) {
        private enum enumMixinStr__BITS_TYPESIZES_H = `enum _BITS_TYPESIZES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TYPESIZES_H); }))) {
            mixin(enumMixinStr__BITS_TYPESIZES_H);
        }
    }




    static if(!is(typeof(__timer_t_defined))) {
        private enum enumMixinStr___timer_t_defined = `enum __timer_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___timer_t_defined); }))) {
            mixin(enumMixinStr___timer_t_defined);
        }
    }




    static if(!is(typeof(__time_t_defined))) {
        private enum enumMixinStr___time_t_defined = `enum __time_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___time_t_defined); }))) {
            mixin(enumMixinStr___time_t_defined);
        }
    }




    static if(!is(typeof(__timeval_defined))) {
        private enum enumMixinStr___timeval_defined = `enum __timeval_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___timeval_defined); }))) {
            mixin(enumMixinStr___timeval_defined);
        }
    }




    static if(!is(typeof(_STRUCT_TIMESPEC))) {
        private enum enumMixinStr__STRUCT_TIMESPEC = `enum _STRUCT_TIMESPEC = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STRUCT_TIMESPEC); }))) {
            mixin(enumMixinStr__STRUCT_TIMESPEC);
        }
    }




    static if(!is(typeof(_IO_USER_LOCK))) {
        private enum enumMixinStr__IO_USER_LOCK = `enum _IO_USER_LOCK = 0x8000;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_USER_LOCK); }))) {
            mixin(enumMixinStr__IO_USER_LOCK);
        }
    }






    static if(!is(typeof(_IO_ERR_SEEN))) {
        private enum enumMixinStr__IO_ERR_SEEN = `enum _IO_ERR_SEEN = 0x0020;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_ERR_SEEN); }))) {
            mixin(enumMixinStr__IO_ERR_SEEN);
        }
    }






    static if(!is(typeof(_IO_EOF_SEEN))) {
        private enum enumMixinStr__IO_EOF_SEEN = `enum _IO_EOF_SEEN = 0x0010;`;
        static if(is(typeof({ mixin(enumMixinStr__IO_EOF_SEEN); }))) {
            mixin(enumMixinStr__IO_EOF_SEEN);
        }
    }
    static if(!is(typeof(__struct_FILE_defined))) {
        private enum enumMixinStr___struct_FILE_defined = `enum __struct_FILE_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___struct_FILE_defined); }))) {
            mixin(enumMixinStr___struct_FILE_defined);
        }
    }




    static if(!is(typeof(__sigset_t_defined))) {
        private enum enumMixinStr___sigset_t_defined = `enum __sigset_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___sigset_t_defined); }))) {
            mixin(enumMixinStr___sigset_t_defined);
        }
    }




    static if(!is(typeof(_BITS_TYPES_LOCALE_T_H))) {
        private enum enumMixinStr__BITS_TYPES_LOCALE_T_H = `enum _BITS_TYPES_LOCALE_T_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TYPES_LOCALE_T_H); }))) {
            mixin(enumMixinStr__BITS_TYPES_LOCALE_T_H);
        }
    }




    static if(!is(typeof(__clockid_t_defined))) {
        private enum enumMixinStr___clockid_t_defined = `enum __clockid_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___clockid_t_defined); }))) {
            mixin(enumMixinStr___clockid_t_defined);
        }
    }




    static if(!is(typeof(__clock_t_defined))) {
        private enum enumMixinStr___clock_t_defined = `enum __clock_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___clock_t_defined); }))) {
            mixin(enumMixinStr___clock_t_defined);
        }
    }




    static if(!is(typeof(_SIGSET_NWORDS))) {
        private enum enumMixinStr__SIGSET_NWORDS = `enum _SIGSET_NWORDS = ( 1024 / ( 8 * ( unsigned long int ) .sizeof ) );`;
        static if(is(typeof({ mixin(enumMixinStr__SIGSET_NWORDS); }))) {
            mixin(enumMixinStr__SIGSET_NWORDS);
        }
    }






    static if(!is(typeof(____mbstate_t_defined))) {
        private enum enumMixinStr_____mbstate_t_defined = `enum ____mbstate_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_____mbstate_t_defined); }))) {
            mixin(enumMixinStr_____mbstate_t_defined);
        }
    }




    static if(!is(typeof(_BITS_TYPES___LOCALE_T_H))) {
        private enum enumMixinStr__BITS_TYPES___LOCALE_T_H = `enum _BITS_TYPES___LOCALE_T_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TYPES___LOCALE_T_H); }))) {
            mixin(enumMixinStr__BITS_TYPES___LOCALE_T_H);
        }
    }




    static if(!is(typeof(_____fpos_t_defined))) {
        private enum enumMixinStr______fpos_t_defined = `enum _____fpos_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr______fpos_t_defined); }))) {
            mixin(enumMixinStr______fpos_t_defined);
        }
    }




    static if(!is(typeof(_____fpos64_t_defined))) {
        private enum enumMixinStr______fpos64_t_defined = `enum _____fpos64_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr______fpos64_t_defined); }))) {
            mixin(enumMixinStr______fpos64_t_defined);
        }
    }




    static if(!is(typeof(____FILE_defined))) {
        private enum enumMixinStr_____FILE_defined = `enum ____FILE_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_____FILE_defined); }))) {
            mixin(enumMixinStr_____FILE_defined);
        }
    }




    static if(!is(typeof(__FILE_defined))) {
        private enum enumMixinStr___FILE_defined = `enum __FILE_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___FILE_defined); }))) {
            mixin(enumMixinStr___FILE_defined);
        }
    }




    static if(!is(typeof(__STD_TYPE))) {
        private enum enumMixinStr___STD_TYPE = `enum __STD_TYPE = typedef;`;
        static if(is(typeof({ mixin(enumMixinStr___STD_TYPE); }))) {
            mixin(enumMixinStr___STD_TYPE);
        }
    }




    static if(!is(typeof(__U64_TYPE))) {
        private enum enumMixinStr___U64_TYPE = `enum __U64_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___U64_TYPE); }))) {
            mixin(enumMixinStr___U64_TYPE);
        }
    }




    static if(!is(typeof(__S64_TYPE))) {
        private enum enumMixinStr___S64_TYPE = `enum __S64_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___S64_TYPE); }))) {
            mixin(enumMixinStr___S64_TYPE);
        }
    }




    static if(!is(typeof(__ULONG32_TYPE))) {
        private enum enumMixinStr___ULONG32_TYPE = `enum __ULONG32_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___ULONG32_TYPE); }))) {
            mixin(enumMixinStr___ULONG32_TYPE);
        }
    }




    static if(!is(typeof(__SLONG32_TYPE))) {
        private enum enumMixinStr___SLONG32_TYPE = `enum __SLONG32_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___SLONG32_TYPE); }))) {
            mixin(enumMixinStr___SLONG32_TYPE);
        }
    }




    static if(!is(typeof(__UWORD_TYPE))) {
        private enum enumMixinStr___UWORD_TYPE = `enum __UWORD_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___UWORD_TYPE); }))) {
            mixin(enumMixinStr___UWORD_TYPE);
        }
    }




    static if(!is(typeof(__SWORD_TYPE))) {
        private enum enumMixinStr___SWORD_TYPE = `enum __SWORD_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SWORD_TYPE); }))) {
            mixin(enumMixinStr___SWORD_TYPE);
        }
    }




    static if(!is(typeof(__UQUAD_TYPE))) {
        private enum enumMixinStr___UQUAD_TYPE = `enum __UQUAD_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___UQUAD_TYPE); }))) {
            mixin(enumMixinStr___UQUAD_TYPE);
        }
    }




    static if(!is(typeof(__SQUAD_TYPE))) {
        private enum enumMixinStr___SQUAD_TYPE = `enum __SQUAD_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SQUAD_TYPE); }))) {
            mixin(enumMixinStr___SQUAD_TYPE);
        }
    }




    static if(!is(typeof(__ULONGWORD_TYPE))) {
        private enum enumMixinStr___ULONGWORD_TYPE = `enum __ULONGWORD_TYPE = unsigned long int;`;
        static if(is(typeof({ mixin(enumMixinStr___ULONGWORD_TYPE); }))) {
            mixin(enumMixinStr___ULONGWORD_TYPE);
        }
    }




    static if(!is(typeof(__SLONGWORD_TYPE))) {
        private enum enumMixinStr___SLONGWORD_TYPE = `enum __SLONGWORD_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___SLONGWORD_TYPE); }))) {
            mixin(enumMixinStr___SLONGWORD_TYPE);
        }
    }




    static if(!is(typeof(__U32_TYPE))) {
        private enum enumMixinStr___U32_TYPE = `enum __U32_TYPE = unsigned int;`;
        static if(is(typeof({ mixin(enumMixinStr___U32_TYPE); }))) {
            mixin(enumMixinStr___U32_TYPE);
        }
    }




    static if(!is(typeof(__S32_TYPE))) {
        private enum enumMixinStr___S32_TYPE = `enum __S32_TYPE = int;`;
        static if(is(typeof({ mixin(enumMixinStr___S32_TYPE); }))) {
            mixin(enumMixinStr___S32_TYPE);
        }
    }




    static if(!is(typeof(__U16_TYPE))) {
        private enum enumMixinStr___U16_TYPE = `enum __U16_TYPE = unsigned short int;`;
        static if(is(typeof({ mixin(enumMixinStr___U16_TYPE); }))) {
            mixin(enumMixinStr___U16_TYPE);
        }
    }




    static if(!is(typeof(__S16_TYPE))) {
        private enum enumMixinStr___S16_TYPE = `enum __S16_TYPE = short int;`;
        static if(is(typeof({ mixin(enumMixinStr___S16_TYPE); }))) {
            mixin(enumMixinStr___S16_TYPE);
        }
    }




    static if(!is(typeof(_BITS_TYPES_H))) {
        private enum enumMixinStr__BITS_TYPES_H = `enum _BITS_TYPES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TYPES_H); }))) {
            mixin(enumMixinStr__BITS_TYPES_H);
        }
    }




    static if(!is(typeof(__TIMESIZE))) {
        private enum enumMixinStr___TIMESIZE = `enum __TIMESIZE = 64;`;
        static if(is(typeof({ mixin(enumMixinStr___TIMESIZE); }))) {
            mixin(enumMixinStr___TIMESIZE);
        }
    }




    static if(!is(typeof(__TIME64_T_TYPE))) {
        private enum enumMixinStr___TIME64_T_TYPE = `enum __TIME64_T_TYPE = long int;`;
        static if(is(typeof({ mixin(enumMixinStr___TIME64_T_TYPE); }))) {
            mixin(enumMixinStr___TIME64_T_TYPE);
        }
    }




    static if(!is(typeof(_BITS_TIME64_H))) {
        private enum enumMixinStr__BITS_TIME64_H = `enum _BITS_TIME64_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TIME64_H); }))) {
            mixin(enumMixinStr__BITS_TIME64_H);
        }
    }




    static if(!is(typeof(__PTHREAD_MUTEX_HAVE_PREV))) {
        private enum enumMixinStr___PTHREAD_MUTEX_HAVE_PREV = `enum __PTHREAD_MUTEX_HAVE_PREV = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___PTHREAD_MUTEX_HAVE_PREV); }))) {
            mixin(enumMixinStr___PTHREAD_MUTEX_HAVE_PREV);
        }
    }




    static if(!is(typeof(__PTHREAD_SPINS))) {
        private enum enumMixinStr___PTHREAD_SPINS = `enum __PTHREAD_SPINS = 0 , 0;`;
        static if(is(typeof({ mixin(enumMixinStr___PTHREAD_SPINS); }))) {
            mixin(enumMixinStr___PTHREAD_SPINS);
        }
    }




    static if(!is(typeof(__PTHREAD_SPINS_DATA))) {
        private enum enumMixinStr___PTHREAD_SPINS_DATA = `enum __PTHREAD_SPINS_DATA = short __spins ; short __elision;`;
        static if(is(typeof({ mixin(enumMixinStr___PTHREAD_SPINS_DATA); }))) {
            mixin(enumMixinStr___PTHREAD_SPINS_DATA);
        }
    }




    static if(!is(typeof(_THREAD_SHARED_TYPES_H))) {
        private enum enumMixinStr__THREAD_SHARED_TYPES_H = `enum _THREAD_SHARED_TYPES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__THREAD_SHARED_TYPES_H); }))) {
            mixin(enumMixinStr__THREAD_SHARED_TYPES_H);
        }
    }




    static if(!is(typeof(FOPEN_MAX))) {
        private enum enumMixinStr_FOPEN_MAX = `enum FOPEN_MAX = 16;`;
        static if(is(typeof({ mixin(enumMixinStr_FOPEN_MAX); }))) {
            mixin(enumMixinStr_FOPEN_MAX);
        }
    }




    static if(!is(typeof(L_ctermid))) {
        private enum enumMixinStr_L_ctermid = `enum L_ctermid = 9;`;
        static if(is(typeof({ mixin(enumMixinStr_L_ctermid); }))) {
            mixin(enumMixinStr_L_ctermid);
        }
    }




    static if(!is(typeof(FILENAME_MAX))) {
        private enum enumMixinStr_FILENAME_MAX = `enum FILENAME_MAX = 4096;`;
        static if(is(typeof({ mixin(enumMixinStr_FILENAME_MAX); }))) {
            mixin(enumMixinStr_FILENAME_MAX);
        }
    }




    static if(!is(typeof(TMP_MAX))) {
        private enum enumMixinStr_TMP_MAX = `enum TMP_MAX = 238328;`;
        static if(is(typeof({ mixin(enumMixinStr_TMP_MAX); }))) {
            mixin(enumMixinStr_TMP_MAX);
        }
    }




    static if(!is(typeof(L_tmpnam))) {
        private enum enumMixinStr_L_tmpnam = `enum L_tmpnam = 20;`;
        static if(is(typeof({ mixin(enumMixinStr_L_tmpnam); }))) {
            mixin(enumMixinStr_L_tmpnam);
        }
    }




    static if(!is(typeof(_BITS_STDIO_LIM_H))) {
        private enum enumMixinStr__BITS_STDIO_LIM_H = `enum _BITS_STDIO_LIM_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_STDIO_LIM_H); }))) {
            mixin(enumMixinStr__BITS_STDIO_LIM_H);
        }
    }




    static if(!is(typeof(_BITS_STDINT_UINTN_H))) {
        private enum enumMixinStr__BITS_STDINT_UINTN_H = `enum _BITS_STDINT_UINTN_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_STDINT_UINTN_H); }))) {
            mixin(enumMixinStr__BITS_STDINT_UINTN_H);
        }
    }




    static if(!is(typeof(_BITS_STDINT_INTN_H))) {
        private enum enumMixinStr__BITS_STDINT_INTN_H = `enum _BITS_STDINT_INTN_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_STDINT_INTN_H); }))) {
            mixin(enumMixinStr__BITS_STDINT_INTN_H);
        }
    }
    static if(!is(typeof(__FD_ZERO_STOS))) {
        private enum enumMixinStr___FD_ZERO_STOS = `enum __FD_ZERO_STOS = "stosq";`;
        static if(is(typeof({ mixin(enumMixinStr___FD_ZERO_STOS); }))) {
            mixin(enumMixinStr___FD_ZERO_STOS);
        }
    }




    static if(!is(typeof(__have_pthread_attr_t))) {
        private enum enumMixinStr___have_pthread_attr_t = `enum __have_pthread_attr_t = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___have_pthread_attr_t); }))) {
            mixin(enumMixinStr___have_pthread_attr_t);
        }
    }




    static if(!is(typeof(_BITS_PTHREADTYPES_COMMON_H))) {
        private enum enumMixinStr__BITS_PTHREADTYPES_COMMON_H = `enum _BITS_PTHREADTYPES_COMMON_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_PTHREADTYPES_COMMON_H); }))) {
            mixin(enumMixinStr__BITS_PTHREADTYPES_COMMON_H);
        }
    }




    static if(!is(typeof(__PTHREAD_RWLOCK_INT_FLAGS_SHARED))) {
        private enum enumMixinStr___PTHREAD_RWLOCK_INT_FLAGS_SHARED = `enum __PTHREAD_RWLOCK_INT_FLAGS_SHARED = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___PTHREAD_RWLOCK_INT_FLAGS_SHARED); }))) {
            mixin(enumMixinStr___PTHREAD_RWLOCK_INT_FLAGS_SHARED);
        }
    }




    static if(!is(typeof(__PTHREAD_RWLOCK_ELISION_EXTRA))) {
        private enum enumMixinStr___PTHREAD_RWLOCK_ELISION_EXTRA = `enum __PTHREAD_RWLOCK_ELISION_EXTRA = 0 , { 0 , 0 , 0 , 0 , 0 , 0 , 0 };`;
        static if(is(typeof({ mixin(enumMixinStr___PTHREAD_RWLOCK_ELISION_EXTRA); }))) {
            mixin(enumMixinStr___PTHREAD_RWLOCK_ELISION_EXTRA);
        }
    }
    static if(!is(typeof(__PTHREAD_MUTEX_USE_UNION))) {
        private enum enumMixinStr___PTHREAD_MUTEX_USE_UNION = `enum __PTHREAD_MUTEX_USE_UNION = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___PTHREAD_MUTEX_USE_UNION); }))) {
            mixin(enumMixinStr___PTHREAD_MUTEX_USE_UNION);
        }
    }




    static if(!is(typeof(__PTHREAD_MUTEX_NUSERS_AFTER_KIND))) {
        private enum enumMixinStr___PTHREAD_MUTEX_NUSERS_AFTER_KIND = `enum __PTHREAD_MUTEX_NUSERS_AFTER_KIND = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___PTHREAD_MUTEX_NUSERS_AFTER_KIND); }))) {
            mixin(enumMixinStr___PTHREAD_MUTEX_NUSERS_AFTER_KIND);
        }
    }




    static if(!is(typeof(__PTHREAD_MUTEX_LOCK_ELISION))) {
        private enum enumMixinStr___PTHREAD_MUTEX_LOCK_ELISION = `enum __PTHREAD_MUTEX_LOCK_ELISION = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___PTHREAD_MUTEX_LOCK_ELISION); }))) {
            mixin(enumMixinStr___PTHREAD_MUTEX_LOCK_ELISION);
        }
    }
    static if(!is(typeof(__SIZEOF_PTHREAD_BARRIERATTR_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_BARRIERATTR_T = `enum __SIZEOF_PTHREAD_BARRIERATTR_T = 4;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIERATTR_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIERATTR_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_RWLOCKATTR_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_RWLOCKATTR_T = `enum __SIZEOF_PTHREAD_RWLOCKATTR_T = 8;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCKATTR_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCKATTR_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_CONDATTR_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_CONDATTR_T = `enum __SIZEOF_PTHREAD_CONDATTR_T = 4;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_CONDATTR_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_CONDATTR_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_COND_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_COND_T = `enum __SIZEOF_PTHREAD_COND_T = 48;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_COND_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_COND_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_MUTEXATTR_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_MUTEXATTR_T = `enum __SIZEOF_PTHREAD_MUTEXATTR_T = 4;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEXATTR_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEXATTR_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_BARRIER_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_BARRIER_T = `enum __SIZEOF_PTHREAD_BARRIER_T = 32;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIER_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_BARRIER_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_RWLOCK_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_RWLOCK_T = `enum __SIZEOF_PTHREAD_RWLOCK_T = 56;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCK_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_RWLOCK_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_MUTEX_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_MUTEX_T = `enum __SIZEOF_PTHREAD_MUTEX_T = 40;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEX_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_MUTEX_T);
        }
    }




    static if(!is(typeof(__SIZEOF_PTHREAD_ATTR_T))) {
        private enum enumMixinStr___SIZEOF_PTHREAD_ATTR_T = `enum __SIZEOF_PTHREAD_ATTR_T = 56;`;
        static if(is(typeof({ mixin(enumMixinStr___SIZEOF_PTHREAD_ATTR_T); }))) {
            mixin(enumMixinStr___SIZEOF_PTHREAD_ATTR_T);
        }
    }




    static if(!is(typeof(_BITS_PTHREADTYPES_ARCH_H))) {
        private enum enumMixinStr__BITS_PTHREADTYPES_ARCH_H = `enum _BITS_PTHREADTYPES_ARCH_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_PTHREADTYPES_ARCH_H); }))) {
            mixin(enumMixinStr__BITS_PTHREADTYPES_ARCH_H);
        }
    }




    static if(!is(typeof(_POSIX_TYPED_MEMORY_OBJECTS))) {
        private enum enumMixinStr__POSIX_TYPED_MEMORY_OBJECTS = `enum _POSIX_TYPED_MEMORY_OBJECTS = - 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_TYPED_MEMORY_OBJECTS); }))) {
            mixin(enumMixinStr__POSIX_TYPED_MEMORY_OBJECTS);
        }
    }




    static if(!is(typeof(_POSIX_TRACE_LOG))) {
        private enum enumMixinStr__POSIX_TRACE_LOG = `enum _POSIX_TRACE_LOG = - 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_TRACE_LOG); }))) {
            mixin(enumMixinStr__POSIX_TRACE_LOG);
        }
    }




    static if(!is(typeof(_POSIX_TRACE_INHERIT))) {
        private enum enumMixinStr__POSIX_TRACE_INHERIT = `enum _POSIX_TRACE_INHERIT = - 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_TRACE_INHERIT); }))) {
            mixin(enumMixinStr__POSIX_TRACE_INHERIT);
        }
    }




    static if(!is(typeof(_POSIX_TRACE_EVENT_FILTER))) {
        private enum enumMixinStr__POSIX_TRACE_EVENT_FILTER = `enum _POSIX_TRACE_EVENT_FILTER = - 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_TRACE_EVENT_FILTER); }))) {
            mixin(enumMixinStr__POSIX_TRACE_EVENT_FILTER);
        }
    }




    static if(!is(typeof(_POSIX_TRACE))) {
        private enum enumMixinStr__POSIX_TRACE = `enum _POSIX_TRACE = - 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_TRACE); }))) {
            mixin(enumMixinStr__POSIX_TRACE);
        }
    }




    static if(!is(typeof(_POSIX_THREAD_SPORADIC_SERVER))) {
        private enum enumMixinStr__POSIX_THREAD_SPORADIC_SERVER = `enum _POSIX_THREAD_SPORADIC_SERVER = - 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_THREAD_SPORADIC_SERVER); }))) {
            mixin(enumMixinStr__POSIX_THREAD_SPORADIC_SERVER);
        }
    }




    static if(!is(typeof(_POSIX_SPORADIC_SERVER))) {
        private enum enumMixinStr__POSIX_SPORADIC_SERVER = `enum _POSIX_SPORADIC_SERVER = - 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SPORADIC_SERVER); }))) {
            mixin(enumMixinStr__POSIX_SPORADIC_SERVER);
        }
    }




    static if(!is(typeof(_POSIX2_CHAR_TERM))) {
        private enum enumMixinStr__POSIX2_CHAR_TERM = `enum _POSIX2_CHAR_TERM = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_CHAR_TERM); }))) {
            mixin(enumMixinStr__POSIX2_CHAR_TERM);
        }
    }




    static if(!is(typeof(_POSIX_RAW_SOCKETS))) {
        private enum enumMixinStr__POSIX_RAW_SOCKETS = `enum _POSIX_RAW_SOCKETS = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_RAW_SOCKETS); }))) {
            mixin(enumMixinStr__POSIX_RAW_SOCKETS);
        }
    }




    static if(!is(typeof(_POSIX_IPV6))) {
        private enum enumMixinStr__POSIX_IPV6 = `enum _POSIX_IPV6 = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_IPV6); }))) {
            mixin(enumMixinStr__POSIX_IPV6);
        }
    }




    static if(!is(typeof(_POSIX_ADVISORY_INFO))) {
        private enum enumMixinStr__POSIX_ADVISORY_INFO = `enum _POSIX_ADVISORY_INFO = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_ADVISORY_INFO); }))) {
            mixin(enumMixinStr__POSIX_ADVISORY_INFO);
        }
    }




    static if(!is(typeof(_POSIX_CLOCK_SELECTION))) {
        private enum enumMixinStr__POSIX_CLOCK_SELECTION = `enum _POSIX_CLOCK_SELECTION = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_CLOCK_SELECTION); }))) {
            mixin(enumMixinStr__POSIX_CLOCK_SELECTION);
        }
    }




    static if(!is(typeof(_POSIX_MONOTONIC_CLOCK))) {
        private enum enumMixinStr__POSIX_MONOTONIC_CLOCK = `enum _POSIX_MONOTONIC_CLOCK = 0;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_MONOTONIC_CLOCK); }))) {
            mixin(enumMixinStr__POSIX_MONOTONIC_CLOCK);
        }
    }




    static if(!is(typeof(_POSIX_THREAD_PROCESS_SHARED))) {
        private enum enumMixinStr__POSIX_THREAD_PROCESS_SHARED = `enum _POSIX_THREAD_PROCESS_SHARED = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_THREAD_PROCESS_SHARED); }))) {
            mixin(enumMixinStr__POSIX_THREAD_PROCESS_SHARED);
        }
    }




    static if(!is(typeof(_POSIX_MESSAGE_PASSING))) {
        private enum enumMixinStr__POSIX_MESSAGE_PASSING = `enum _POSIX_MESSAGE_PASSING = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_MESSAGE_PASSING); }))) {
            mixin(enumMixinStr__POSIX_MESSAGE_PASSING);
        }
    }




    static if(!is(typeof(_POSIX_BARRIERS))) {
        private enum enumMixinStr__POSIX_BARRIERS = `enum _POSIX_BARRIERS = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_BARRIERS); }))) {
            mixin(enumMixinStr__POSIX_BARRIERS);
        }
    }




    static if(!is(typeof(_POSIX_TIMERS))) {
        private enum enumMixinStr__POSIX_TIMERS = `enum _POSIX_TIMERS = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_TIMERS); }))) {
            mixin(enumMixinStr__POSIX_TIMERS);
        }
    }




    static if(!is(typeof(_POSIX_SPAWN))) {
        private enum enumMixinStr__POSIX_SPAWN = `enum _POSIX_SPAWN = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SPAWN); }))) {
            mixin(enumMixinStr__POSIX_SPAWN);
        }
    }




    static if(!is(typeof(_POSIX_SPIN_LOCKS))) {
        private enum enumMixinStr__POSIX_SPIN_LOCKS = `enum _POSIX_SPIN_LOCKS = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SPIN_LOCKS); }))) {
            mixin(enumMixinStr__POSIX_SPIN_LOCKS);
        }
    }




    static if(!is(typeof(_POSIX_TIMEOUTS))) {
        private enum enumMixinStr__POSIX_TIMEOUTS = `enum _POSIX_TIMEOUTS = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_TIMEOUTS); }))) {
            mixin(enumMixinStr__POSIX_TIMEOUTS);
        }
    }




    static if(!is(typeof(_POSIX_SHELL))) {
        private enum enumMixinStr__POSIX_SHELL = `enum _POSIX_SHELL = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SHELL); }))) {
            mixin(enumMixinStr__POSIX_SHELL);
        }
    }




    static if(!is(typeof(_POSIX_READER_WRITER_LOCKS))) {
        private enum enumMixinStr__POSIX_READER_WRITER_LOCKS = `enum _POSIX_READER_WRITER_LOCKS = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_READER_WRITER_LOCKS); }))) {
            mixin(enumMixinStr__POSIX_READER_WRITER_LOCKS);
        }
    }




    static if(!is(typeof(_POSIX_REGEXP))) {
        private enum enumMixinStr__POSIX_REGEXP = `enum _POSIX_REGEXP = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_REGEXP); }))) {
            mixin(enumMixinStr__POSIX_REGEXP);
        }
    }




    static if(!is(typeof(_POSIX_THREAD_CPUTIME))) {
        private enum enumMixinStr__POSIX_THREAD_CPUTIME = `enum _POSIX_THREAD_CPUTIME = 0;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_THREAD_CPUTIME); }))) {
            mixin(enumMixinStr__POSIX_THREAD_CPUTIME);
        }
    }




    static if(!is(typeof(_POSIX_CPUTIME))) {
        private enum enumMixinStr__POSIX_CPUTIME = `enum _POSIX_CPUTIME = 0;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_CPUTIME); }))) {
            mixin(enumMixinStr__POSIX_CPUTIME);
        }
    }




    static if(!is(typeof(_POSIX_SHARED_MEMORY_OBJECTS))) {
        private enum enumMixinStr__POSIX_SHARED_MEMORY_OBJECTS = `enum _POSIX_SHARED_MEMORY_OBJECTS = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SHARED_MEMORY_OBJECTS); }))) {
            mixin(enumMixinStr__POSIX_SHARED_MEMORY_OBJECTS);
        }
    }




    static if(!is(typeof(_LFS64_STDIO))) {
        private enum enumMixinStr__LFS64_STDIO = `enum _LFS64_STDIO = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__LFS64_STDIO); }))) {
            mixin(enumMixinStr__LFS64_STDIO);
        }
    }




    static if(!is(typeof(_LFS64_LARGEFILE))) {
        private enum enumMixinStr__LFS64_LARGEFILE = `enum _LFS64_LARGEFILE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__LFS64_LARGEFILE); }))) {
            mixin(enumMixinStr__LFS64_LARGEFILE);
        }
    }




    static if(!is(typeof(_LFS_LARGEFILE))) {
        private enum enumMixinStr__LFS_LARGEFILE = `enum _LFS_LARGEFILE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__LFS_LARGEFILE); }))) {
            mixin(enumMixinStr__LFS_LARGEFILE);
        }
    }




    static if(!is(typeof(_LFS64_ASYNCHRONOUS_IO))) {
        private enum enumMixinStr__LFS64_ASYNCHRONOUS_IO = `enum _LFS64_ASYNCHRONOUS_IO = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__LFS64_ASYNCHRONOUS_IO); }))) {
            mixin(enumMixinStr__LFS64_ASYNCHRONOUS_IO);
        }
    }




    static if(!is(typeof(_POSIX_PRIORITIZED_IO))) {
        private enum enumMixinStr__POSIX_PRIORITIZED_IO = `enum _POSIX_PRIORITIZED_IO = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_PRIORITIZED_IO); }))) {
            mixin(enumMixinStr__POSIX_PRIORITIZED_IO);
        }
    }




    static if(!is(typeof(_LFS_ASYNCHRONOUS_IO))) {
        private enum enumMixinStr__LFS_ASYNCHRONOUS_IO = `enum _LFS_ASYNCHRONOUS_IO = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__LFS_ASYNCHRONOUS_IO); }))) {
            mixin(enumMixinStr__LFS_ASYNCHRONOUS_IO);
        }
    }




    static if(!is(typeof(_POSIX_ASYNC_IO))) {
        private enum enumMixinStr__POSIX_ASYNC_IO = `enum _POSIX_ASYNC_IO = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_ASYNC_IO); }))) {
            mixin(enumMixinStr__POSIX_ASYNC_IO);
        }
    }




    static if(!is(typeof(_POSIX_ASYNCHRONOUS_IO))) {
        private enum enumMixinStr__POSIX_ASYNCHRONOUS_IO = `enum _POSIX_ASYNCHRONOUS_IO = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_ASYNCHRONOUS_IO); }))) {
            mixin(enumMixinStr__POSIX_ASYNCHRONOUS_IO);
        }
    }




    static if(!is(typeof(_POSIX_REALTIME_SIGNALS))) {
        private enum enumMixinStr__POSIX_REALTIME_SIGNALS = `enum _POSIX_REALTIME_SIGNALS = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_REALTIME_SIGNALS); }))) {
            mixin(enumMixinStr__POSIX_REALTIME_SIGNALS);
        }
    }




    static if(!is(typeof(_POSIX_SEMAPHORES))) {
        private enum enumMixinStr__POSIX_SEMAPHORES = `enum _POSIX_SEMAPHORES = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SEMAPHORES); }))) {
            mixin(enumMixinStr__POSIX_SEMAPHORES);
        }
    }




    static if(!is(typeof(_POSIX_THREAD_ROBUST_PRIO_PROTECT))) {
        private enum enumMixinStr__POSIX_THREAD_ROBUST_PRIO_PROTECT = `enum _POSIX_THREAD_ROBUST_PRIO_PROTECT = - 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_THREAD_ROBUST_PRIO_PROTECT); }))) {
            mixin(enumMixinStr__POSIX_THREAD_ROBUST_PRIO_PROTECT);
        }
    }




    static if(!is(typeof(_POSIX_THREAD_ROBUST_PRIO_INHERIT))) {
        private enum enumMixinStr__POSIX_THREAD_ROBUST_PRIO_INHERIT = `enum _POSIX_THREAD_ROBUST_PRIO_INHERIT = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_THREAD_ROBUST_PRIO_INHERIT); }))) {
            mixin(enumMixinStr__POSIX_THREAD_ROBUST_PRIO_INHERIT);
        }
    }




    static if(!is(typeof(_POSIX_THREAD_PRIO_PROTECT))) {
        private enum enumMixinStr__POSIX_THREAD_PRIO_PROTECT = `enum _POSIX_THREAD_PRIO_PROTECT = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_THREAD_PRIO_PROTECT); }))) {
            mixin(enumMixinStr__POSIX_THREAD_PRIO_PROTECT);
        }
    }




    static if(!is(typeof(_POSIX_THREAD_PRIO_INHERIT))) {
        private enum enumMixinStr__POSIX_THREAD_PRIO_INHERIT = `enum _POSIX_THREAD_PRIO_INHERIT = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_THREAD_PRIO_INHERIT); }))) {
            mixin(enumMixinStr__POSIX_THREAD_PRIO_INHERIT);
        }
    }




    static if(!is(typeof(_POSIX_THREAD_ATTR_STACKADDR))) {
        private enum enumMixinStr__POSIX_THREAD_ATTR_STACKADDR = `enum _POSIX_THREAD_ATTR_STACKADDR = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_THREAD_ATTR_STACKADDR); }))) {
            mixin(enumMixinStr__POSIX_THREAD_ATTR_STACKADDR);
        }
    }




    static if(!is(typeof(_POSIX_THREAD_ATTR_STACKSIZE))) {
        private enum enumMixinStr__POSIX_THREAD_ATTR_STACKSIZE = `enum _POSIX_THREAD_ATTR_STACKSIZE = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_THREAD_ATTR_STACKSIZE); }))) {
            mixin(enumMixinStr__POSIX_THREAD_ATTR_STACKSIZE);
        }
    }




    static if(!is(typeof(_POSIX_THREAD_PRIORITY_SCHEDULING))) {
        private enum enumMixinStr__POSIX_THREAD_PRIORITY_SCHEDULING = `enum _POSIX_THREAD_PRIORITY_SCHEDULING = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_THREAD_PRIORITY_SCHEDULING); }))) {
            mixin(enumMixinStr__POSIX_THREAD_PRIORITY_SCHEDULING);
        }
    }




    static if(!is(typeof(_POSIX_THREAD_SAFE_FUNCTIONS))) {
        private enum enumMixinStr__POSIX_THREAD_SAFE_FUNCTIONS = `enum _POSIX_THREAD_SAFE_FUNCTIONS = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_THREAD_SAFE_FUNCTIONS); }))) {
            mixin(enumMixinStr__POSIX_THREAD_SAFE_FUNCTIONS);
        }
    }




    static if(!is(typeof(_POSIX_REENTRANT_FUNCTIONS))) {
        private enum enumMixinStr__POSIX_REENTRANT_FUNCTIONS = `enum _POSIX_REENTRANT_FUNCTIONS = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_REENTRANT_FUNCTIONS); }))) {
            mixin(enumMixinStr__POSIX_REENTRANT_FUNCTIONS);
        }
    }




    static if(!is(typeof(_POSIX_THREADS))) {
        private enum enumMixinStr__POSIX_THREADS = `enum _POSIX_THREADS = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_THREADS); }))) {
            mixin(enumMixinStr__POSIX_THREADS);
        }
    }




    static if(!is(typeof(_XOPEN_SHM))) {
        private enum enumMixinStr__XOPEN_SHM = `enum _XOPEN_SHM = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__XOPEN_SHM); }))) {
            mixin(enumMixinStr__XOPEN_SHM);
        }
    }




    static if(!is(typeof(_XOPEN_REALTIME_THREADS))) {
        private enum enumMixinStr__XOPEN_REALTIME_THREADS = `enum _XOPEN_REALTIME_THREADS = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__XOPEN_REALTIME_THREADS); }))) {
            mixin(enumMixinStr__XOPEN_REALTIME_THREADS);
        }
    }




    static if(!is(typeof(_XOPEN_REALTIME))) {
        private enum enumMixinStr__XOPEN_REALTIME = `enum _XOPEN_REALTIME = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__XOPEN_REALTIME); }))) {
            mixin(enumMixinStr__XOPEN_REALTIME);
        }
    }




    static if(!is(typeof(_POSIX_NO_TRUNC))) {
        private enum enumMixinStr__POSIX_NO_TRUNC = `enum _POSIX_NO_TRUNC = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_NO_TRUNC); }))) {
            mixin(enumMixinStr__POSIX_NO_TRUNC);
        }
    }




    static if(!is(typeof(_POSIX_VDISABLE))) {
        private enum enumMixinStr__POSIX_VDISABLE = `enum _POSIX_VDISABLE = '\0';`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_VDISABLE); }))) {
            mixin(enumMixinStr__POSIX_VDISABLE);
        }
    }




    static if(!is(typeof(_POSIX_CHOWN_RESTRICTED))) {
        private enum enumMixinStr__POSIX_CHOWN_RESTRICTED = `enum _POSIX_CHOWN_RESTRICTED = 0;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_CHOWN_RESTRICTED); }))) {
            mixin(enumMixinStr__POSIX_CHOWN_RESTRICTED);
        }
    }




    static if(!is(typeof(_POSIX_MEMORY_PROTECTION))) {
        private enum enumMixinStr__POSIX_MEMORY_PROTECTION = `enum _POSIX_MEMORY_PROTECTION = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_MEMORY_PROTECTION); }))) {
            mixin(enumMixinStr__POSIX_MEMORY_PROTECTION);
        }
    }




    static if(!is(typeof(_POSIX_MEMLOCK_RANGE))) {
        private enum enumMixinStr__POSIX_MEMLOCK_RANGE = `enum _POSIX_MEMLOCK_RANGE = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_MEMLOCK_RANGE); }))) {
            mixin(enumMixinStr__POSIX_MEMLOCK_RANGE);
        }
    }




    static if(!is(typeof(_POSIX_MEMLOCK))) {
        private enum enumMixinStr__POSIX_MEMLOCK = `enum _POSIX_MEMLOCK = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_MEMLOCK); }))) {
            mixin(enumMixinStr__POSIX_MEMLOCK);
        }
    }




    static if(!is(typeof(_POSIX_MAPPED_FILES))) {
        private enum enumMixinStr__POSIX_MAPPED_FILES = `enum _POSIX_MAPPED_FILES = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_MAPPED_FILES); }))) {
            mixin(enumMixinStr__POSIX_MAPPED_FILES);
        }
    }




    static if(!is(typeof(_POSIX_FSYNC))) {
        private enum enumMixinStr__POSIX_FSYNC = `enum _POSIX_FSYNC = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_FSYNC); }))) {
            mixin(enumMixinStr__POSIX_FSYNC);
        }
    }




    static if(!is(typeof(_POSIX_SYNCHRONIZED_IO))) {
        private enum enumMixinStr__POSIX_SYNCHRONIZED_IO = `enum _POSIX_SYNCHRONIZED_IO = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SYNCHRONIZED_IO); }))) {
            mixin(enumMixinStr__POSIX_SYNCHRONIZED_IO);
        }
    }




    static if(!is(typeof(_POSIX_PRIORITY_SCHEDULING))) {
        private enum enumMixinStr__POSIX_PRIORITY_SCHEDULING = `enum _POSIX_PRIORITY_SCHEDULING = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_PRIORITY_SCHEDULING); }))) {
            mixin(enumMixinStr__POSIX_PRIORITY_SCHEDULING);
        }
    }




    static if(!is(typeof(_POSIX_SAVED_IDS))) {
        private enum enumMixinStr__POSIX_SAVED_IDS = `enum _POSIX_SAVED_IDS = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SAVED_IDS); }))) {
            mixin(enumMixinStr__POSIX_SAVED_IDS);
        }
    }




    static if(!is(typeof(_POSIX_JOB_CONTROL))) {
        private enum enumMixinStr__POSIX_JOB_CONTROL = `enum _POSIX_JOB_CONTROL = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_JOB_CONTROL); }))) {
            mixin(enumMixinStr__POSIX_JOB_CONTROL);
        }
    }




    static if(!is(typeof(_BITS_POSIX_OPT_H))) {
        private enum enumMixinStr__BITS_POSIX_OPT_H = `enum _BITS_POSIX_OPT_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_POSIX_OPT_H); }))) {
            mixin(enumMixinStr__BITS_POSIX_OPT_H);
        }
    }




    static if(!is(typeof(RE_DUP_MAX))) {
        private enum enumMixinStr_RE_DUP_MAX = `enum RE_DUP_MAX = ( 0x7fff );`;
        static if(is(typeof({ mixin(enumMixinStr_RE_DUP_MAX); }))) {
            mixin(enumMixinStr_RE_DUP_MAX);
        }
    }




    static if(!is(typeof(CHARCLASS_NAME_MAX))) {
        private enum enumMixinStr_CHARCLASS_NAME_MAX = `enum CHARCLASS_NAME_MAX = 2048;`;
        static if(is(typeof({ mixin(enumMixinStr_CHARCLASS_NAME_MAX); }))) {
            mixin(enumMixinStr_CHARCLASS_NAME_MAX);
        }
    }




    static if(!is(typeof(LINE_MAX))) {
        private enum enumMixinStr_LINE_MAX = `enum LINE_MAX = _POSIX2_LINE_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_LINE_MAX); }))) {
            mixin(enumMixinStr_LINE_MAX);
        }
    }




    static if(!is(typeof(EXPR_NEST_MAX))) {
        private enum enumMixinStr_EXPR_NEST_MAX = `enum EXPR_NEST_MAX = _POSIX2_EXPR_NEST_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_EXPR_NEST_MAX); }))) {
            mixin(enumMixinStr_EXPR_NEST_MAX);
        }
    }




    static if(!is(typeof(COLL_WEIGHTS_MAX))) {
        private enum enumMixinStr_COLL_WEIGHTS_MAX = `enum COLL_WEIGHTS_MAX = 255;`;
        static if(is(typeof({ mixin(enumMixinStr_COLL_WEIGHTS_MAX); }))) {
            mixin(enumMixinStr_COLL_WEIGHTS_MAX);
        }
    }




    static if(!is(typeof(BC_STRING_MAX))) {
        private enum enumMixinStr_BC_STRING_MAX = `enum BC_STRING_MAX = _POSIX2_BC_STRING_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_BC_STRING_MAX); }))) {
            mixin(enumMixinStr_BC_STRING_MAX);
        }
    }




    static if(!is(typeof(BC_SCALE_MAX))) {
        private enum enumMixinStr_BC_SCALE_MAX = `enum BC_SCALE_MAX = _POSIX2_BC_SCALE_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_BC_SCALE_MAX); }))) {
            mixin(enumMixinStr_BC_SCALE_MAX);
        }
    }




    static if(!is(typeof(BC_DIM_MAX))) {
        private enum enumMixinStr_BC_DIM_MAX = `enum BC_DIM_MAX = _POSIX2_BC_DIM_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_BC_DIM_MAX); }))) {
            mixin(enumMixinStr_BC_DIM_MAX);
        }
    }




    static if(!is(typeof(BC_BASE_MAX))) {
        private enum enumMixinStr_BC_BASE_MAX = `enum BC_BASE_MAX = _POSIX2_BC_BASE_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_BC_BASE_MAX); }))) {
            mixin(enumMixinStr_BC_BASE_MAX);
        }
    }




    static if(!is(typeof(_POSIX2_CHARCLASS_NAME_MAX))) {
        private enum enumMixinStr__POSIX2_CHARCLASS_NAME_MAX = `enum _POSIX2_CHARCLASS_NAME_MAX = 14;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_CHARCLASS_NAME_MAX); }))) {
            mixin(enumMixinStr__POSIX2_CHARCLASS_NAME_MAX);
        }
    }




    static if(!is(typeof(_POSIX2_RE_DUP_MAX))) {
        private enum enumMixinStr__POSIX2_RE_DUP_MAX = `enum _POSIX2_RE_DUP_MAX = 255;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_RE_DUP_MAX); }))) {
            mixin(enumMixinStr__POSIX2_RE_DUP_MAX);
        }
    }




    static if(!is(typeof(_POSIX2_LINE_MAX))) {
        private enum enumMixinStr__POSIX2_LINE_MAX = `enum _POSIX2_LINE_MAX = 2048;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_LINE_MAX); }))) {
            mixin(enumMixinStr__POSIX2_LINE_MAX);
        }
    }




    static if(!is(typeof(_POSIX2_EXPR_NEST_MAX))) {
        private enum enumMixinStr__POSIX2_EXPR_NEST_MAX = `enum _POSIX2_EXPR_NEST_MAX = 32;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_EXPR_NEST_MAX); }))) {
            mixin(enumMixinStr__POSIX2_EXPR_NEST_MAX);
        }
    }




    static if(!is(typeof(_POSIX2_COLL_WEIGHTS_MAX))) {
        private enum enumMixinStr__POSIX2_COLL_WEIGHTS_MAX = `enum _POSIX2_COLL_WEIGHTS_MAX = 2;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_COLL_WEIGHTS_MAX); }))) {
            mixin(enumMixinStr__POSIX2_COLL_WEIGHTS_MAX);
        }
    }




    static if(!is(typeof(_POSIX2_BC_STRING_MAX))) {
        private enum enumMixinStr__POSIX2_BC_STRING_MAX = `enum _POSIX2_BC_STRING_MAX = 1000;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_BC_STRING_MAX); }))) {
            mixin(enumMixinStr__POSIX2_BC_STRING_MAX);
        }
    }




    static if(!is(typeof(_POSIX2_BC_SCALE_MAX))) {
        private enum enumMixinStr__POSIX2_BC_SCALE_MAX = `enum _POSIX2_BC_SCALE_MAX = 99;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_BC_SCALE_MAX); }))) {
            mixin(enumMixinStr__POSIX2_BC_SCALE_MAX);
        }
    }




    static if(!is(typeof(_POSIX2_BC_DIM_MAX))) {
        private enum enumMixinStr__POSIX2_BC_DIM_MAX = `enum _POSIX2_BC_DIM_MAX = 2048;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_BC_DIM_MAX); }))) {
            mixin(enumMixinStr__POSIX2_BC_DIM_MAX);
        }
    }




    static if(!is(typeof(_POSIX2_BC_BASE_MAX))) {
        private enum enumMixinStr__POSIX2_BC_BASE_MAX = `enum _POSIX2_BC_BASE_MAX = 99;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_BC_BASE_MAX); }))) {
            mixin(enumMixinStr__POSIX2_BC_BASE_MAX);
        }
    }




    static if(!is(typeof(_BITS_POSIX2_LIM_H))) {
        private enum enumMixinStr__BITS_POSIX2_LIM_H = `enum _BITS_POSIX2_LIM_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_POSIX2_LIM_H); }))) {
            mixin(enumMixinStr__BITS_POSIX2_LIM_H);
        }
    }




    static if(!is(typeof(SSIZE_MAX))) {
        private enum enumMixinStr_SSIZE_MAX = `enum SSIZE_MAX = LONG_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr_SSIZE_MAX); }))) {
            mixin(enumMixinStr_SSIZE_MAX);
        }
    }




    static if(!is(typeof(_POSIX_CLOCKRES_MIN))) {
        private enum enumMixinStr__POSIX_CLOCKRES_MIN = `enum _POSIX_CLOCKRES_MIN = 20000000;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_CLOCKRES_MIN); }))) {
            mixin(enumMixinStr__POSIX_CLOCKRES_MIN);
        }
    }




    static if(!is(typeof(_POSIX_TZNAME_MAX))) {
        private enum enumMixinStr__POSIX_TZNAME_MAX = `enum _POSIX_TZNAME_MAX = 6;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_TZNAME_MAX); }))) {
            mixin(enumMixinStr__POSIX_TZNAME_MAX);
        }
    }




    static if(!is(typeof(_POSIX_TTY_NAME_MAX))) {
        private enum enumMixinStr__POSIX_TTY_NAME_MAX = `enum _POSIX_TTY_NAME_MAX = 9;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_TTY_NAME_MAX); }))) {
            mixin(enumMixinStr__POSIX_TTY_NAME_MAX);
        }
    }




    static if(!is(typeof(_POSIX_TIMER_MAX))) {
        private enum enumMixinStr__POSIX_TIMER_MAX = `enum _POSIX_TIMER_MAX = 32;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_TIMER_MAX); }))) {
            mixin(enumMixinStr__POSIX_TIMER_MAX);
        }
    }




    static if(!is(typeof(_POSIX_SYMLOOP_MAX))) {
        private enum enumMixinStr__POSIX_SYMLOOP_MAX = `enum _POSIX_SYMLOOP_MAX = 8;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SYMLOOP_MAX); }))) {
            mixin(enumMixinStr__POSIX_SYMLOOP_MAX);
        }
    }




    static if(!is(typeof(_POSIX_SYMLINK_MAX))) {
        private enum enumMixinStr__POSIX_SYMLINK_MAX = `enum _POSIX_SYMLINK_MAX = 255;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SYMLINK_MAX); }))) {
            mixin(enumMixinStr__POSIX_SYMLINK_MAX);
        }
    }




    static if(!is(typeof(_POSIX_STREAM_MAX))) {
        private enum enumMixinStr__POSIX_STREAM_MAX = `enum _POSIX_STREAM_MAX = 8;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_STREAM_MAX); }))) {
            mixin(enumMixinStr__POSIX_STREAM_MAX);
        }
    }




    static if(!is(typeof(_POSIX_SSIZE_MAX))) {
        private enum enumMixinStr__POSIX_SSIZE_MAX = `enum _POSIX_SSIZE_MAX = 32767;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SSIZE_MAX); }))) {
            mixin(enumMixinStr__POSIX_SSIZE_MAX);
        }
    }




    static if(!is(typeof(_POSIX_SIGQUEUE_MAX))) {
        private enum enumMixinStr__POSIX_SIGQUEUE_MAX = `enum _POSIX_SIGQUEUE_MAX = 32;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SIGQUEUE_MAX); }))) {
            mixin(enumMixinStr__POSIX_SIGQUEUE_MAX);
        }
    }




    static if(!is(typeof(_POSIX_SEM_VALUE_MAX))) {
        private enum enumMixinStr__POSIX_SEM_VALUE_MAX = `enum _POSIX_SEM_VALUE_MAX = 32767;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SEM_VALUE_MAX); }))) {
            mixin(enumMixinStr__POSIX_SEM_VALUE_MAX);
        }
    }




    static if(!is(typeof(_POSIX_SEM_NSEMS_MAX))) {
        private enum enumMixinStr__POSIX_SEM_NSEMS_MAX = `enum _POSIX_SEM_NSEMS_MAX = 256;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_SEM_NSEMS_MAX); }))) {
            mixin(enumMixinStr__POSIX_SEM_NSEMS_MAX);
        }
    }




    static if(!is(typeof(_POSIX_RTSIG_MAX))) {
        private enum enumMixinStr__POSIX_RTSIG_MAX = `enum _POSIX_RTSIG_MAX = 8;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_RTSIG_MAX); }))) {
            mixin(enumMixinStr__POSIX_RTSIG_MAX);
        }
    }




    static if(!is(typeof(_POSIX_RE_DUP_MAX))) {
        private enum enumMixinStr__POSIX_RE_DUP_MAX = `enum _POSIX_RE_DUP_MAX = 255;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_RE_DUP_MAX); }))) {
            mixin(enumMixinStr__POSIX_RE_DUP_MAX);
        }
    }




    static if(!is(typeof(_POSIX_PIPE_BUF))) {
        private enum enumMixinStr__POSIX_PIPE_BUF = `enum _POSIX_PIPE_BUF = 512;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_PIPE_BUF); }))) {
            mixin(enumMixinStr__POSIX_PIPE_BUF);
        }
    }




    static if(!is(typeof(_POSIX_PATH_MAX))) {
        private enum enumMixinStr__POSIX_PATH_MAX = `enum _POSIX_PATH_MAX = 256;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_PATH_MAX); }))) {
            mixin(enumMixinStr__POSIX_PATH_MAX);
        }
    }




    static if(!is(typeof(_POSIX_OPEN_MAX))) {
        private enum enumMixinStr__POSIX_OPEN_MAX = `enum _POSIX_OPEN_MAX = 20;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_OPEN_MAX); }))) {
            mixin(enumMixinStr__POSIX_OPEN_MAX);
        }
    }




    static if(!is(typeof(_POSIX_NGROUPS_MAX))) {
        private enum enumMixinStr__POSIX_NGROUPS_MAX = `enum _POSIX_NGROUPS_MAX = 8;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_NGROUPS_MAX); }))) {
            mixin(enumMixinStr__POSIX_NGROUPS_MAX);
        }
    }




    static if(!is(typeof(_POSIX_NAME_MAX))) {
        private enum enumMixinStr__POSIX_NAME_MAX = `enum _POSIX_NAME_MAX = 14;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_NAME_MAX); }))) {
            mixin(enumMixinStr__POSIX_NAME_MAX);
        }
    }




    static if(!is(typeof(_POSIX_MQ_PRIO_MAX))) {
        private enum enumMixinStr__POSIX_MQ_PRIO_MAX = `enum _POSIX_MQ_PRIO_MAX = 32;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_MQ_PRIO_MAX); }))) {
            mixin(enumMixinStr__POSIX_MQ_PRIO_MAX);
        }
    }




    static if(!is(typeof(_POSIX_MQ_OPEN_MAX))) {
        private enum enumMixinStr__POSIX_MQ_OPEN_MAX = `enum _POSIX_MQ_OPEN_MAX = 8;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_MQ_OPEN_MAX); }))) {
            mixin(enumMixinStr__POSIX_MQ_OPEN_MAX);
        }
    }




    static if(!is(typeof(_POSIX_MAX_INPUT))) {
        private enum enumMixinStr__POSIX_MAX_INPUT = `enum _POSIX_MAX_INPUT = 255;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_MAX_INPUT); }))) {
            mixin(enumMixinStr__POSIX_MAX_INPUT);
        }
    }




    static if(!is(typeof(_POSIX_MAX_CANON))) {
        private enum enumMixinStr__POSIX_MAX_CANON = `enum _POSIX_MAX_CANON = 255;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_MAX_CANON); }))) {
            mixin(enumMixinStr__POSIX_MAX_CANON);
        }
    }




    static if(!is(typeof(_POSIX_LOGIN_NAME_MAX))) {
        private enum enumMixinStr__POSIX_LOGIN_NAME_MAX = `enum _POSIX_LOGIN_NAME_MAX = 9;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_LOGIN_NAME_MAX); }))) {
            mixin(enumMixinStr__POSIX_LOGIN_NAME_MAX);
        }
    }






    static if(!is(typeof(_POSIX_LINK_MAX))) {
        private enum enumMixinStr__POSIX_LINK_MAX = `enum _POSIX_LINK_MAX = 8;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_LINK_MAX); }))) {
            mixin(enumMixinStr__POSIX_LINK_MAX);
        }
    }




    static if(!is(typeof(_POSIX_HOST_NAME_MAX))) {
        private enum enumMixinStr__POSIX_HOST_NAME_MAX = `enum _POSIX_HOST_NAME_MAX = 255;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_HOST_NAME_MAX); }))) {
            mixin(enumMixinStr__POSIX_HOST_NAME_MAX);
        }
    }




    static if(!is(typeof(_POSIX_DELAYTIMER_MAX))) {
        private enum enumMixinStr__POSIX_DELAYTIMER_MAX = `enum _POSIX_DELAYTIMER_MAX = 32;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_DELAYTIMER_MAX); }))) {
            mixin(enumMixinStr__POSIX_DELAYTIMER_MAX);
        }
    }




    static if(!is(typeof(_POSIX_CHILD_MAX))) {
        private enum enumMixinStr__POSIX_CHILD_MAX = `enum _POSIX_CHILD_MAX = 25;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_CHILD_MAX); }))) {
            mixin(enumMixinStr__POSIX_CHILD_MAX);
        }
    }




    static if(!is(typeof(_POSIX_ARG_MAX))) {
        private enum enumMixinStr__POSIX_ARG_MAX = `enum _POSIX_ARG_MAX = 4096;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_ARG_MAX); }))) {
            mixin(enumMixinStr__POSIX_ARG_MAX);
        }
    }




    static if(!is(typeof(_POSIX_AIO_MAX))) {
        private enum enumMixinStr__POSIX_AIO_MAX = `enum _POSIX_AIO_MAX = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_AIO_MAX); }))) {
            mixin(enumMixinStr__POSIX_AIO_MAX);
        }
    }




    static if(!is(typeof(_POSIX_AIO_LISTIO_MAX))) {
        private enum enumMixinStr__POSIX_AIO_LISTIO_MAX = `enum _POSIX_AIO_LISTIO_MAX = 2;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_AIO_LISTIO_MAX); }))) {
            mixin(enumMixinStr__POSIX_AIO_LISTIO_MAX);
        }
    }




    static if(!is(typeof(_BITS_POSIX1_LIM_H))) {
        private enum enumMixinStr__BITS_POSIX1_LIM_H = `enum _BITS_POSIX1_LIM_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_POSIX1_LIM_H); }))) {
            mixin(enumMixinStr__BITS_POSIX1_LIM_H);
        }
    }




    static if(!is(typeof(SEM_VALUE_MAX))) {
        private enum enumMixinStr_SEM_VALUE_MAX = `enum SEM_VALUE_MAX = ( 2147483647 );`;
        static if(is(typeof({ mixin(enumMixinStr_SEM_VALUE_MAX); }))) {
            mixin(enumMixinStr_SEM_VALUE_MAX);
        }
    }




    static if(!is(typeof(MQ_PRIO_MAX))) {
        private enum enumMixinStr_MQ_PRIO_MAX = `enum MQ_PRIO_MAX = 32768;`;
        static if(is(typeof({ mixin(enumMixinStr_MQ_PRIO_MAX); }))) {
            mixin(enumMixinStr_MQ_PRIO_MAX);
        }
    }




    static if(!is(typeof(HOST_NAME_MAX))) {
        private enum enumMixinStr_HOST_NAME_MAX = `enum HOST_NAME_MAX = 64;`;
        static if(is(typeof({ mixin(enumMixinStr_HOST_NAME_MAX); }))) {
            mixin(enumMixinStr_HOST_NAME_MAX);
        }
    }




    static if(!is(typeof(LOGIN_NAME_MAX))) {
        private enum enumMixinStr_LOGIN_NAME_MAX = `enum LOGIN_NAME_MAX = 256;`;
        static if(is(typeof({ mixin(enumMixinStr_LOGIN_NAME_MAX); }))) {
            mixin(enumMixinStr_LOGIN_NAME_MAX);
        }
    }




    static if(!is(typeof(TTY_NAME_MAX))) {
        private enum enumMixinStr_TTY_NAME_MAX = `enum TTY_NAME_MAX = 32;`;
        static if(is(typeof({ mixin(enumMixinStr_TTY_NAME_MAX); }))) {
            mixin(enumMixinStr_TTY_NAME_MAX);
        }
    }




    static if(!is(typeof(DELAYTIMER_MAX))) {
        private enum enumMixinStr_DELAYTIMER_MAX = `enum DELAYTIMER_MAX = 2147483647;`;
        static if(is(typeof({ mixin(enumMixinStr_DELAYTIMER_MAX); }))) {
            mixin(enumMixinStr_DELAYTIMER_MAX);
        }
    }




    static if(!is(typeof(PTHREAD_STACK_MIN))) {
        private enum enumMixinStr_PTHREAD_STACK_MIN = `enum PTHREAD_STACK_MIN = 16384;`;
        static if(is(typeof({ mixin(enumMixinStr_PTHREAD_STACK_MIN); }))) {
            mixin(enumMixinStr_PTHREAD_STACK_MIN);
        }
    }




    static if(!is(typeof(AIO_PRIO_DELTA_MAX))) {
        private enum enumMixinStr_AIO_PRIO_DELTA_MAX = `enum AIO_PRIO_DELTA_MAX = 20;`;
        static if(is(typeof({ mixin(enumMixinStr_AIO_PRIO_DELTA_MAX); }))) {
            mixin(enumMixinStr_AIO_PRIO_DELTA_MAX);
        }
    }




    static if(!is(typeof(_POSIX_THREAD_THREADS_MAX))) {
        private enum enumMixinStr__POSIX_THREAD_THREADS_MAX = `enum _POSIX_THREAD_THREADS_MAX = 64;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_THREAD_THREADS_MAX); }))) {
            mixin(enumMixinStr__POSIX_THREAD_THREADS_MAX);
        }
    }




    static if(!is(typeof(PTHREAD_DESTRUCTOR_ITERATIONS))) {
        private enum enumMixinStr_PTHREAD_DESTRUCTOR_ITERATIONS = `enum PTHREAD_DESTRUCTOR_ITERATIONS = _POSIX_THREAD_DESTRUCTOR_ITERATIONS;`;
        static if(is(typeof({ mixin(enumMixinStr_PTHREAD_DESTRUCTOR_ITERATIONS); }))) {
            mixin(enumMixinStr_PTHREAD_DESTRUCTOR_ITERATIONS);
        }
    }




    static if(!is(typeof(_POSIX_THREAD_DESTRUCTOR_ITERATIONS))) {
        private enum enumMixinStr__POSIX_THREAD_DESTRUCTOR_ITERATIONS = `enum _POSIX_THREAD_DESTRUCTOR_ITERATIONS = 4;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_THREAD_DESTRUCTOR_ITERATIONS); }))) {
            mixin(enumMixinStr__POSIX_THREAD_DESTRUCTOR_ITERATIONS);
        }
    }




    static if(!is(typeof(PTHREAD_KEYS_MAX))) {
        private enum enumMixinStr_PTHREAD_KEYS_MAX = `enum PTHREAD_KEYS_MAX = 1024;`;
        static if(is(typeof({ mixin(enumMixinStr_PTHREAD_KEYS_MAX); }))) {
            mixin(enumMixinStr_PTHREAD_KEYS_MAX);
        }
    }




    static if(!is(typeof(_POSIX_THREAD_KEYS_MAX))) {
        private enum enumMixinStr__POSIX_THREAD_KEYS_MAX = `enum _POSIX_THREAD_KEYS_MAX = 128;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_THREAD_KEYS_MAX); }))) {
            mixin(enumMixinStr__POSIX_THREAD_KEYS_MAX);
        }
    }
    static if(!is(typeof(__GLIBC_USE_IEC_60559_TYPES_EXT))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT = `enum __GLIBC_USE_IEC_60559_TYPES_EXT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_TYPES_EXT);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_FUNCS_EXT))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT = `enum __GLIBC_USE_IEC_60559_FUNCS_EXT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_FUNCS_EXT);
        }
    }




    static if(!is(typeof(__GLIBC_USE_IEC_60559_BFP_EXT))) {
        private enum enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT = `enum __GLIBC_USE_IEC_60559_BFP_EXT = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT); }))) {
            mixin(enumMixinStr___GLIBC_USE_IEC_60559_BFP_EXT);
        }
    }




    static if(!is(typeof(__GLIBC_USE_LIB_EXT2))) {
        private enum enumMixinStr___GLIBC_USE_LIB_EXT2 = `enum __GLIBC_USE_LIB_EXT2 = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___GLIBC_USE_LIB_EXT2); }))) {
            mixin(enumMixinStr___GLIBC_USE_LIB_EXT2);
        }
    }




    static if(!is(typeof(_GETOPT_POSIX_H))) {
        private enum enumMixinStr__GETOPT_POSIX_H = `enum _GETOPT_POSIX_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__GETOPT_POSIX_H); }))) {
            mixin(enumMixinStr__GETOPT_POSIX_H);
        }
    }




    static if(!is(typeof(_GETOPT_CORE_H))) {
        private enum enumMixinStr__GETOPT_CORE_H = `enum _GETOPT_CORE_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__GETOPT_CORE_H); }))) {
            mixin(enumMixinStr__GETOPT_CORE_H);
        }
    }




    static if(!is(typeof(__HAVE_FLOAT64X_LONG_DOUBLE))) {
        private enum enumMixinStr___HAVE_FLOAT64X_LONG_DOUBLE = `enum __HAVE_FLOAT64X_LONG_DOUBLE = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOAT64X_LONG_DOUBLE); }))) {
            mixin(enumMixinStr___HAVE_FLOAT64X_LONG_DOUBLE);
        }
    }




    static if(!is(typeof(__HAVE_FLOAT64X))) {
        private enum enumMixinStr___HAVE_FLOAT64X = `enum __HAVE_FLOAT64X = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOAT64X); }))) {
            mixin(enumMixinStr___HAVE_FLOAT64X);
        }
    }




    static if(!is(typeof(__HAVE_DISTINCT_FLOAT128))) {
        private enum enumMixinStr___HAVE_DISTINCT_FLOAT128 = `enum __HAVE_DISTINCT_FLOAT128 = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT128); }))) {
            mixin(enumMixinStr___HAVE_DISTINCT_FLOAT128);
        }
    }




    static if(!is(typeof(__HAVE_FLOAT128))) {
        private enum enumMixinStr___HAVE_FLOAT128 = `enum __HAVE_FLOAT128 = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOAT128); }))) {
            mixin(enumMixinStr___HAVE_FLOAT128);
        }
    }
    static if(!is(typeof(__CFLOAT64X))) {
        private enum enumMixinStr___CFLOAT64X = `enum __CFLOAT64X = _Complex long double;`;
        static if(is(typeof({ mixin(enumMixinStr___CFLOAT64X); }))) {
            mixin(enumMixinStr___CFLOAT64X);
        }
    }




    static if(!is(typeof(__CFLOAT32X))) {
        private enum enumMixinStr___CFLOAT32X = `enum __CFLOAT32X = _Complex double;`;
        static if(is(typeof({ mixin(enumMixinStr___CFLOAT32X); }))) {
            mixin(enumMixinStr___CFLOAT32X);
        }
    }




    static if(!is(typeof(__CFLOAT64))) {
        private enum enumMixinStr___CFLOAT64 = `enum __CFLOAT64 = _Complex double;`;
        static if(is(typeof({ mixin(enumMixinStr___CFLOAT64); }))) {
            mixin(enumMixinStr___CFLOAT64);
        }
    }




    static if(!is(typeof(__CFLOAT32))) {
        private enum enumMixinStr___CFLOAT32 = `enum __CFLOAT32 = _Complex float;`;
        static if(is(typeof({ mixin(enumMixinStr___CFLOAT32); }))) {
            mixin(enumMixinStr___CFLOAT32);
        }
    }
    static if(!is(typeof(__HAVE_FLOATN_NOT_TYPEDEF))) {
        private enum enumMixinStr___HAVE_FLOATN_NOT_TYPEDEF = `enum __HAVE_FLOATN_NOT_TYPEDEF = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOATN_NOT_TYPEDEF); }))) {
            mixin(enumMixinStr___HAVE_FLOATN_NOT_TYPEDEF);
        }
    }




    static if(!is(typeof(__HAVE_FLOAT128_UNLIKE_LDBL))) {
        private enum enumMixinStr___HAVE_FLOAT128_UNLIKE_LDBL = `enum __HAVE_FLOAT128_UNLIKE_LDBL = ( 0 && 64 != 113 );`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOAT128_UNLIKE_LDBL); }))) {
            mixin(enumMixinStr___HAVE_FLOAT128_UNLIKE_LDBL);
        }
    }




    static if(!is(typeof(__HAVE_DISTINCT_FLOAT128X))) {
        private enum enumMixinStr___HAVE_DISTINCT_FLOAT128X = `enum __HAVE_DISTINCT_FLOAT128X = __HAVE_FLOAT128X;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT128X); }))) {
            mixin(enumMixinStr___HAVE_DISTINCT_FLOAT128X);
        }
    }




    static if(!is(typeof(__HAVE_DISTINCT_FLOAT64X))) {
        private enum enumMixinStr___HAVE_DISTINCT_FLOAT64X = `enum __HAVE_DISTINCT_FLOAT64X = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT64X); }))) {
            mixin(enumMixinStr___HAVE_DISTINCT_FLOAT64X);
        }
    }




    static if(!is(typeof(__HAVE_DISTINCT_FLOAT32X))) {
        private enum enumMixinStr___HAVE_DISTINCT_FLOAT32X = `enum __HAVE_DISTINCT_FLOAT32X = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT32X); }))) {
            mixin(enumMixinStr___HAVE_DISTINCT_FLOAT32X);
        }
    }




    static if(!is(typeof(__HAVE_DISTINCT_FLOAT64))) {
        private enum enumMixinStr___HAVE_DISTINCT_FLOAT64 = `enum __HAVE_DISTINCT_FLOAT64 = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT64); }))) {
            mixin(enumMixinStr___HAVE_DISTINCT_FLOAT64);
        }
    }




    static if(!is(typeof(__HAVE_DISTINCT_FLOAT32))) {
        private enum enumMixinStr___HAVE_DISTINCT_FLOAT32 = `enum __HAVE_DISTINCT_FLOAT32 = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT32); }))) {
            mixin(enumMixinStr___HAVE_DISTINCT_FLOAT32);
        }
    }




    static if(!is(typeof(__HAVE_DISTINCT_FLOAT16))) {
        private enum enumMixinStr___HAVE_DISTINCT_FLOAT16 = `enum __HAVE_DISTINCT_FLOAT16 = __HAVE_FLOAT16;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_DISTINCT_FLOAT16); }))) {
            mixin(enumMixinStr___HAVE_DISTINCT_FLOAT16);
        }
    }




    static if(!is(typeof(__HAVE_FLOAT128X))) {
        private enum enumMixinStr___HAVE_FLOAT128X = `enum __HAVE_FLOAT128X = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOAT128X); }))) {
            mixin(enumMixinStr___HAVE_FLOAT128X);
        }
    }




    static if(!is(typeof(__HAVE_FLOAT32X))) {
        private enum enumMixinStr___HAVE_FLOAT32X = `enum __HAVE_FLOAT32X = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOAT32X); }))) {
            mixin(enumMixinStr___HAVE_FLOAT32X);
        }
    }




    static if(!is(typeof(__HAVE_FLOAT64))) {
        private enum enumMixinStr___HAVE_FLOAT64 = `enum __HAVE_FLOAT64 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOAT64); }))) {
            mixin(enumMixinStr___HAVE_FLOAT64);
        }
    }




    static if(!is(typeof(__HAVE_FLOAT32))) {
        private enum enumMixinStr___HAVE_FLOAT32 = `enum __HAVE_FLOAT32 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOAT32); }))) {
            mixin(enumMixinStr___HAVE_FLOAT32);
        }
    }




    static if(!is(typeof(__HAVE_FLOAT16))) {
        private enum enumMixinStr___HAVE_FLOAT16 = `enum __HAVE_FLOAT16 = 0;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_FLOAT16); }))) {
            mixin(enumMixinStr___HAVE_FLOAT16);
        }
    }






    static if(!is(typeof(ENOTSUP))) {
        private enum enumMixinStr_ENOTSUP = `enum ENOTSUP = EOPNOTSUPP;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOTSUP); }))) {
            mixin(enumMixinStr_ENOTSUP);
        }
    }




    static if(!is(typeof(_BITS_ERRNO_H))) {
        private enum enumMixinStr__BITS_ERRNO_H = `enum _BITS_ERRNO_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_ERRNO_H); }))) {
            mixin(enumMixinStr__BITS_ERRNO_H);
        }
    }




    static if(!is(typeof(__LP64_OFF64_LDFLAGS))) {
        private enum enumMixinStr___LP64_OFF64_LDFLAGS = `enum __LP64_OFF64_LDFLAGS = "-m64";`;
        static if(is(typeof({ mixin(enumMixinStr___LP64_OFF64_LDFLAGS); }))) {
            mixin(enumMixinStr___LP64_OFF64_LDFLAGS);
        }
    }




    static if(!is(typeof(__LP64_OFF64_CFLAGS))) {
        private enum enumMixinStr___LP64_OFF64_CFLAGS = `enum __LP64_OFF64_CFLAGS = "-m64";`;
        static if(is(typeof({ mixin(enumMixinStr___LP64_OFF64_CFLAGS); }))) {
            mixin(enumMixinStr___LP64_OFF64_CFLAGS);
        }
    }




    static if(!is(typeof(_STRING_H))) {
        private enum enumMixinStr__STRING_H = `enum _STRING_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STRING_H); }))) {
            mixin(enumMixinStr__STRING_H);
        }
    }




    static if(!is(typeof(__ILP32_OFFBIG_LDFLAGS))) {
        private enum enumMixinStr___ILP32_OFFBIG_LDFLAGS = `enum __ILP32_OFFBIG_LDFLAGS = "-m32";`;
        static if(is(typeof({ mixin(enumMixinStr___ILP32_OFFBIG_LDFLAGS); }))) {
            mixin(enumMixinStr___ILP32_OFFBIG_LDFLAGS);
        }
    }




    static if(!is(typeof(__ILP32_OFFBIG_CFLAGS))) {
        private enum enumMixinStr___ILP32_OFFBIG_CFLAGS = `enum __ILP32_OFFBIG_CFLAGS = "-m32 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64";`;
        static if(is(typeof({ mixin(enumMixinStr___ILP32_OFFBIG_CFLAGS); }))) {
            mixin(enumMixinStr___ILP32_OFFBIG_CFLAGS);
        }
    }




    static if(!is(typeof(__ILP32_OFF32_LDFLAGS))) {
        private enum enumMixinStr___ILP32_OFF32_LDFLAGS = `enum __ILP32_OFF32_LDFLAGS = "-m32";`;
        static if(is(typeof({ mixin(enumMixinStr___ILP32_OFF32_LDFLAGS); }))) {
            mixin(enumMixinStr___ILP32_OFF32_LDFLAGS);
        }
    }




    static if(!is(typeof(__ILP32_OFF32_CFLAGS))) {
        private enum enumMixinStr___ILP32_OFF32_CFLAGS = `enum __ILP32_OFF32_CFLAGS = "-m32";`;
        static if(is(typeof({ mixin(enumMixinStr___ILP32_OFF32_CFLAGS); }))) {
            mixin(enumMixinStr___ILP32_OFF32_CFLAGS);
        }
    }




    static if(!is(typeof(_XBS5_LP64_OFF64))) {
        private enum enumMixinStr__XBS5_LP64_OFF64 = `enum _XBS5_LP64_OFF64 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__XBS5_LP64_OFF64); }))) {
            mixin(enumMixinStr__XBS5_LP64_OFF64);
        }
    }




    static if(!is(typeof(_POSIX_V6_LP64_OFF64))) {
        private enum enumMixinStr__POSIX_V6_LP64_OFF64 = `enum _POSIX_V6_LP64_OFF64 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_V6_LP64_OFF64); }))) {
            mixin(enumMixinStr__POSIX_V6_LP64_OFF64);
        }
    }




    static if(!is(typeof(_POSIX_V7_LP64_OFF64))) {
        private enum enumMixinStr__POSIX_V7_LP64_OFF64 = `enum _POSIX_V7_LP64_OFF64 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_V7_LP64_OFF64); }))) {
            mixin(enumMixinStr__POSIX_V7_LP64_OFF64);
        }
    }




    static if(!is(typeof(_XBS5_LPBIG_OFFBIG))) {
        private enum enumMixinStr__XBS5_LPBIG_OFFBIG = `enum _XBS5_LPBIG_OFFBIG = - 1;`;
        static if(is(typeof({ mixin(enumMixinStr__XBS5_LPBIG_OFFBIG); }))) {
            mixin(enumMixinStr__XBS5_LPBIG_OFFBIG);
        }
    }




    static if(!is(typeof(_POSIX_V6_LPBIG_OFFBIG))) {
        private enum enumMixinStr__POSIX_V6_LPBIG_OFFBIG = `enum _POSIX_V6_LPBIG_OFFBIG = - 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_V6_LPBIG_OFFBIG); }))) {
            mixin(enumMixinStr__POSIX_V6_LPBIG_OFFBIG);
        }
    }




    static if(!is(typeof(_POSIX_V7_LPBIG_OFFBIG))) {
        private enum enumMixinStr__POSIX_V7_LPBIG_OFFBIG = `enum _POSIX_V7_LPBIG_OFFBIG = - 1;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_V7_LPBIG_OFFBIG); }))) {
            mixin(enumMixinStr__POSIX_V7_LPBIG_OFFBIG);
        }
    }




    static if(!is(typeof(__BYTE_ORDER))) {
        private enum enumMixinStr___BYTE_ORDER = `enum __BYTE_ORDER = 1234;`;
        static if(is(typeof({ mixin(enumMixinStr___BYTE_ORDER); }))) {
            mixin(enumMixinStr___BYTE_ORDER);
        }
    }




    static if(!is(typeof(_CS_V7_ENV))) {
        private enum enumMixinStr__CS_V7_ENV = `enum _CS_V7_ENV = _CS_V7_ENV;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_V7_ENV); }))) {
            mixin(enumMixinStr__CS_V7_ENV);
        }
    }




    static if(!is(typeof(_CS_V6_ENV))) {
        private enum enumMixinStr__CS_V6_ENV = `enum _CS_V6_ENV = _CS_V6_ENV;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_V6_ENV); }))) {
            mixin(enumMixinStr__CS_V6_ENV);
        }
    }




    static if(!is(typeof(_CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS = `enum _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS = _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V7_LPBIG_OFFBIG_LIBS))) {
        private enum enumMixinStr__CS_POSIX_V7_LPBIG_OFFBIG_LIBS = `enum _CS_POSIX_V7_LPBIG_OFFBIG_LIBS = _CS_POSIX_V7_LPBIG_OFFBIG_LIBS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V7_LPBIG_OFFBIG_LIBS); }))) {
            mixin(enumMixinStr__CS_POSIX_V7_LPBIG_OFFBIG_LIBS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS = `enum _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS = _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS = `enum _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS = _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V7_LP64_OFF64_LINTFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V7_LP64_OFF64_LINTFLAGS = `enum _CS_POSIX_V7_LP64_OFF64_LINTFLAGS = _CS_POSIX_V7_LP64_OFF64_LINTFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V7_LP64_OFF64_LINTFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V7_LP64_OFF64_LINTFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V7_LP64_OFF64_LIBS))) {
        private enum enumMixinStr__CS_POSIX_V7_LP64_OFF64_LIBS = `enum _CS_POSIX_V7_LP64_OFF64_LIBS = _CS_POSIX_V7_LP64_OFF64_LIBS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V7_LP64_OFF64_LIBS); }))) {
            mixin(enumMixinStr__CS_POSIX_V7_LP64_OFF64_LIBS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V7_LP64_OFF64_LDFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V7_LP64_OFF64_LDFLAGS = `enum _CS_POSIX_V7_LP64_OFF64_LDFLAGS = _CS_POSIX_V7_LP64_OFF64_LDFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V7_LP64_OFF64_LDFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V7_LP64_OFF64_LDFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V7_LP64_OFF64_CFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V7_LP64_OFF64_CFLAGS = `enum _CS_POSIX_V7_LP64_OFF64_CFLAGS = _CS_POSIX_V7_LP64_OFF64_CFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V7_LP64_OFF64_CFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V7_LP64_OFF64_CFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS = `enum _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS = _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V7_ILP32_OFFBIG_LIBS))) {
        private enum enumMixinStr__CS_POSIX_V7_ILP32_OFFBIG_LIBS = `enum _CS_POSIX_V7_ILP32_OFFBIG_LIBS = _CS_POSIX_V7_ILP32_OFFBIG_LIBS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V7_ILP32_OFFBIG_LIBS); }))) {
            mixin(enumMixinStr__CS_POSIX_V7_ILP32_OFFBIG_LIBS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS = `enum _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS = _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V7_ILP32_OFFBIG_CFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V7_ILP32_OFFBIG_CFLAGS = `enum _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS = _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V7_ILP32_OFFBIG_CFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V7_ILP32_OFFBIG_CFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V7_ILP32_OFF32_LINTFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V7_ILP32_OFF32_LINTFLAGS = `enum _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS = _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V7_ILP32_OFF32_LINTFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V7_ILP32_OFF32_LINTFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V7_ILP32_OFF32_LIBS))) {
        private enum enumMixinStr__CS_POSIX_V7_ILP32_OFF32_LIBS = `enum _CS_POSIX_V7_ILP32_OFF32_LIBS = _CS_POSIX_V7_ILP32_OFF32_LIBS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V7_ILP32_OFF32_LIBS); }))) {
            mixin(enumMixinStr__CS_POSIX_V7_ILP32_OFF32_LIBS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V7_ILP32_OFF32_LDFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V7_ILP32_OFF32_LDFLAGS = `enum _CS_POSIX_V7_ILP32_OFF32_LDFLAGS = _CS_POSIX_V7_ILP32_OFF32_LDFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V7_ILP32_OFF32_LDFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V7_ILP32_OFF32_LDFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V7_ILP32_OFF32_CFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V7_ILP32_OFF32_CFLAGS = `enum _CS_POSIX_V7_ILP32_OFF32_CFLAGS = _CS_POSIX_V7_ILP32_OFF32_CFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V7_ILP32_OFF32_CFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V7_ILP32_OFF32_CFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS = `enum _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS = _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V6_LPBIG_OFFBIG_LIBS))) {
        private enum enumMixinStr__CS_POSIX_V6_LPBIG_OFFBIG_LIBS = `enum _CS_POSIX_V6_LPBIG_OFFBIG_LIBS = _CS_POSIX_V6_LPBIG_OFFBIG_LIBS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V6_LPBIG_OFFBIG_LIBS); }))) {
            mixin(enumMixinStr__CS_POSIX_V6_LPBIG_OFFBIG_LIBS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS = `enum _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS = _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS = `enum _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS = _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V6_LP64_OFF64_LINTFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V6_LP64_OFF64_LINTFLAGS = `enum _CS_POSIX_V6_LP64_OFF64_LINTFLAGS = _CS_POSIX_V6_LP64_OFF64_LINTFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V6_LP64_OFF64_LINTFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V6_LP64_OFF64_LINTFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V6_LP64_OFF64_LIBS))) {
        private enum enumMixinStr__CS_POSIX_V6_LP64_OFF64_LIBS = `enum _CS_POSIX_V6_LP64_OFF64_LIBS = _CS_POSIX_V6_LP64_OFF64_LIBS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V6_LP64_OFF64_LIBS); }))) {
            mixin(enumMixinStr__CS_POSIX_V6_LP64_OFF64_LIBS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V6_LP64_OFF64_LDFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V6_LP64_OFF64_LDFLAGS = `enum _CS_POSIX_V6_LP64_OFF64_LDFLAGS = _CS_POSIX_V6_LP64_OFF64_LDFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V6_LP64_OFF64_LDFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V6_LP64_OFF64_LDFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V6_LP64_OFF64_CFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V6_LP64_OFF64_CFLAGS = `enum _CS_POSIX_V6_LP64_OFF64_CFLAGS = _CS_POSIX_V6_LP64_OFF64_CFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V6_LP64_OFF64_CFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V6_LP64_OFF64_CFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS = `enum _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS = _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V6_ILP32_OFFBIG_LIBS))) {
        private enum enumMixinStr__CS_POSIX_V6_ILP32_OFFBIG_LIBS = `enum _CS_POSIX_V6_ILP32_OFFBIG_LIBS = _CS_POSIX_V6_ILP32_OFFBIG_LIBS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V6_ILP32_OFFBIG_LIBS); }))) {
            mixin(enumMixinStr__CS_POSIX_V6_ILP32_OFFBIG_LIBS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS = `enum _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS = _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V6_ILP32_OFFBIG_CFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V6_ILP32_OFFBIG_CFLAGS = `enum _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS = _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V6_ILP32_OFFBIG_CFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V6_ILP32_OFFBIG_CFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V6_ILP32_OFF32_LINTFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V6_ILP32_OFF32_LINTFLAGS = `enum _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS = _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V6_ILP32_OFF32_LINTFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V6_ILP32_OFF32_LINTFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V6_ILP32_OFF32_LIBS))) {
        private enum enumMixinStr__CS_POSIX_V6_ILP32_OFF32_LIBS = `enum _CS_POSIX_V6_ILP32_OFF32_LIBS = _CS_POSIX_V6_ILP32_OFF32_LIBS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V6_ILP32_OFF32_LIBS); }))) {
            mixin(enumMixinStr__CS_POSIX_V6_ILP32_OFF32_LIBS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V6_ILP32_OFF32_LDFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V6_ILP32_OFF32_LDFLAGS = `enum _CS_POSIX_V6_ILP32_OFF32_LDFLAGS = _CS_POSIX_V6_ILP32_OFF32_LDFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V6_ILP32_OFF32_LDFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V6_ILP32_OFF32_LDFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V6_ILP32_OFF32_CFLAGS))) {
        private enum enumMixinStr__CS_POSIX_V6_ILP32_OFF32_CFLAGS = `enum _CS_POSIX_V6_ILP32_OFF32_CFLAGS = _CS_POSIX_V6_ILP32_OFF32_CFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V6_ILP32_OFF32_CFLAGS); }))) {
            mixin(enumMixinStr__CS_POSIX_V6_ILP32_OFF32_CFLAGS);
        }
    }




    static if(!is(typeof(_CS_XBS5_LPBIG_OFFBIG_LINTFLAGS))) {
        private enum enumMixinStr__CS_XBS5_LPBIG_OFFBIG_LINTFLAGS = `enum _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS = _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_XBS5_LPBIG_OFFBIG_LINTFLAGS); }))) {
            mixin(enumMixinStr__CS_XBS5_LPBIG_OFFBIG_LINTFLAGS);
        }
    }




    static if(!is(typeof(_CS_XBS5_LPBIG_OFFBIG_LIBS))) {
        private enum enumMixinStr__CS_XBS5_LPBIG_OFFBIG_LIBS = `enum _CS_XBS5_LPBIG_OFFBIG_LIBS = _CS_XBS5_LPBIG_OFFBIG_LIBS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_XBS5_LPBIG_OFFBIG_LIBS); }))) {
            mixin(enumMixinStr__CS_XBS5_LPBIG_OFFBIG_LIBS);
        }
    }




    static if(!is(typeof(_CS_XBS5_LPBIG_OFFBIG_LDFLAGS))) {
        private enum enumMixinStr__CS_XBS5_LPBIG_OFFBIG_LDFLAGS = `enum _CS_XBS5_LPBIG_OFFBIG_LDFLAGS = _CS_XBS5_LPBIG_OFFBIG_LDFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_XBS5_LPBIG_OFFBIG_LDFLAGS); }))) {
            mixin(enumMixinStr__CS_XBS5_LPBIG_OFFBIG_LDFLAGS);
        }
    }




    static if(!is(typeof(_CS_XBS5_LPBIG_OFFBIG_CFLAGS))) {
        private enum enumMixinStr__CS_XBS5_LPBIG_OFFBIG_CFLAGS = `enum _CS_XBS5_LPBIG_OFFBIG_CFLAGS = _CS_XBS5_LPBIG_OFFBIG_CFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_XBS5_LPBIG_OFFBIG_CFLAGS); }))) {
            mixin(enumMixinStr__CS_XBS5_LPBIG_OFFBIG_CFLAGS);
        }
    }




    static if(!is(typeof(_CS_XBS5_LP64_OFF64_LINTFLAGS))) {
        private enum enumMixinStr__CS_XBS5_LP64_OFF64_LINTFLAGS = `enum _CS_XBS5_LP64_OFF64_LINTFLAGS = _CS_XBS5_LP64_OFF64_LINTFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_XBS5_LP64_OFF64_LINTFLAGS); }))) {
            mixin(enumMixinStr__CS_XBS5_LP64_OFF64_LINTFLAGS);
        }
    }




    static if(!is(typeof(_CS_XBS5_LP64_OFF64_LIBS))) {
        private enum enumMixinStr__CS_XBS5_LP64_OFF64_LIBS = `enum _CS_XBS5_LP64_OFF64_LIBS = _CS_XBS5_LP64_OFF64_LIBS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_XBS5_LP64_OFF64_LIBS); }))) {
            mixin(enumMixinStr__CS_XBS5_LP64_OFF64_LIBS);
        }
    }




    static if(!is(typeof(_CS_XBS5_LP64_OFF64_LDFLAGS))) {
        private enum enumMixinStr__CS_XBS5_LP64_OFF64_LDFLAGS = `enum _CS_XBS5_LP64_OFF64_LDFLAGS = _CS_XBS5_LP64_OFF64_LDFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_XBS5_LP64_OFF64_LDFLAGS); }))) {
            mixin(enumMixinStr__CS_XBS5_LP64_OFF64_LDFLAGS);
        }
    }




    static if(!is(typeof(_CS_XBS5_LP64_OFF64_CFLAGS))) {
        private enum enumMixinStr__CS_XBS5_LP64_OFF64_CFLAGS = `enum _CS_XBS5_LP64_OFF64_CFLAGS = _CS_XBS5_LP64_OFF64_CFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_XBS5_LP64_OFF64_CFLAGS); }))) {
            mixin(enumMixinStr__CS_XBS5_LP64_OFF64_CFLAGS);
        }
    }




    static if(!is(typeof(_CS_XBS5_ILP32_OFFBIG_LINTFLAGS))) {
        private enum enumMixinStr__CS_XBS5_ILP32_OFFBIG_LINTFLAGS = `enum _CS_XBS5_ILP32_OFFBIG_LINTFLAGS = _CS_XBS5_ILP32_OFFBIG_LINTFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_XBS5_ILP32_OFFBIG_LINTFLAGS); }))) {
            mixin(enumMixinStr__CS_XBS5_ILP32_OFFBIG_LINTFLAGS);
        }
    }




    static if(!is(typeof(_CS_XBS5_ILP32_OFFBIG_LIBS))) {
        private enum enumMixinStr__CS_XBS5_ILP32_OFFBIG_LIBS = `enum _CS_XBS5_ILP32_OFFBIG_LIBS = _CS_XBS5_ILP32_OFFBIG_LIBS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_XBS5_ILP32_OFFBIG_LIBS); }))) {
            mixin(enumMixinStr__CS_XBS5_ILP32_OFFBIG_LIBS);
        }
    }




    static if(!is(typeof(_CS_XBS5_ILP32_OFFBIG_LDFLAGS))) {
        private enum enumMixinStr__CS_XBS5_ILP32_OFFBIG_LDFLAGS = `enum _CS_XBS5_ILP32_OFFBIG_LDFLAGS = _CS_XBS5_ILP32_OFFBIG_LDFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_XBS5_ILP32_OFFBIG_LDFLAGS); }))) {
            mixin(enumMixinStr__CS_XBS5_ILP32_OFFBIG_LDFLAGS);
        }
    }




    static if(!is(typeof(_CS_XBS5_ILP32_OFFBIG_CFLAGS))) {
        private enum enumMixinStr__CS_XBS5_ILP32_OFFBIG_CFLAGS = `enum _CS_XBS5_ILP32_OFFBIG_CFLAGS = _CS_XBS5_ILP32_OFFBIG_CFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_XBS5_ILP32_OFFBIG_CFLAGS); }))) {
            mixin(enumMixinStr__CS_XBS5_ILP32_OFFBIG_CFLAGS);
        }
    }




    static if(!is(typeof(_CS_XBS5_ILP32_OFF32_LINTFLAGS))) {
        private enum enumMixinStr__CS_XBS5_ILP32_OFF32_LINTFLAGS = `enum _CS_XBS5_ILP32_OFF32_LINTFLAGS = _CS_XBS5_ILP32_OFF32_LINTFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_XBS5_ILP32_OFF32_LINTFLAGS); }))) {
            mixin(enumMixinStr__CS_XBS5_ILP32_OFF32_LINTFLAGS);
        }
    }




    static if(!is(typeof(_CS_XBS5_ILP32_OFF32_LIBS))) {
        private enum enumMixinStr__CS_XBS5_ILP32_OFF32_LIBS = `enum _CS_XBS5_ILP32_OFF32_LIBS = _CS_XBS5_ILP32_OFF32_LIBS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_XBS5_ILP32_OFF32_LIBS); }))) {
            mixin(enumMixinStr__CS_XBS5_ILP32_OFF32_LIBS);
        }
    }




    static if(!is(typeof(_CS_XBS5_ILP32_OFF32_LDFLAGS))) {
        private enum enumMixinStr__CS_XBS5_ILP32_OFF32_LDFLAGS = `enum _CS_XBS5_ILP32_OFF32_LDFLAGS = _CS_XBS5_ILP32_OFF32_LDFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_XBS5_ILP32_OFF32_LDFLAGS); }))) {
            mixin(enumMixinStr__CS_XBS5_ILP32_OFF32_LDFLAGS);
        }
    }




    static if(!is(typeof(_CS_XBS5_ILP32_OFF32_CFLAGS))) {
        private enum enumMixinStr__CS_XBS5_ILP32_OFF32_CFLAGS = `enum _CS_XBS5_ILP32_OFF32_CFLAGS = _CS_XBS5_ILP32_OFF32_CFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_XBS5_ILP32_OFF32_CFLAGS); }))) {
            mixin(enumMixinStr__CS_XBS5_ILP32_OFF32_CFLAGS);
        }
    }




    static if(!is(typeof(_CS_LFS64_LINTFLAGS))) {
        private enum enumMixinStr__CS_LFS64_LINTFLAGS = `enum _CS_LFS64_LINTFLAGS = _CS_LFS64_LINTFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_LFS64_LINTFLAGS); }))) {
            mixin(enumMixinStr__CS_LFS64_LINTFLAGS);
        }
    }




    static if(!is(typeof(_CS_LFS64_LIBS))) {
        private enum enumMixinStr__CS_LFS64_LIBS = `enum _CS_LFS64_LIBS = _CS_LFS64_LIBS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_LFS64_LIBS); }))) {
            mixin(enumMixinStr__CS_LFS64_LIBS);
        }
    }




    static if(!is(typeof(_CS_LFS64_LDFLAGS))) {
        private enum enumMixinStr__CS_LFS64_LDFLAGS = `enum _CS_LFS64_LDFLAGS = _CS_LFS64_LDFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_LFS64_LDFLAGS); }))) {
            mixin(enumMixinStr__CS_LFS64_LDFLAGS);
        }
    }




    static if(!is(typeof(_CS_LFS64_CFLAGS))) {
        private enum enumMixinStr__CS_LFS64_CFLAGS = `enum _CS_LFS64_CFLAGS = _CS_LFS64_CFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_LFS64_CFLAGS); }))) {
            mixin(enumMixinStr__CS_LFS64_CFLAGS);
        }
    }




    static if(!is(typeof(_CS_LFS_LINTFLAGS))) {
        private enum enumMixinStr__CS_LFS_LINTFLAGS = `enum _CS_LFS_LINTFLAGS = _CS_LFS_LINTFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_LFS_LINTFLAGS); }))) {
            mixin(enumMixinStr__CS_LFS_LINTFLAGS);
        }
    }




    static if(!is(typeof(_CS_LFS_LIBS))) {
        private enum enumMixinStr__CS_LFS_LIBS = `enum _CS_LFS_LIBS = _CS_LFS_LIBS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_LFS_LIBS); }))) {
            mixin(enumMixinStr__CS_LFS_LIBS);
        }
    }




    static if(!is(typeof(_CS_LFS_LDFLAGS))) {
        private enum enumMixinStr__CS_LFS_LDFLAGS = `enum _CS_LFS_LDFLAGS = _CS_LFS_LDFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_LFS_LDFLAGS); }))) {
            mixin(enumMixinStr__CS_LFS_LDFLAGS);
        }
    }




    static if(!is(typeof(_CS_LFS_CFLAGS))) {
        private enum enumMixinStr__CS_LFS_CFLAGS = `enum _CS_LFS_CFLAGS = _CS_LFS_CFLAGS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_LFS_CFLAGS); }))) {
            mixin(enumMixinStr__CS_LFS_CFLAGS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V7_WIDTH_RESTRICTED_ENVS))) {
        private enum enumMixinStr__CS_POSIX_V7_WIDTH_RESTRICTED_ENVS = `enum _CS_POSIX_V7_WIDTH_RESTRICTED_ENVS = _CS_V7_WIDTH_RESTRICTED_ENVS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V7_WIDTH_RESTRICTED_ENVS); }))) {
            mixin(enumMixinStr__CS_POSIX_V7_WIDTH_RESTRICTED_ENVS);
        }
    }




    static if(!is(typeof(_CS_V7_WIDTH_RESTRICTED_ENVS))) {
        private enum enumMixinStr__CS_V7_WIDTH_RESTRICTED_ENVS = `enum _CS_V7_WIDTH_RESTRICTED_ENVS = _CS_V7_WIDTH_RESTRICTED_ENVS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_V7_WIDTH_RESTRICTED_ENVS); }))) {
            mixin(enumMixinStr__CS_V7_WIDTH_RESTRICTED_ENVS);
        }
    }




    static if(!is(typeof(_CS_POSIX_V5_WIDTH_RESTRICTED_ENVS))) {
        private enum enumMixinStr__CS_POSIX_V5_WIDTH_RESTRICTED_ENVS = `enum _CS_POSIX_V5_WIDTH_RESTRICTED_ENVS = _CS_V5_WIDTH_RESTRICTED_ENVS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V5_WIDTH_RESTRICTED_ENVS); }))) {
            mixin(enumMixinStr__CS_POSIX_V5_WIDTH_RESTRICTED_ENVS);
        }
    }




    static if(!is(typeof(_CS_V5_WIDTH_RESTRICTED_ENVS))) {
        private enum enumMixinStr__CS_V5_WIDTH_RESTRICTED_ENVS = `enum _CS_V5_WIDTH_RESTRICTED_ENVS = _CS_V5_WIDTH_RESTRICTED_ENVS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_V5_WIDTH_RESTRICTED_ENVS); }))) {
            mixin(enumMixinStr__CS_V5_WIDTH_RESTRICTED_ENVS);
        }
    }




    static if(!is(typeof(_CS_GNU_LIBPTHREAD_VERSION))) {
        private enum enumMixinStr__CS_GNU_LIBPTHREAD_VERSION = `enum _CS_GNU_LIBPTHREAD_VERSION = _CS_GNU_LIBPTHREAD_VERSION;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_GNU_LIBPTHREAD_VERSION); }))) {
            mixin(enumMixinStr__CS_GNU_LIBPTHREAD_VERSION);
        }
    }




    static if(!is(typeof(_CS_GNU_LIBC_VERSION))) {
        private enum enumMixinStr__CS_GNU_LIBC_VERSION = `enum _CS_GNU_LIBC_VERSION = _CS_GNU_LIBC_VERSION;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_GNU_LIBC_VERSION); }))) {
            mixin(enumMixinStr__CS_GNU_LIBC_VERSION);
        }
    }




    static if(!is(typeof(_CS_POSIX_V6_WIDTH_RESTRICTED_ENVS))) {
        private enum enumMixinStr__CS_POSIX_V6_WIDTH_RESTRICTED_ENVS = `enum _CS_POSIX_V6_WIDTH_RESTRICTED_ENVS = _CS_V6_WIDTH_RESTRICTED_ENVS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_POSIX_V6_WIDTH_RESTRICTED_ENVS); }))) {
            mixin(enumMixinStr__CS_POSIX_V6_WIDTH_RESTRICTED_ENVS);
        }
    }




    static if(!is(typeof(_CS_V6_WIDTH_RESTRICTED_ENVS))) {
        private enum enumMixinStr__CS_V6_WIDTH_RESTRICTED_ENVS = `enum _CS_V6_WIDTH_RESTRICTED_ENVS = _CS_V6_WIDTH_RESTRICTED_ENVS;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_V6_WIDTH_RESTRICTED_ENVS); }))) {
            mixin(enumMixinStr__CS_V6_WIDTH_RESTRICTED_ENVS);
        }
    }




    static if(!is(typeof(_CS_PATH))) {
        private enum enumMixinStr__CS_PATH = `enum _CS_PATH = _CS_PATH;`;
        static if(is(typeof({ mixin(enumMixinStr__CS_PATH); }))) {
            mixin(enumMixinStr__CS_PATH);
        }
    }




    static if(!is(typeof(_SC_THREAD_ROBUST_PRIO_PROTECT))) {
        private enum enumMixinStr__SC_THREAD_ROBUST_PRIO_PROTECT = `enum _SC_THREAD_ROBUST_PRIO_PROTECT = _SC_THREAD_ROBUST_PRIO_PROTECT;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_THREAD_ROBUST_PRIO_PROTECT); }))) {
            mixin(enumMixinStr__SC_THREAD_ROBUST_PRIO_PROTECT);
        }
    }




    static if(!is(typeof(_SC_THREAD_ROBUST_PRIO_INHERIT))) {
        private enum enumMixinStr__SC_THREAD_ROBUST_PRIO_INHERIT = `enum _SC_THREAD_ROBUST_PRIO_INHERIT = _SC_THREAD_ROBUST_PRIO_INHERIT;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_THREAD_ROBUST_PRIO_INHERIT); }))) {
            mixin(enumMixinStr__SC_THREAD_ROBUST_PRIO_INHERIT);
        }
    }




    static if(!is(typeof(_SC_XOPEN_STREAMS))) {
        private enum enumMixinStr__SC_XOPEN_STREAMS = `enum _SC_XOPEN_STREAMS = _SC_XOPEN_STREAMS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_XOPEN_STREAMS); }))) {
            mixin(enumMixinStr__SC_XOPEN_STREAMS);
        }
    }




    static if(!is(typeof(_SC_TRACE_USER_EVENT_MAX))) {
        private enum enumMixinStr__SC_TRACE_USER_EVENT_MAX = `enum _SC_TRACE_USER_EVENT_MAX = _SC_TRACE_USER_EVENT_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_TRACE_USER_EVENT_MAX); }))) {
            mixin(enumMixinStr__SC_TRACE_USER_EVENT_MAX);
        }
    }




    static if(!is(typeof(_SC_TRACE_SYS_MAX))) {
        private enum enumMixinStr__SC_TRACE_SYS_MAX = `enum _SC_TRACE_SYS_MAX = _SC_TRACE_SYS_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_TRACE_SYS_MAX); }))) {
            mixin(enumMixinStr__SC_TRACE_SYS_MAX);
        }
    }




    static if(!is(typeof(_SC_TRACE_NAME_MAX))) {
        private enum enumMixinStr__SC_TRACE_NAME_MAX = `enum _SC_TRACE_NAME_MAX = _SC_TRACE_NAME_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_TRACE_NAME_MAX); }))) {
            mixin(enumMixinStr__SC_TRACE_NAME_MAX);
        }
    }




    static if(!is(typeof(_SC_TRACE_EVENT_NAME_MAX))) {
        private enum enumMixinStr__SC_TRACE_EVENT_NAME_MAX = `enum _SC_TRACE_EVENT_NAME_MAX = _SC_TRACE_EVENT_NAME_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_TRACE_EVENT_NAME_MAX); }))) {
            mixin(enumMixinStr__SC_TRACE_EVENT_NAME_MAX);
        }
    }




    static if(!is(typeof(_SC_SS_REPL_MAX))) {
        private enum enumMixinStr__SC_SS_REPL_MAX = `enum _SC_SS_REPL_MAX = _SC_SS_REPL_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SS_REPL_MAX); }))) {
            mixin(enumMixinStr__SC_SS_REPL_MAX);
        }
    }




    static if(!is(typeof(_SC_V7_LPBIG_OFFBIG))) {
        private enum enumMixinStr__SC_V7_LPBIG_OFFBIG = `enum _SC_V7_LPBIG_OFFBIG = _SC_V7_LPBIG_OFFBIG;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_V7_LPBIG_OFFBIG); }))) {
            mixin(enumMixinStr__SC_V7_LPBIG_OFFBIG);
        }
    }




    static if(!is(typeof(_SC_V7_LP64_OFF64))) {
        private enum enumMixinStr__SC_V7_LP64_OFF64 = `enum _SC_V7_LP64_OFF64 = _SC_V7_LP64_OFF64;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_V7_LP64_OFF64); }))) {
            mixin(enumMixinStr__SC_V7_LP64_OFF64);
        }
    }




    static if(!is(typeof(_SC_V7_ILP32_OFFBIG))) {
        private enum enumMixinStr__SC_V7_ILP32_OFFBIG = `enum _SC_V7_ILP32_OFFBIG = _SC_V7_ILP32_OFFBIG;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_V7_ILP32_OFFBIG); }))) {
            mixin(enumMixinStr__SC_V7_ILP32_OFFBIG);
        }
    }




    static if(!is(typeof(_SC_V7_ILP32_OFF32))) {
        private enum enumMixinStr__SC_V7_ILP32_OFF32 = `enum _SC_V7_ILP32_OFF32 = _SC_V7_ILP32_OFF32;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_V7_ILP32_OFF32); }))) {
            mixin(enumMixinStr__SC_V7_ILP32_OFF32);
        }
    }




    static if(!is(typeof(_SC_RAW_SOCKETS))) {
        private enum enumMixinStr__SC_RAW_SOCKETS = `enum _SC_RAW_SOCKETS = _SC_RAW_SOCKETS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_RAW_SOCKETS); }))) {
            mixin(enumMixinStr__SC_RAW_SOCKETS);
        }
    }




    static if(!is(typeof(_SC_IPV6))) {
        private enum enumMixinStr__SC_IPV6 = `enum _SC_IPV6 = _SC_IPV6;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_IPV6); }))) {
            mixin(enumMixinStr__SC_IPV6);
        }
    }




    static if(!is(typeof(_SC_LEVEL4_CACHE_LINESIZE))) {
        private enum enumMixinStr__SC_LEVEL4_CACHE_LINESIZE = `enum _SC_LEVEL4_CACHE_LINESIZE = _SC_LEVEL4_CACHE_LINESIZE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_LEVEL4_CACHE_LINESIZE); }))) {
            mixin(enumMixinStr__SC_LEVEL4_CACHE_LINESIZE);
        }
    }




    static if(!is(typeof(_SC_LEVEL4_CACHE_ASSOC))) {
        private enum enumMixinStr__SC_LEVEL4_CACHE_ASSOC = `enum _SC_LEVEL4_CACHE_ASSOC = _SC_LEVEL4_CACHE_ASSOC;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_LEVEL4_CACHE_ASSOC); }))) {
            mixin(enumMixinStr__SC_LEVEL4_CACHE_ASSOC);
        }
    }




    static if(!is(typeof(_SC_LEVEL4_CACHE_SIZE))) {
        private enum enumMixinStr__SC_LEVEL4_CACHE_SIZE = `enum _SC_LEVEL4_CACHE_SIZE = _SC_LEVEL4_CACHE_SIZE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_LEVEL4_CACHE_SIZE); }))) {
            mixin(enumMixinStr__SC_LEVEL4_CACHE_SIZE);
        }
    }




    static if(!is(typeof(_SC_LEVEL3_CACHE_LINESIZE))) {
        private enum enumMixinStr__SC_LEVEL3_CACHE_LINESIZE = `enum _SC_LEVEL3_CACHE_LINESIZE = _SC_LEVEL3_CACHE_LINESIZE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_LEVEL3_CACHE_LINESIZE); }))) {
            mixin(enumMixinStr__SC_LEVEL3_CACHE_LINESIZE);
        }
    }




    static if(!is(typeof(_SC_LEVEL3_CACHE_ASSOC))) {
        private enum enumMixinStr__SC_LEVEL3_CACHE_ASSOC = `enum _SC_LEVEL3_CACHE_ASSOC = _SC_LEVEL3_CACHE_ASSOC;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_LEVEL3_CACHE_ASSOC); }))) {
            mixin(enumMixinStr__SC_LEVEL3_CACHE_ASSOC);
        }
    }




    static if(!is(typeof(_SC_LEVEL3_CACHE_SIZE))) {
        private enum enumMixinStr__SC_LEVEL3_CACHE_SIZE = `enum _SC_LEVEL3_CACHE_SIZE = _SC_LEVEL3_CACHE_SIZE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_LEVEL3_CACHE_SIZE); }))) {
            mixin(enumMixinStr__SC_LEVEL3_CACHE_SIZE);
        }
    }




    static if(!is(typeof(_SC_LEVEL2_CACHE_LINESIZE))) {
        private enum enumMixinStr__SC_LEVEL2_CACHE_LINESIZE = `enum _SC_LEVEL2_CACHE_LINESIZE = _SC_LEVEL2_CACHE_LINESIZE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_LEVEL2_CACHE_LINESIZE); }))) {
            mixin(enumMixinStr__SC_LEVEL2_CACHE_LINESIZE);
        }
    }




    static if(!is(typeof(_SC_LEVEL2_CACHE_ASSOC))) {
        private enum enumMixinStr__SC_LEVEL2_CACHE_ASSOC = `enum _SC_LEVEL2_CACHE_ASSOC = _SC_LEVEL2_CACHE_ASSOC;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_LEVEL2_CACHE_ASSOC); }))) {
            mixin(enumMixinStr__SC_LEVEL2_CACHE_ASSOC);
        }
    }




    static if(!is(typeof(_SC_LEVEL2_CACHE_SIZE))) {
        private enum enumMixinStr__SC_LEVEL2_CACHE_SIZE = `enum _SC_LEVEL2_CACHE_SIZE = _SC_LEVEL2_CACHE_SIZE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_LEVEL2_CACHE_SIZE); }))) {
            mixin(enumMixinStr__SC_LEVEL2_CACHE_SIZE);
        }
    }




    static if(!is(typeof(_SC_LEVEL1_DCACHE_LINESIZE))) {
        private enum enumMixinStr__SC_LEVEL1_DCACHE_LINESIZE = `enum _SC_LEVEL1_DCACHE_LINESIZE = _SC_LEVEL1_DCACHE_LINESIZE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_LEVEL1_DCACHE_LINESIZE); }))) {
            mixin(enumMixinStr__SC_LEVEL1_DCACHE_LINESIZE);
        }
    }




    static if(!is(typeof(_SC_LEVEL1_DCACHE_ASSOC))) {
        private enum enumMixinStr__SC_LEVEL1_DCACHE_ASSOC = `enum _SC_LEVEL1_DCACHE_ASSOC = _SC_LEVEL1_DCACHE_ASSOC;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_LEVEL1_DCACHE_ASSOC); }))) {
            mixin(enumMixinStr__SC_LEVEL1_DCACHE_ASSOC);
        }
    }




    static if(!is(typeof(_SC_LEVEL1_DCACHE_SIZE))) {
        private enum enumMixinStr__SC_LEVEL1_DCACHE_SIZE = `enum _SC_LEVEL1_DCACHE_SIZE = _SC_LEVEL1_DCACHE_SIZE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_LEVEL1_DCACHE_SIZE); }))) {
            mixin(enumMixinStr__SC_LEVEL1_DCACHE_SIZE);
        }
    }




    static if(!is(typeof(_SC_LEVEL1_ICACHE_LINESIZE))) {
        private enum enumMixinStr__SC_LEVEL1_ICACHE_LINESIZE = `enum _SC_LEVEL1_ICACHE_LINESIZE = _SC_LEVEL1_ICACHE_LINESIZE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_LEVEL1_ICACHE_LINESIZE); }))) {
            mixin(enumMixinStr__SC_LEVEL1_ICACHE_LINESIZE);
        }
    }




    static if(!is(typeof(_SC_LEVEL1_ICACHE_ASSOC))) {
        private enum enumMixinStr__SC_LEVEL1_ICACHE_ASSOC = `enum _SC_LEVEL1_ICACHE_ASSOC = _SC_LEVEL1_ICACHE_ASSOC;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_LEVEL1_ICACHE_ASSOC); }))) {
            mixin(enumMixinStr__SC_LEVEL1_ICACHE_ASSOC);
        }
    }




    static if(!is(typeof(_SC_LEVEL1_ICACHE_SIZE))) {
        private enum enumMixinStr__SC_LEVEL1_ICACHE_SIZE = `enum _SC_LEVEL1_ICACHE_SIZE = _SC_LEVEL1_ICACHE_SIZE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_LEVEL1_ICACHE_SIZE); }))) {
            mixin(enumMixinStr__SC_LEVEL1_ICACHE_SIZE);
        }
    }




    static if(!is(typeof(_SC_TRACE_LOG))) {
        private enum enumMixinStr__SC_TRACE_LOG = `enum _SC_TRACE_LOG = _SC_TRACE_LOG;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_TRACE_LOG); }))) {
            mixin(enumMixinStr__SC_TRACE_LOG);
        }
    }




    static if(!is(typeof(_SC_TRACE_INHERIT))) {
        private enum enumMixinStr__SC_TRACE_INHERIT = `enum _SC_TRACE_INHERIT = _SC_TRACE_INHERIT;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_TRACE_INHERIT); }))) {
            mixin(enumMixinStr__SC_TRACE_INHERIT);
        }
    }




    static if(!is(typeof(_SC_TRACE_EVENT_FILTER))) {
        private enum enumMixinStr__SC_TRACE_EVENT_FILTER = `enum _SC_TRACE_EVENT_FILTER = _SC_TRACE_EVENT_FILTER;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_TRACE_EVENT_FILTER); }))) {
            mixin(enumMixinStr__SC_TRACE_EVENT_FILTER);
        }
    }




    static if(!is(typeof(_SC_TRACE))) {
        private enum enumMixinStr__SC_TRACE = `enum _SC_TRACE = _SC_TRACE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_TRACE); }))) {
            mixin(enumMixinStr__SC_TRACE);
        }
    }




    static if(!is(typeof(_SC_HOST_NAME_MAX))) {
        private enum enumMixinStr__SC_HOST_NAME_MAX = `enum _SC_HOST_NAME_MAX = _SC_HOST_NAME_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_HOST_NAME_MAX); }))) {
            mixin(enumMixinStr__SC_HOST_NAME_MAX);
        }
    }




    static if(!is(typeof(_SC_V6_LPBIG_OFFBIG))) {
        private enum enumMixinStr__SC_V6_LPBIG_OFFBIG = `enum _SC_V6_LPBIG_OFFBIG = _SC_V6_LPBIG_OFFBIG;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_V6_LPBIG_OFFBIG); }))) {
            mixin(enumMixinStr__SC_V6_LPBIG_OFFBIG);
        }
    }




    static if(!is(typeof(_SC_V6_LP64_OFF64))) {
        private enum enumMixinStr__SC_V6_LP64_OFF64 = `enum _SC_V6_LP64_OFF64 = _SC_V6_LP64_OFF64;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_V6_LP64_OFF64); }))) {
            mixin(enumMixinStr__SC_V6_LP64_OFF64);
        }
    }




    static if(!is(typeof(_SC_V6_ILP32_OFFBIG))) {
        private enum enumMixinStr__SC_V6_ILP32_OFFBIG = `enum _SC_V6_ILP32_OFFBIG = _SC_V6_ILP32_OFFBIG;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_V6_ILP32_OFFBIG); }))) {
            mixin(enumMixinStr__SC_V6_ILP32_OFFBIG);
        }
    }




    static if(!is(typeof(_SC_V6_ILP32_OFF32))) {
        private enum enumMixinStr__SC_V6_ILP32_OFF32 = `enum _SC_V6_ILP32_OFF32 = _SC_V6_ILP32_OFF32;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_V6_ILP32_OFF32); }))) {
            mixin(enumMixinStr__SC_V6_ILP32_OFF32);
        }
    }




    static if(!is(typeof(_SC_2_PBS_CHECKPOINT))) {
        private enum enumMixinStr__SC_2_PBS_CHECKPOINT = `enum _SC_2_PBS_CHECKPOINT = _SC_2_PBS_CHECKPOINT;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_2_PBS_CHECKPOINT); }))) {
            mixin(enumMixinStr__SC_2_PBS_CHECKPOINT);
        }
    }




    static if(!is(typeof(_SC_STREAMS))) {
        private enum enumMixinStr__SC_STREAMS = `enum _SC_STREAMS = _SC_STREAMS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_STREAMS); }))) {
            mixin(enumMixinStr__SC_STREAMS);
        }
    }




    static if(!is(typeof(_SC_SYMLOOP_MAX))) {
        private enum enumMixinStr__SC_SYMLOOP_MAX = `enum _SC_SYMLOOP_MAX = _SC_SYMLOOP_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SYMLOOP_MAX); }))) {
            mixin(enumMixinStr__SC_SYMLOOP_MAX);
        }
    }




    static if(!is(typeof(_SC_2_PBS_TRACK))) {
        private enum enumMixinStr__SC_2_PBS_TRACK = `enum _SC_2_PBS_TRACK = _SC_2_PBS_TRACK;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_2_PBS_TRACK); }))) {
            mixin(enumMixinStr__SC_2_PBS_TRACK);
        }
    }




    static if(!is(typeof(_SC_2_PBS_MESSAGE))) {
        private enum enumMixinStr__SC_2_PBS_MESSAGE = `enum _SC_2_PBS_MESSAGE = _SC_2_PBS_MESSAGE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_2_PBS_MESSAGE); }))) {
            mixin(enumMixinStr__SC_2_PBS_MESSAGE);
        }
    }




    static if(!is(typeof(_SC_2_PBS_LOCATE))) {
        private enum enumMixinStr__SC_2_PBS_LOCATE = `enum _SC_2_PBS_LOCATE = _SC_2_PBS_LOCATE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_2_PBS_LOCATE); }))) {
            mixin(enumMixinStr__SC_2_PBS_LOCATE);
        }
    }




    static if(!is(typeof(_SC_2_PBS_ACCOUNTING))) {
        private enum enumMixinStr__SC_2_PBS_ACCOUNTING = `enum _SC_2_PBS_ACCOUNTING = _SC_2_PBS_ACCOUNTING;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_2_PBS_ACCOUNTING); }))) {
            mixin(enumMixinStr__SC_2_PBS_ACCOUNTING);
        }
    }




    static if(!is(typeof(_SC_2_PBS))) {
        private enum enumMixinStr__SC_2_PBS = `enum _SC_2_PBS = _SC_2_PBS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_2_PBS); }))) {
            mixin(enumMixinStr__SC_2_PBS);
        }
    }




    static if(!is(typeof(_SC_USER_GROUPS_R))) {
        private enum enumMixinStr__SC_USER_GROUPS_R = `enum _SC_USER_GROUPS_R = _SC_USER_GROUPS_R;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_USER_GROUPS_R); }))) {
            mixin(enumMixinStr__SC_USER_GROUPS_R);
        }
    }




    static if(!is(typeof(_SC_USER_GROUPS))) {
        private enum enumMixinStr__SC_USER_GROUPS = `enum _SC_USER_GROUPS = _SC_USER_GROUPS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_USER_GROUPS); }))) {
            mixin(enumMixinStr__SC_USER_GROUPS);
        }
    }




    static if(!is(typeof(_SC_TYPED_MEMORY_OBJECTS))) {
        private enum enumMixinStr__SC_TYPED_MEMORY_OBJECTS = `enum _SC_TYPED_MEMORY_OBJECTS = _SC_TYPED_MEMORY_OBJECTS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_TYPED_MEMORY_OBJECTS); }))) {
            mixin(enumMixinStr__SC_TYPED_MEMORY_OBJECTS);
        }
    }




    static if(!is(typeof(_SC_TIMEOUTS))) {
        private enum enumMixinStr__SC_TIMEOUTS = `enum _SC_TIMEOUTS = _SC_TIMEOUTS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_TIMEOUTS); }))) {
            mixin(enumMixinStr__SC_TIMEOUTS);
        }
    }




    static if(!is(typeof(_SC_SYSTEM_DATABASE_R))) {
        private enum enumMixinStr__SC_SYSTEM_DATABASE_R = `enum _SC_SYSTEM_DATABASE_R = _SC_SYSTEM_DATABASE_R;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SYSTEM_DATABASE_R); }))) {
            mixin(enumMixinStr__SC_SYSTEM_DATABASE_R);
        }
    }




    static if(!is(typeof(_SC_SYSTEM_DATABASE))) {
        private enum enumMixinStr__SC_SYSTEM_DATABASE = `enum _SC_SYSTEM_DATABASE = _SC_SYSTEM_DATABASE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SYSTEM_DATABASE); }))) {
            mixin(enumMixinStr__SC_SYSTEM_DATABASE);
        }
    }




    static if(!is(typeof(_SC_THREAD_SPORADIC_SERVER))) {
        private enum enumMixinStr__SC_THREAD_SPORADIC_SERVER = `enum _SC_THREAD_SPORADIC_SERVER = _SC_THREAD_SPORADIC_SERVER;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_THREAD_SPORADIC_SERVER); }))) {
            mixin(enumMixinStr__SC_THREAD_SPORADIC_SERVER);
        }
    }




    static if(!is(typeof(_SC_SPORADIC_SERVER))) {
        private enum enumMixinStr__SC_SPORADIC_SERVER = `enum _SC_SPORADIC_SERVER = _SC_SPORADIC_SERVER;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SPORADIC_SERVER); }))) {
            mixin(enumMixinStr__SC_SPORADIC_SERVER);
        }
    }




    static if(!is(typeof(_SC_SPAWN))) {
        private enum enumMixinStr__SC_SPAWN = `enum _SC_SPAWN = _SC_SPAWN;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SPAWN); }))) {
            mixin(enumMixinStr__SC_SPAWN);
        }
    }




    static if(!is(typeof(_SC_SIGNALS))) {
        private enum enumMixinStr__SC_SIGNALS = `enum _SC_SIGNALS = _SC_SIGNALS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SIGNALS); }))) {
            mixin(enumMixinStr__SC_SIGNALS);
        }
    }




    static if(!is(typeof(_SC_SHELL))) {
        private enum enumMixinStr__SC_SHELL = `enum _SC_SHELL = _SC_SHELL;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SHELL); }))) {
            mixin(enumMixinStr__SC_SHELL);
        }
    }




    static if(!is(typeof(_SC_REGEX_VERSION))) {
        private enum enumMixinStr__SC_REGEX_VERSION = `enum _SC_REGEX_VERSION = _SC_REGEX_VERSION;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_REGEX_VERSION); }))) {
            mixin(enumMixinStr__SC_REGEX_VERSION);
        }
    }




    static if(!is(typeof(_SC_REGEXP))) {
        private enum enumMixinStr__SC_REGEXP = `enum _SC_REGEXP = _SC_REGEXP;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_REGEXP); }))) {
            mixin(enumMixinStr__SC_REGEXP);
        }
    }




    static if(!is(typeof(_SC_SPIN_LOCKS))) {
        private enum enumMixinStr__SC_SPIN_LOCKS = `enum _SC_SPIN_LOCKS = _SC_SPIN_LOCKS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SPIN_LOCKS); }))) {
            mixin(enumMixinStr__SC_SPIN_LOCKS);
        }
    }




    static if(!is(typeof(_SC_READER_WRITER_LOCKS))) {
        private enum enumMixinStr__SC_READER_WRITER_LOCKS = `enum _SC_READER_WRITER_LOCKS = _SC_READER_WRITER_LOCKS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_READER_WRITER_LOCKS); }))) {
            mixin(enumMixinStr__SC_READER_WRITER_LOCKS);
        }
    }




    static if(!is(typeof(_SC_NETWORKING))) {
        private enum enumMixinStr__SC_NETWORKING = `enum _SC_NETWORKING = _SC_NETWORKING;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_NETWORKING); }))) {
            mixin(enumMixinStr__SC_NETWORKING);
        }
    }




    static if(!is(typeof(_SC_SINGLE_PROCESS))) {
        private enum enumMixinStr__SC_SINGLE_PROCESS = `enum _SC_SINGLE_PROCESS = _SC_SINGLE_PROCESS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SINGLE_PROCESS); }))) {
            mixin(enumMixinStr__SC_SINGLE_PROCESS);
        }
    }




    static if(!is(typeof(_SC_MULTI_PROCESS))) {
        private enum enumMixinStr__SC_MULTI_PROCESS = `enum _SC_MULTI_PROCESS = _SC_MULTI_PROCESS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_MULTI_PROCESS); }))) {
            mixin(enumMixinStr__SC_MULTI_PROCESS);
        }
    }




    static if(!is(typeof(_SC_MONOTONIC_CLOCK))) {
        private enum enumMixinStr__SC_MONOTONIC_CLOCK = `enum _SC_MONOTONIC_CLOCK = _SC_MONOTONIC_CLOCK;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_MONOTONIC_CLOCK); }))) {
            mixin(enumMixinStr__SC_MONOTONIC_CLOCK);
        }
    }




    static if(!is(typeof(_SC_FILE_SYSTEM))) {
        private enum enumMixinStr__SC_FILE_SYSTEM = `enum _SC_FILE_SYSTEM = _SC_FILE_SYSTEM;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_FILE_SYSTEM); }))) {
            mixin(enumMixinStr__SC_FILE_SYSTEM);
        }
    }




    static if(!is(typeof(_SC_FILE_LOCKING))) {
        private enum enumMixinStr__SC_FILE_LOCKING = `enum _SC_FILE_LOCKING = _SC_FILE_LOCKING;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_FILE_LOCKING); }))) {
            mixin(enumMixinStr__SC_FILE_LOCKING);
        }
    }




    static if(!is(typeof(_SC_FILE_ATTRIBUTES))) {
        private enum enumMixinStr__SC_FILE_ATTRIBUTES = `enum _SC_FILE_ATTRIBUTES = _SC_FILE_ATTRIBUTES;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_FILE_ATTRIBUTES); }))) {
            mixin(enumMixinStr__SC_FILE_ATTRIBUTES);
        }
    }




    static if(!is(typeof(_SC_PIPE))) {
        private enum enumMixinStr__SC_PIPE = `enum _SC_PIPE = _SC_PIPE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_PIPE); }))) {
            mixin(enumMixinStr__SC_PIPE);
        }
    }




    static if(!is(typeof(_SC_FIFO))) {
        private enum enumMixinStr__SC_FIFO = `enum _SC_FIFO = _SC_FIFO;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_FIFO); }))) {
            mixin(enumMixinStr__SC_FIFO);
        }
    }




    static if(!is(typeof(_SC_FD_MGMT))) {
        private enum enumMixinStr__SC_FD_MGMT = `enum _SC_FD_MGMT = _SC_FD_MGMT;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_FD_MGMT); }))) {
            mixin(enumMixinStr__SC_FD_MGMT);
        }
    }




    static if(!is(typeof(_SC_DEVICE_SPECIFIC_R))) {
        private enum enumMixinStr__SC_DEVICE_SPECIFIC_R = `enum _SC_DEVICE_SPECIFIC_R = _SC_DEVICE_SPECIFIC_R;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_DEVICE_SPECIFIC_R); }))) {
            mixin(enumMixinStr__SC_DEVICE_SPECIFIC_R);
        }
    }




    static if(!is(typeof(_SC_DEVICE_SPECIFIC))) {
        private enum enumMixinStr__SC_DEVICE_SPECIFIC = `enum _SC_DEVICE_SPECIFIC = _SC_DEVICE_SPECIFIC;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_DEVICE_SPECIFIC); }))) {
            mixin(enumMixinStr__SC_DEVICE_SPECIFIC);
        }
    }




    static if(!is(typeof(_SC_DEVICE_IO))) {
        private enum enumMixinStr__SC_DEVICE_IO = `enum _SC_DEVICE_IO = _SC_DEVICE_IO;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_DEVICE_IO); }))) {
            mixin(enumMixinStr__SC_DEVICE_IO);
        }
    }




    static if(!is(typeof(_SC_THREAD_CPUTIME))) {
        private enum enumMixinStr__SC_THREAD_CPUTIME = `enum _SC_THREAD_CPUTIME = _SC_THREAD_CPUTIME;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_THREAD_CPUTIME); }))) {
            mixin(enumMixinStr__SC_THREAD_CPUTIME);
        }
    }




    static if(!is(typeof(_SC_CPUTIME))) {
        private enum enumMixinStr__SC_CPUTIME = `enum _SC_CPUTIME = _SC_CPUTIME;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_CPUTIME); }))) {
            mixin(enumMixinStr__SC_CPUTIME);
        }
    }




    static if(!is(typeof(_SC_CLOCK_SELECTION))) {
        private enum enumMixinStr__SC_CLOCK_SELECTION = `enum _SC_CLOCK_SELECTION = _SC_CLOCK_SELECTION;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_CLOCK_SELECTION); }))) {
            mixin(enumMixinStr__SC_CLOCK_SELECTION);
        }
    }




    static if(!is(typeof(_STRINGS_H))) {
        private enum enumMixinStr__STRINGS_H = `enum _STRINGS_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STRINGS_H); }))) {
            mixin(enumMixinStr__STRINGS_H);
        }
    }




    static if(!is(typeof(_SC_C_LANG_SUPPORT_R))) {
        private enum enumMixinStr__SC_C_LANG_SUPPORT_R = `enum _SC_C_LANG_SUPPORT_R = _SC_C_LANG_SUPPORT_R;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_C_LANG_SUPPORT_R); }))) {
            mixin(enumMixinStr__SC_C_LANG_SUPPORT_R);
        }
    }




    static if(!is(typeof(_SC_C_LANG_SUPPORT))) {
        private enum enumMixinStr__SC_C_LANG_SUPPORT = `enum _SC_C_LANG_SUPPORT = _SC_C_LANG_SUPPORT;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_C_LANG_SUPPORT); }))) {
            mixin(enumMixinStr__SC_C_LANG_SUPPORT);
        }
    }




    static if(!is(typeof(_SC_BASE))) {
        private enum enumMixinStr__SC_BASE = `enum _SC_BASE = _SC_BASE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_BASE); }))) {
            mixin(enumMixinStr__SC_BASE);
        }
    }




    static if(!is(typeof(_SC_BARRIERS))) {
        private enum enumMixinStr__SC_BARRIERS = `enum _SC_BARRIERS = _SC_BARRIERS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_BARRIERS); }))) {
            mixin(enumMixinStr__SC_BARRIERS);
        }
    }




    static if(!is(typeof(_SC_ADVISORY_INFO))) {
        private enum enumMixinStr__SC_ADVISORY_INFO = `enum _SC_ADVISORY_INFO = _SC_ADVISORY_INFO;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_ADVISORY_INFO); }))) {
            mixin(enumMixinStr__SC_ADVISORY_INFO);
        }
    }




    static if(!is(typeof(_SC_XOPEN_REALTIME_THREADS))) {
        private enum enumMixinStr__SC_XOPEN_REALTIME_THREADS = `enum _SC_XOPEN_REALTIME_THREADS = _SC_XOPEN_REALTIME_THREADS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_XOPEN_REALTIME_THREADS); }))) {
            mixin(enumMixinStr__SC_XOPEN_REALTIME_THREADS);
        }
    }




    static if(!is(typeof(_SC_XOPEN_REALTIME))) {
        private enum enumMixinStr__SC_XOPEN_REALTIME = `enum _SC_XOPEN_REALTIME = _SC_XOPEN_REALTIME;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_XOPEN_REALTIME); }))) {
            mixin(enumMixinStr__SC_XOPEN_REALTIME);
        }
    }




    static if(!is(typeof(_SC_XOPEN_LEGACY))) {
        private enum enumMixinStr__SC_XOPEN_LEGACY = `enum _SC_XOPEN_LEGACY = _SC_XOPEN_LEGACY;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_XOPEN_LEGACY); }))) {
            mixin(enumMixinStr__SC_XOPEN_LEGACY);
        }
    }




    static if(!is(typeof(_SC_XBS5_LPBIG_OFFBIG))) {
        private enum enumMixinStr__SC_XBS5_LPBIG_OFFBIG = `enum _SC_XBS5_LPBIG_OFFBIG = _SC_XBS5_LPBIG_OFFBIG;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_XBS5_LPBIG_OFFBIG); }))) {
            mixin(enumMixinStr__SC_XBS5_LPBIG_OFFBIG);
        }
    }




    static if(!is(typeof(_SC_XBS5_LP64_OFF64))) {
        private enum enumMixinStr__SC_XBS5_LP64_OFF64 = `enum _SC_XBS5_LP64_OFF64 = _SC_XBS5_LP64_OFF64;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_XBS5_LP64_OFF64); }))) {
            mixin(enumMixinStr__SC_XBS5_LP64_OFF64);
        }
    }




    static if(!is(typeof(_SC_XBS5_ILP32_OFFBIG))) {
        private enum enumMixinStr__SC_XBS5_ILP32_OFFBIG = `enum _SC_XBS5_ILP32_OFFBIG = _SC_XBS5_ILP32_OFFBIG;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_XBS5_ILP32_OFFBIG); }))) {
            mixin(enumMixinStr__SC_XBS5_ILP32_OFFBIG);
        }
    }




    static if(!is(typeof(_SC_XBS5_ILP32_OFF32))) {
        private enum enumMixinStr__SC_XBS5_ILP32_OFF32 = `enum _SC_XBS5_ILP32_OFF32 = _SC_XBS5_ILP32_OFF32;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_XBS5_ILP32_OFF32); }))) {
            mixin(enumMixinStr__SC_XBS5_ILP32_OFF32);
        }
    }




    static if(!is(typeof(_SC_NL_TEXTMAX))) {
        private enum enumMixinStr__SC_NL_TEXTMAX = `enum _SC_NL_TEXTMAX = _SC_NL_TEXTMAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_NL_TEXTMAX); }))) {
            mixin(enumMixinStr__SC_NL_TEXTMAX);
        }
    }




    static if(!is(typeof(_SC_NL_SETMAX))) {
        private enum enumMixinStr__SC_NL_SETMAX = `enum _SC_NL_SETMAX = _SC_NL_SETMAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_NL_SETMAX); }))) {
            mixin(enumMixinStr__SC_NL_SETMAX);
        }
    }




    static if(!is(typeof(_SC_NL_NMAX))) {
        private enum enumMixinStr__SC_NL_NMAX = `enum _SC_NL_NMAX = _SC_NL_NMAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_NL_NMAX); }))) {
            mixin(enumMixinStr__SC_NL_NMAX);
        }
    }




    static if(!is(typeof(_SC_NL_MSGMAX))) {
        private enum enumMixinStr__SC_NL_MSGMAX = `enum _SC_NL_MSGMAX = _SC_NL_MSGMAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_NL_MSGMAX); }))) {
            mixin(enumMixinStr__SC_NL_MSGMAX);
        }
    }




    static if(!is(typeof(_SC_NL_LANGMAX))) {
        private enum enumMixinStr__SC_NL_LANGMAX = `enum _SC_NL_LANGMAX = _SC_NL_LANGMAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_NL_LANGMAX); }))) {
            mixin(enumMixinStr__SC_NL_LANGMAX);
        }
    }




    static if(!is(typeof(_SC_NL_ARGMAX))) {
        private enum enumMixinStr__SC_NL_ARGMAX = `enum _SC_NL_ARGMAX = _SC_NL_ARGMAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_NL_ARGMAX); }))) {
            mixin(enumMixinStr__SC_NL_ARGMAX);
        }
    }




    static if(!is(typeof(_SC_USHRT_MAX))) {
        private enum enumMixinStr__SC_USHRT_MAX = `enum _SC_USHRT_MAX = _SC_USHRT_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_USHRT_MAX); }))) {
            mixin(enumMixinStr__SC_USHRT_MAX);
        }
    }




    static if(!is(typeof(_SC_ULONG_MAX))) {
        private enum enumMixinStr__SC_ULONG_MAX = `enum _SC_ULONG_MAX = _SC_ULONG_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_ULONG_MAX); }))) {
            mixin(enumMixinStr__SC_ULONG_MAX);
        }
    }




    static if(!is(typeof(_SC_UINT_MAX))) {
        private enum enumMixinStr__SC_UINT_MAX = `enum _SC_UINT_MAX = _SC_UINT_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_UINT_MAX); }))) {
            mixin(enumMixinStr__SC_UINT_MAX);
        }
    }




    static if(!is(typeof(_SC_UCHAR_MAX))) {
        private enum enumMixinStr__SC_UCHAR_MAX = `enum _SC_UCHAR_MAX = _SC_UCHAR_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_UCHAR_MAX); }))) {
            mixin(enumMixinStr__SC_UCHAR_MAX);
        }
    }




    static if(!is(typeof(_SC_SHRT_MIN))) {
        private enum enumMixinStr__SC_SHRT_MIN = `enum _SC_SHRT_MIN = _SC_SHRT_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SHRT_MIN); }))) {
            mixin(enumMixinStr__SC_SHRT_MIN);
        }
    }




    static if(!is(typeof(_SC_SHRT_MAX))) {
        private enum enumMixinStr__SC_SHRT_MAX = `enum _SC_SHRT_MAX = _SC_SHRT_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SHRT_MAX); }))) {
            mixin(enumMixinStr__SC_SHRT_MAX);
        }
    }




    static if(!is(typeof(_SC_SCHAR_MIN))) {
        private enum enumMixinStr__SC_SCHAR_MIN = `enum _SC_SCHAR_MIN = _SC_SCHAR_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SCHAR_MIN); }))) {
            mixin(enumMixinStr__SC_SCHAR_MIN);
        }
    }




    static if(!is(typeof(_SC_SCHAR_MAX))) {
        private enum enumMixinStr__SC_SCHAR_MAX = `enum _SC_SCHAR_MAX = _SC_SCHAR_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SCHAR_MAX); }))) {
            mixin(enumMixinStr__SC_SCHAR_MAX);
        }
    }




    static if(!is(typeof(_SC_SSIZE_MAX))) {
        private enum enumMixinStr__SC_SSIZE_MAX = `enum _SC_SSIZE_MAX = _SC_SSIZE_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SSIZE_MAX); }))) {
            mixin(enumMixinStr__SC_SSIZE_MAX);
        }
    }




    static if(!is(typeof(_SC_NZERO))) {
        private enum enumMixinStr__SC_NZERO = `enum _SC_NZERO = _SC_NZERO;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_NZERO); }))) {
            mixin(enumMixinStr__SC_NZERO);
        }
    }




    static if(!is(typeof(_SC_MB_LEN_MAX))) {
        private enum enumMixinStr__SC_MB_LEN_MAX = `enum _SC_MB_LEN_MAX = _SC_MB_LEN_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_MB_LEN_MAX); }))) {
            mixin(enumMixinStr__SC_MB_LEN_MAX);
        }
    }




    static if(!is(typeof(_SC_WORD_BIT))) {
        private enum enumMixinStr__SC_WORD_BIT = `enum _SC_WORD_BIT = _SC_WORD_BIT;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_WORD_BIT); }))) {
            mixin(enumMixinStr__SC_WORD_BIT);
        }
    }




    static if(!is(typeof(_SC_LONG_BIT))) {
        private enum enumMixinStr__SC_LONG_BIT = `enum _SC_LONG_BIT = _SC_LONG_BIT;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_LONG_BIT); }))) {
            mixin(enumMixinStr__SC_LONG_BIT);
        }
    }




    static if(!is(typeof(_SC_INT_MIN))) {
        private enum enumMixinStr__SC_INT_MIN = `enum _SC_INT_MIN = _SC_INT_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_INT_MIN); }))) {
            mixin(enumMixinStr__SC_INT_MIN);
        }
    }




    static if(!is(typeof(_SC_INT_MAX))) {
        private enum enumMixinStr__SC_INT_MAX = `enum _SC_INT_MAX = _SC_INT_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_INT_MAX); }))) {
            mixin(enumMixinStr__SC_INT_MAX);
        }
    }




    static if(!is(typeof(_SC_CHAR_MIN))) {
        private enum enumMixinStr__SC_CHAR_MIN = `enum _SC_CHAR_MIN = _SC_CHAR_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_CHAR_MIN); }))) {
            mixin(enumMixinStr__SC_CHAR_MIN);
        }
    }




    static if(!is(typeof(_SC_CHAR_MAX))) {
        private enum enumMixinStr__SC_CHAR_MAX = `enum _SC_CHAR_MAX = _SC_CHAR_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_CHAR_MAX); }))) {
            mixin(enumMixinStr__SC_CHAR_MAX);
        }
    }




    static if(!is(typeof(_SC_CHAR_BIT))) {
        private enum enumMixinStr__SC_CHAR_BIT = `enum _SC_CHAR_BIT = _SC_CHAR_BIT;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_CHAR_BIT); }))) {
            mixin(enumMixinStr__SC_CHAR_BIT);
        }
    }




    static if(!is(typeof(_SC_XOPEN_XPG4))) {
        private enum enumMixinStr__SC_XOPEN_XPG4 = `enum _SC_XOPEN_XPG4 = _SC_XOPEN_XPG4;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_XOPEN_XPG4); }))) {
            mixin(enumMixinStr__SC_XOPEN_XPG4);
        }
    }




    static if(!is(typeof(_SC_XOPEN_XPG3))) {
        private enum enumMixinStr__SC_XOPEN_XPG3 = `enum _SC_XOPEN_XPG3 = _SC_XOPEN_XPG3;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_XOPEN_XPG3); }))) {
            mixin(enumMixinStr__SC_XOPEN_XPG3);
        }
    }




    static if(!is(typeof(_SC_XOPEN_XPG2))) {
        private enum enumMixinStr__SC_XOPEN_XPG2 = `enum _SC_XOPEN_XPG2 = _SC_XOPEN_XPG2;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_XOPEN_XPG2); }))) {
            mixin(enumMixinStr__SC_XOPEN_XPG2);
        }
    }




    static if(!is(typeof(_SC_2_UPE))) {
        private enum enumMixinStr__SC_2_UPE = `enum _SC_2_UPE = _SC_2_UPE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_2_UPE); }))) {
            mixin(enumMixinStr__SC_2_UPE);
        }
    }




    static if(!is(typeof(_SC_2_C_VERSION))) {
        private enum enumMixinStr__SC_2_C_VERSION = `enum _SC_2_C_VERSION = _SC_2_C_VERSION;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_2_C_VERSION); }))) {
            mixin(enumMixinStr__SC_2_C_VERSION);
        }
    }




    static if(!is(typeof(_SC_2_CHAR_TERM))) {
        private enum enumMixinStr__SC_2_CHAR_TERM = `enum _SC_2_CHAR_TERM = _SC_2_CHAR_TERM;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_2_CHAR_TERM); }))) {
            mixin(enumMixinStr__SC_2_CHAR_TERM);
        }
    }




    static if(!is(typeof(_SC_XOPEN_SHM))) {
        private enum enumMixinStr__SC_XOPEN_SHM = `enum _SC_XOPEN_SHM = _SC_XOPEN_SHM;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_XOPEN_SHM); }))) {
            mixin(enumMixinStr__SC_XOPEN_SHM);
        }
    }




    static if(!is(typeof(_SC_XOPEN_ENH_I18N))) {
        private enum enumMixinStr__SC_XOPEN_ENH_I18N = `enum _SC_XOPEN_ENH_I18N = _SC_XOPEN_ENH_I18N;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_XOPEN_ENH_I18N); }))) {
            mixin(enumMixinStr__SC_XOPEN_ENH_I18N);
        }
    }




    static if(!is(typeof(_SC_XOPEN_CRYPT))) {
        private enum enumMixinStr__SC_XOPEN_CRYPT = `enum _SC_XOPEN_CRYPT = _SC_XOPEN_CRYPT;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_XOPEN_CRYPT); }))) {
            mixin(enumMixinStr__SC_XOPEN_CRYPT);
        }
    }




    static if(!is(typeof(_SC_XOPEN_UNIX))) {
        private enum enumMixinStr__SC_XOPEN_UNIX = `enum _SC_XOPEN_UNIX = _SC_XOPEN_UNIX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_XOPEN_UNIX); }))) {
            mixin(enumMixinStr__SC_XOPEN_UNIX);
        }
    }




    static if(!is(typeof(_SC_XOPEN_XCU_VERSION))) {
        private enum enumMixinStr__SC_XOPEN_XCU_VERSION = `enum _SC_XOPEN_XCU_VERSION = _SC_XOPEN_XCU_VERSION;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_XOPEN_XCU_VERSION); }))) {
            mixin(enumMixinStr__SC_XOPEN_XCU_VERSION);
        }
    }




    static if(!is(typeof(_SC_XOPEN_VERSION))) {
        private enum enumMixinStr__SC_XOPEN_VERSION = `enum _SC_XOPEN_VERSION = _SC_XOPEN_VERSION;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_XOPEN_VERSION); }))) {
            mixin(enumMixinStr__SC_XOPEN_VERSION);
        }
    }




    static if(!is(typeof(_SC_PASS_MAX))) {
        private enum enumMixinStr__SC_PASS_MAX = `enum _SC_PASS_MAX = _SC_PASS_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_PASS_MAX); }))) {
            mixin(enumMixinStr__SC_PASS_MAX);
        }
    }




    static if(!is(typeof(_SC_ATEXIT_MAX))) {
        private enum enumMixinStr__SC_ATEXIT_MAX = `enum _SC_ATEXIT_MAX = _SC_ATEXIT_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_ATEXIT_MAX); }))) {
            mixin(enumMixinStr__SC_ATEXIT_MAX);
        }
    }




    static if(!is(typeof(_SC_AVPHYS_PAGES))) {
        private enum enumMixinStr__SC_AVPHYS_PAGES = `enum _SC_AVPHYS_PAGES = _SC_AVPHYS_PAGES;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_AVPHYS_PAGES); }))) {
            mixin(enumMixinStr__SC_AVPHYS_PAGES);
        }
    }




    static if(!is(typeof(_SC_PHYS_PAGES))) {
        private enum enumMixinStr__SC_PHYS_PAGES = `enum _SC_PHYS_PAGES = _SC_PHYS_PAGES;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_PHYS_PAGES); }))) {
            mixin(enumMixinStr__SC_PHYS_PAGES);
        }
    }




    static if(!is(typeof(_SC_NPROCESSORS_ONLN))) {
        private enum enumMixinStr__SC_NPROCESSORS_ONLN = `enum _SC_NPROCESSORS_ONLN = _SC_NPROCESSORS_ONLN;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_NPROCESSORS_ONLN); }))) {
            mixin(enumMixinStr__SC_NPROCESSORS_ONLN);
        }
    }




    static if(!is(typeof(_SC_NPROCESSORS_CONF))) {
        private enum enumMixinStr__SC_NPROCESSORS_CONF = `enum _SC_NPROCESSORS_CONF = _SC_NPROCESSORS_CONF;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_NPROCESSORS_CONF); }))) {
            mixin(enumMixinStr__SC_NPROCESSORS_CONF);
        }
    }




    static if(!is(typeof(_SC_THREAD_PROCESS_SHARED))) {
        private enum enumMixinStr__SC_THREAD_PROCESS_SHARED = `enum _SC_THREAD_PROCESS_SHARED = _SC_THREAD_PROCESS_SHARED;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_THREAD_PROCESS_SHARED); }))) {
            mixin(enumMixinStr__SC_THREAD_PROCESS_SHARED);
        }
    }




    static if(!is(typeof(_SC_THREAD_PRIO_PROTECT))) {
        private enum enumMixinStr__SC_THREAD_PRIO_PROTECT = `enum _SC_THREAD_PRIO_PROTECT = _SC_THREAD_PRIO_PROTECT;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_THREAD_PRIO_PROTECT); }))) {
            mixin(enumMixinStr__SC_THREAD_PRIO_PROTECT);
        }
    }




    static if(!is(typeof(_SC_THREAD_PRIO_INHERIT))) {
        private enum enumMixinStr__SC_THREAD_PRIO_INHERIT = `enum _SC_THREAD_PRIO_INHERIT = _SC_THREAD_PRIO_INHERIT;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_THREAD_PRIO_INHERIT); }))) {
            mixin(enumMixinStr__SC_THREAD_PRIO_INHERIT);
        }
    }




    static if(!is(typeof(_SC_THREAD_PRIORITY_SCHEDULING))) {
        private enum enumMixinStr__SC_THREAD_PRIORITY_SCHEDULING = `enum _SC_THREAD_PRIORITY_SCHEDULING = _SC_THREAD_PRIORITY_SCHEDULING;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_THREAD_PRIORITY_SCHEDULING); }))) {
            mixin(enumMixinStr__SC_THREAD_PRIORITY_SCHEDULING);
        }
    }




    static if(!is(typeof(_SYS_CDEFS_H))) {
        private enum enumMixinStr__SYS_CDEFS_H = `enum _SYS_CDEFS_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__SYS_CDEFS_H); }))) {
            mixin(enumMixinStr__SYS_CDEFS_H);
        }
    }




    static if(!is(typeof(_SC_THREAD_ATTR_STACKSIZE))) {
        private enum enumMixinStr__SC_THREAD_ATTR_STACKSIZE = `enum _SC_THREAD_ATTR_STACKSIZE = _SC_THREAD_ATTR_STACKSIZE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_THREAD_ATTR_STACKSIZE); }))) {
            mixin(enumMixinStr__SC_THREAD_ATTR_STACKSIZE);
        }
    }




    static if(!is(typeof(_SC_THREAD_ATTR_STACKADDR))) {
        private enum enumMixinStr__SC_THREAD_ATTR_STACKADDR = `enum _SC_THREAD_ATTR_STACKADDR = _SC_THREAD_ATTR_STACKADDR;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_THREAD_ATTR_STACKADDR); }))) {
            mixin(enumMixinStr__SC_THREAD_ATTR_STACKADDR);
        }
    }




    static if(!is(typeof(_SC_THREAD_THREADS_MAX))) {
        private enum enumMixinStr__SC_THREAD_THREADS_MAX = `enum _SC_THREAD_THREADS_MAX = _SC_THREAD_THREADS_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_THREAD_THREADS_MAX); }))) {
            mixin(enumMixinStr__SC_THREAD_THREADS_MAX);
        }
    }




    static if(!is(typeof(_SC_THREAD_STACK_MIN))) {
        private enum enumMixinStr__SC_THREAD_STACK_MIN = `enum _SC_THREAD_STACK_MIN = _SC_THREAD_STACK_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_THREAD_STACK_MIN); }))) {
            mixin(enumMixinStr__SC_THREAD_STACK_MIN);
        }
    }




    static if(!is(typeof(_SC_THREAD_KEYS_MAX))) {
        private enum enumMixinStr__SC_THREAD_KEYS_MAX = `enum _SC_THREAD_KEYS_MAX = _SC_THREAD_KEYS_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_THREAD_KEYS_MAX); }))) {
            mixin(enumMixinStr__SC_THREAD_KEYS_MAX);
        }
    }
    static if(!is(typeof(_SC_THREAD_DESTRUCTOR_ITERATIONS))) {
        private enum enumMixinStr__SC_THREAD_DESTRUCTOR_ITERATIONS = `enum _SC_THREAD_DESTRUCTOR_ITERATIONS = _SC_THREAD_DESTRUCTOR_ITERATIONS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_THREAD_DESTRUCTOR_ITERATIONS); }))) {
            mixin(enumMixinStr__SC_THREAD_DESTRUCTOR_ITERATIONS);
        }
    }




    static if(!is(typeof(__THROW))) {
        private enum enumMixinStr___THROW = `enum __THROW = __attribute__ ( ( __nothrow__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___THROW); }))) {
            mixin(enumMixinStr___THROW);
        }
    }




    static if(!is(typeof(__THROWNL))) {
        private enum enumMixinStr___THROWNL = `enum __THROWNL = __attribute__ ( ( __nothrow__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___THROWNL); }))) {
            mixin(enumMixinStr___THROWNL);
        }
    }
    static if(!is(typeof(_SC_TTY_NAME_MAX))) {
        private enum enumMixinStr__SC_TTY_NAME_MAX = `enum _SC_TTY_NAME_MAX = _SC_TTY_NAME_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_TTY_NAME_MAX); }))) {
            mixin(enumMixinStr__SC_TTY_NAME_MAX);
        }
    }




    static if(!is(typeof(_SC_LOGIN_NAME_MAX))) {
        private enum enumMixinStr__SC_LOGIN_NAME_MAX = `enum _SC_LOGIN_NAME_MAX = _SC_LOGIN_NAME_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_LOGIN_NAME_MAX); }))) {
            mixin(enumMixinStr__SC_LOGIN_NAME_MAX);
        }
    }
    static if(!is(typeof(__ptr_t))) {
        private enum enumMixinStr___ptr_t = `enum __ptr_t = void *;`;
        static if(is(typeof({ mixin(enumMixinStr___ptr_t); }))) {
            mixin(enumMixinStr___ptr_t);
        }
    }
    static if(!is(typeof(_SC_GETPW_R_SIZE_MAX))) {
        private enum enumMixinStr__SC_GETPW_R_SIZE_MAX = `enum _SC_GETPW_R_SIZE_MAX = _SC_GETPW_R_SIZE_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_GETPW_R_SIZE_MAX); }))) {
            mixin(enumMixinStr__SC_GETPW_R_SIZE_MAX);
        }
    }
    static if(!is(typeof(_SC_GETGR_R_SIZE_MAX))) {
        private enum enumMixinStr__SC_GETGR_R_SIZE_MAX = `enum _SC_GETGR_R_SIZE_MAX = _SC_GETGR_R_SIZE_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_GETGR_R_SIZE_MAX); }))) {
            mixin(enumMixinStr__SC_GETGR_R_SIZE_MAX);
        }
    }




    static if(!is(typeof(_SC_THREAD_SAFE_FUNCTIONS))) {
        private enum enumMixinStr__SC_THREAD_SAFE_FUNCTIONS = `enum _SC_THREAD_SAFE_FUNCTIONS = _SC_THREAD_SAFE_FUNCTIONS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_THREAD_SAFE_FUNCTIONS); }))) {
            mixin(enumMixinStr__SC_THREAD_SAFE_FUNCTIONS);
        }
    }




    static if(!is(typeof(__flexarr))) {
        private enum enumMixinStr___flexarr = `enum __flexarr = [ ];`;
        static if(is(typeof({ mixin(enumMixinStr___flexarr); }))) {
            mixin(enumMixinStr___flexarr);
        }
    }




    static if(!is(typeof(__glibc_c99_flexarr_available))) {
        private enum enumMixinStr___glibc_c99_flexarr_available = `enum __glibc_c99_flexarr_available = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___glibc_c99_flexarr_available); }))) {
            mixin(enumMixinStr___glibc_c99_flexarr_available);
        }
    }




    static if(!is(typeof(_SC_THREADS))) {
        private enum enumMixinStr__SC_THREADS = `enum _SC_THREADS = _SC_THREADS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_THREADS); }))) {
            mixin(enumMixinStr__SC_THREADS);
        }
    }




    static if(!is(typeof(_SC_T_IOV_MAX))) {
        private enum enumMixinStr__SC_T_IOV_MAX = `enum _SC_T_IOV_MAX = _SC_T_IOV_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_T_IOV_MAX); }))) {
            mixin(enumMixinStr__SC_T_IOV_MAX);
        }
    }
    static if(!is(typeof(_SC_PII_OSI_M))) {
        private enum enumMixinStr__SC_PII_OSI_M = `enum _SC_PII_OSI_M = _SC_PII_OSI_M;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_PII_OSI_M); }))) {
            mixin(enumMixinStr__SC_PII_OSI_M);
        }
    }




    static if(!is(typeof(_SC_PII_OSI_CLTS))) {
        private enum enumMixinStr__SC_PII_OSI_CLTS = `enum _SC_PII_OSI_CLTS = _SC_PII_OSI_CLTS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_PII_OSI_CLTS); }))) {
            mixin(enumMixinStr__SC_PII_OSI_CLTS);
        }
    }




    static if(!is(typeof(_SC_PII_OSI_COTS))) {
        private enum enumMixinStr__SC_PII_OSI_COTS = `enum _SC_PII_OSI_COTS = _SC_PII_OSI_COTS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_PII_OSI_COTS); }))) {
            mixin(enumMixinStr__SC_PII_OSI_COTS);
        }
    }




    static if(!is(typeof(__attribute_malloc__))) {
        private enum enumMixinStr___attribute_malloc__ = `enum __attribute_malloc__ = __attribute__ ( ( __malloc__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_malloc__); }))) {
            mixin(enumMixinStr___attribute_malloc__);
        }
    }




    static if(!is(typeof(_SC_PII_INTERNET_DGRAM))) {
        private enum enumMixinStr__SC_PII_INTERNET_DGRAM = `enum _SC_PII_INTERNET_DGRAM = _SC_PII_INTERNET_DGRAM;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_PII_INTERNET_DGRAM); }))) {
            mixin(enumMixinStr__SC_PII_INTERNET_DGRAM);
        }
    }






    static if(!is(typeof(_SC_PII_INTERNET_STREAM))) {
        private enum enumMixinStr__SC_PII_INTERNET_STREAM = `enum _SC_PII_INTERNET_STREAM = _SC_PII_INTERNET_STREAM;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_PII_INTERNET_STREAM); }))) {
            mixin(enumMixinStr__SC_PII_INTERNET_STREAM);
        }
    }




    static if(!is(typeof(__attribute_pure__))) {
        private enum enumMixinStr___attribute_pure__ = `enum __attribute_pure__ = __attribute__ ( ( __pure__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_pure__); }))) {
            mixin(enumMixinStr___attribute_pure__);
        }
    }




    static if(!is(typeof(_SC_IOV_MAX))) {
        private enum enumMixinStr__SC_IOV_MAX = `enum _SC_IOV_MAX = _SC_IOV_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_IOV_MAX); }))) {
            mixin(enumMixinStr__SC_IOV_MAX);
        }
    }




    static if(!is(typeof(__attribute_const__))) {
        private enum enumMixinStr___attribute_const__ = `enum __attribute_const__ = __attribute__ ( cast( __const__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_const__); }))) {
            mixin(enumMixinStr___attribute_const__);
        }
    }




    static if(!is(typeof(_SC_UIO_MAXIOV))) {
        private enum enumMixinStr__SC_UIO_MAXIOV = `enum _SC_UIO_MAXIOV = _SC_UIO_MAXIOV;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_UIO_MAXIOV); }))) {
            mixin(enumMixinStr__SC_UIO_MAXIOV);
        }
    }




    static if(!is(typeof(__attribute_used__))) {
        private enum enumMixinStr___attribute_used__ = `enum __attribute_used__ = __attribute__ ( ( __used__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_used__); }))) {
            mixin(enumMixinStr___attribute_used__);
        }
    }




    static if(!is(typeof(__attribute_noinline__))) {
        private enum enumMixinStr___attribute_noinline__ = `enum __attribute_noinline__ = __attribute__ ( ( __noinline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_noinline__); }))) {
            mixin(enumMixinStr___attribute_noinline__);
        }
    }




    static if(!is(typeof(_SC_SELECT))) {
        private enum enumMixinStr__SC_SELECT = `enum _SC_SELECT = _SC_SELECT;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SELECT); }))) {
            mixin(enumMixinStr__SC_SELECT);
        }
    }




    static if(!is(typeof(__attribute_deprecated__))) {
        private enum enumMixinStr___attribute_deprecated__ = `enum __attribute_deprecated__ = __attribute__ ( ( __deprecated__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_deprecated__); }))) {
            mixin(enumMixinStr___attribute_deprecated__);
        }
    }




    static if(!is(typeof(_SC_POLL))) {
        private enum enumMixinStr__SC_POLL = `enum _SC_POLL = _SC_POLL;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_POLL); }))) {
            mixin(enumMixinStr__SC_POLL);
        }
    }




    static if(!is(typeof(_SC_PII_OSI))) {
        private enum enumMixinStr__SC_PII_OSI = `enum _SC_PII_OSI = _SC_PII_OSI;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_PII_OSI); }))) {
            mixin(enumMixinStr__SC_PII_OSI);
        }
    }






    static if(!is(typeof(_SC_PII_INTERNET))) {
        private enum enumMixinStr__SC_PII_INTERNET = `enum _SC_PII_INTERNET = _SC_PII_INTERNET;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_PII_INTERNET); }))) {
            mixin(enumMixinStr__SC_PII_INTERNET);
        }
    }






    static if(!is(typeof(_SC_PII_SOCKET))) {
        private enum enumMixinStr__SC_PII_SOCKET = `enum _SC_PII_SOCKET = _SC_PII_SOCKET;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_PII_SOCKET); }))) {
            mixin(enumMixinStr__SC_PII_SOCKET);
        }
    }






    static if(!is(typeof(_SC_PII_XTI))) {
        private enum enumMixinStr__SC_PII_XTI = `enum _SC_PII_XTI = _SC_PII_XTI;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_PII_XTI); }))) {
            mixin(enumMixinStr__SC_PII_XTI);
        }
    }






    static if(!is(typeof(_SC_PII))) {
        private enum enumMixinStr__SC_PII = `enum _SC_PII = _SC_PII;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_PII); }))) {
            mixin(enumMixinStr__SC_PII);
        }
    }




    static if(!is(typeof(__attribute_warn_unused_result__))) {
        private enum enumMixinStr___attribute_warn_unused_result__ = `enum __attribute_warn_unused_result__ = __attribute__ ( ( __warn_unused_result__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_warn_unused_result__); }))) {
            mixin(enumMixinStr___attribute_warn_unused_result__);
        }
    }




    static if(!is(typeof(_SC_2_LOCALEDEF))) {
        private enum enumMixinStr__SC_2_LOCALEDEF = `enum _SC_2_LOCALEDEF = _SC_2_LOCALEDEF;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_2_LOCALEDEF); }))) {
            mixin(enumMixinStr__SC_2_LOCALEDEF);
        }
    }






    static if(!is(typeof(_SC_2_SW_DEV))) {
        private enum enumMixinStr__SC_2_SW_DEV = `enum _SC_2_SW_DEV = _SC_2_SW_DEV;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_2_SW_DEV); }))) {
            mixin(enumMixinStr__SC_2_SW_DEV);
        }
    }




    static if(!is(typeof(__always_inline))) {
        private enum enumMixinStr___always_inline = `enum __always_inline = __inline __attribute__ ( ( __always_inline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___always_inline); }))) {
            mixin(enumMixinStr___always_inline);
        }
    }




    static if(!is(typeof(_SC_2_FORT_RUN))) {
        private enum enumMixinStr__SC_2_FORT_RUN = `enum _SC_2_FORT_RUN = _SC_2_FORT_RUN;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_2_FORT_RUN); }))) {
            mixin(enumMixinStr__SC_2_FORT_RUN);
        }
    }






    static if(!is(typeof(_SC_2_FORT_DEV))) {
        private enum enumMixinStr__SC_2_FORT_DEV = `enum _SC_2_FORT_DEV = _SC_2_FORT_DEV;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_2_FORT_DEV); }))) {
            mixin(enumMixinStr__SC_2_FORT_DEV);
        }
    }




    static if(!is(typeof(_SC_2_C_DEV))) {
        private enum enumMixinStr__SC_2_C_DEV = `enum _SC_2_C_DEV = _SC_2_C_DEV;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_2_C_DEV); }))) {
            mixin(enumMixinStr__SC_2_C_DEV);
        }
    }




    static if(!is(typeof(_SC_2_C_BIND))) {
        private enum enumMixinStr__SC_2_C_BIND = `enum _SC_2_C_BIND = _SC_2_C_BIND;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_2_C_BIND); }))) {
            mixin(enumMixinStr__SC_2_C_BIND);
        }
    }




    static if(!is(typeof(_SC_2_VERSION))) {
        private enum enumMixinStr__SC_2_VERSION = `enum _SC_2_VERSION = _SC_2_VERSION;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_2_VERSION); }))) {
            mixin(enumMixinStr__SC_2_VERSION);
        }
    }




    static if(!is(typeof(__extern_inline))) {
        private enum enumMixinStr___extern_inline = `enum __extern_inline = extern __inline __attribute__ ( ( __gnu_inline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___extern_inline); }))) {
            mixin(enumMixinStr___extern_inline);
        }
    }




    static if(!is(typeof(__extern_always_inline))) {
        private enum enumMixinStr___extern_always_inline = `enum __extern_always_inline = extern __inline __attribute__ ( ( __always_inline__ ) ) __attribute__ ( ( __gnu_inline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___extern_always_inline); }))) {
            mixin(enumMixinStr___extern_always_inline);
        }
    }




    static if(!is(typeof(_SC_CHARCLASS_NAME_MAX))) {
        private enum enumMixinStr__SC_CHARCLASS_NAME_MAX = `enum _SC_CHARCLASS_NAME_MAX = _SC_CHARCLASS_NAME_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_CHARCLASS_NAME_MAX); }))) {
            mixin(enumMixinStr__SC_CHARCLASS_NAME_MAX);
        }
    }




    static if(!is(typeof(__fortify_function))) {
        private enum enumMixinStr___fortify_function = `enum __fortify_function = extern __inline __attribute__ ( ( __always_inline__ ) ) __attribute__ ( ( __gnu_inline__ ) ) ;`;
        static if(is(typeof({ mixin(enumMixinStr___fortify_function); }))) {
            mixin(enumMixinStr___fortify_function);
        }
    }




    static if(!is(typeof(_SC_RE_DUP_MAX))) {
        private enum enumMixinStr__SC_RE_DUP_MAX = `enum _SC_RE_DUP_MAX = _SC_RE_DUP_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_RE_DUP_MAX); }))) {
            mixin(enumMixinStr__SC_RE_DUP_MAX);
        }
    }




    static if(!is(typeof(_SC_LINE_MAX))) {
        private enum enumMixinStr__SC_LINE_MAX = `enum _SC_LINE_MAX = _SC_LINE_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_LINE_MAX); }))) {
            mixin(enumMixinStr__SC_LINE_MAX);
        }
    }




    static if(!is(typeof(_SC_EXPR_NEST_MAX))) {
        private enum enumMixinStr__SC_EXPR_NEST_MAX = `enum _SC_EXPR_NEST_MAX = _SC_EXPR_NEST_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_EXPR_NEST_MAX); }))) {
            mixin(enumMixinStr__SC_EXPR_NEST_MAX);
        }
    }




    static if(!is(typeof(_SC_EQUIV_CLASS_MAX))) {
        private enum enumMixinStr__SC_EQUIV_CLASS_MAX = `enum _SC_EQUIV_CLASS_MAX = _SC_EQUIV_CLASS_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_EQUIV_CLASS_MAX); }))) {
            mixin(enumMixinStr__SC_EQUIV_CLASS_MAX);
        }
    }




    static if(!is(typeof(__restrict_arr))) {
        private enum enumMixinStr___restrict_arr = `enum __restrict_arr = __restrict;`;
        static if(is(typeof({ mixin(enumMixinStr___restrict_arr); }))) {
            mixin(enumMixinStr___restrict_arr);
        }
    }




    static if(!is(typeof(_SC_COLL_WEIGHTS_MAX))) {
        private enum enumMixinStr__SC_COLL_WEIGHTS_MAX = `enum _SC_COLL_WEIGHTS_MAX = _SC_COLL_WEIGHTS_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_COLL_WEIGHTS_MAX); }))) {
            mixin(enumMixinStr__SC_COLL_WEIGHTS_MAX);
        }
    }
    static if(!is(typeof(_SC_BC_STRING_MAX))) {
        private enum enumMixinStr__SC_BC_STRING_MAX = `enum _SC_BC_STRING_MAX = _SC_BC_STRING_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_BC_STRING_MAX); }))) {
            mixin(enumMixinStr__SC_BC_STRING_MAX);
        }
    }






    static if(!is(typeof(_SC_BC_SCALE_MAX))) {
        private enum enumMixinStr__SC_BC_SCALE_MAX = `enum _SC_BC_SCALE_MAX = _SC_BC_SCALE_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_BC_SCALE_MAX); }))) {
            mixin(enumMixinStr__SC_BC_SCALE_MAX);
        }
    }




    static if(!is(typeof(__glibc_has_include))) {
        private enum enumMixinStr___glibc_has_include = `enum __glibc_has_include = __has_include;`;
        static if(is(typeof({ mixin(enumMixinStr___glibc_has_include); }))) {
            mixin(enumMixinStr___glibc_has_include);
        }
    }




    static if(!is(typeof(_SC_BC_DIM_MAX))) {
        private enum enumMixinStr__SC_BC_DIM_MAX = `enum _SC_BC_DIM_MAX = _SC_BC_DIM_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_BC_DIM_MAX); }))) {
            mixin(enumMixinStr__SC_BC_DIM_MAX);
        }
    }




    static if(!is(typeof(_SC_BC_BASE_MAX))) {
        private enum enumMixinStr__SC_BC_BASE_MAX = `enum _SC_BC_BASE_MAX = _SC_BC_BASE_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_BC_BASE_MAX); }))) {
            mixin(enumMixinStr__SC_BC_BASE_MAX);
        }
    }




    static if(!is(typeof(_SC_TIMER_MAX))) {
        private enum enumMixinStr__SC_TIMER_MAX = `enum _SC_TIMER_MAX = _SC_TIMER_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_TIMER_MAX); }))) {
            mixin(enumMixinStr__SC_TIMER_MAX);
        }
    }




    static if(!is(typeof(_SC_SIGQUEUE_MAX))) {
        private enum enumMixinStr__SC_SIGQUEUE_MAX = `enum _SC_SIGQUEUE_MAX = _SC_SIGQUEUE_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SIGQUEUE_MAX); }))) {
            mixin(enumMixinStr__SC_SIGQUEUE_MAX);
        }
    }






    static if(!is(typeof(_SC_SEM_VALUE_MAX))) {
        private enum enumMixinStr__SC_SEM_VALUE_MAX = `enum _SC_SEM_VALUE_MAX = _SC_SEM_VALUE_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SEM_VALUE_MAX); }))) {
            mixin(enumMixinStr__SC_SEM_VALUE_MAX);
        }
    }






    static if(!is(typeof(_SC_SEM_NSEMS_MAX))) {
        private enum enumMixinStr__SC_SEM_NSEMS_MAX = `enum _SC_SEM_NSEMS_MAX = _SC_SEM_NSEMS_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SEM_NSEMS_MAX); }))) {
            mixin(enumMixinStr__SC_SEM_NSEMS_MAX);
        }
    }




    static if(!is(typeof(_SC_RTSIG_MAX))) {
        private enum enumMixinStr__SC_RTSIG_MAX = `enum _SC_RTSIG_MAX = _SC_RTSIG_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_RTSIG_MAX); }))) {
            mixin(enumMixinStr__SC_RTSIG_MAX);
        }
    }




    static if(!is(typeof(_SC_PAGE_SIZE))) {
        private enum enumMixinStr__SC_PAGE_SIZE = `enum _SC_PAGE_SIZE = _SC_PAGESIZE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_PAGE_SIZE); }))) {
            mixin(enumMixinStr__SC_PAGE_SIZE);
        }
    }




    static if(!is(typeof(_SC_PAGESIZE))) {
        private enum enumMixinStr__SC_PAGESIZE = `enum _SC_PAGESIZE = _SC_PAGESIZE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_PAGESIZE); }))) {
            mixin(enumMixinStr__SC_PAGESIZE);
        }
    }




    static if(!is(typeof(_SC_VERSION))) {
        private enum enumMixinStr__SC_VERSION = `enum _SC_VERSION = _SC_VERSION;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_VERSION); }))) {
            mixin(enumMixinStr__SC_VERSION);
        }
    }




    static if(!is(typeof(_SC_MQ_PRIO_MAX))) {
        private enum enumMixinStr__SC_MQ_PRIO_MAX = `enum _SC_MQ_PRIO_MAX = _SC_MQ_PRIO_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_MQ_PRIO_MAX); }))) {
            mixin(enumMixinStr__SC_MQ_PRIO_MAX);
        }
    }
    static if(!is(typeof(_SC_MQ_OPEN_MAX))) {
        private enum enumMixinStr__SC_MQ_OPEN_MAX = `enum _SC_MQ_OPEN_MAX = _SC_MQ_OPEN_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_MQ_OPEN_MAX); }))) {
            mixin(enumMixinStr__SC_MQ_OPEN_MAX);
        }
    }
    static if(!is(typeof(_SC_DELAYTIMER_MAX))) {
        private enum enumMixinStr__SC_DELAYTIMER_MAX = `enum _SC_DELAYTIMER_MAX = _SC_DELAYTIMER_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_DELAYTIMER_MAX); }))) {
            mixin(enumMixinStr__SC_DELAYTIMER_MAX);
        }
    }




    static if(!is(typeof(_SC_AIO_PRIO_DELTA_MAX))) {
        private enum enumMixinStr__SC_AIO_PRIO_DELTA_MAX = `enum _SC_AIO_PRIO_DELTA_MAX = _SC_AIO_PRIO_DELTA_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_AIO_PRIO_DELTA_MAX); }))) {
            mixin(enumMixinStr__SC_AIO_PRIO_DELTA_MAX);
        }
    }
    static if(!is(typeof(_SC_AIO_MAX))) {
        private enum enumMixinStr__SC_AIO_MAX = `enum _SC_AIO_MAX = _SC_AIO_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_AIO_MAX); }))) {
            mixin(enumMixinStr__SC_AIO_MAX);
        }
    }




    static if(!is(typeof(_SC_AIO_LISTIO_MAX))) {
        private enum enumMixinStr__SC_AIO_LISTIO_MAX = `enum _SC_AIO_LISTIO_MAX = _SC_AIO_LISTIO_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_AIO_LISTIO_MAX); }))) {
            mixin(enumMixinStr__SC_AIO_LISTIO_MAX);
        }
    }




    static if(!is(typeof(_SC_SHARED_MEMORY_OBJECTS))) {
        private enum enumMixinStr__SC_SHARED_MEMORY_OBJECTS = `enum _SC_SHARED_MEMORY_OBJECTS = _SC_SHARED_MEMORY_OBJECTS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SHARED_MEMORY_OBJECTS); }))) {
            mixin(enumMixinStr__SC_SHARED_MEMORY_OBJECTS);
        }
    }




    static if(!is(typeof(_SC_SEMAPHORES))) {
        private enum enumMixinStr__SC_SEMAPHORES = `enum _SC_SEMAPHORES = _SC_SEMAPHORES;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SEMAPHORES); }))) {
            mixin(enumMixinStr__SC_SEMAPHORES);
        }
    }




    static if(!is(typeof(_SC_MESSAGE_PASSING))) {
        private enum enumMixinStr__SC_MESSAGE_PASSING = `enum _SC_MESSAGE_PASSING = _SC_MESSAGE_PASSING;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_MESSAGE_PASSING); }))) {
            mixin(enumMixinStr__SC_MESSAGE_PASSING);
        }
    }




    static if(!is(typeof(__HAVE_GENERIC_SELECTION))) {
        private enum enumMixinStr___HAVE_GENERIC_SELECTION = `enum __HAVE_GENERIC_SELECTION = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___HAVE_GENERIC_SELECTION); }))) {
            mixin(enumMixinStr___HAVE_GENERIC_SELECTION);
        }
    }




    static if(!is(typeof(_SYS_SELECT_H))) {
        private enum enumMixinStr__SYS_SELECT_H = `enum _SYS_SELECT_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__SYS_SELECT_H); }))) {
            mixin(enumMixinStr__SYS_SELECT_H);
        }
    }




    static if(!is(typeof(_SC_MEMORY_PROTECTION))) {
        private enum enumMixinStr__SC_MEMORY_PROTECTION = `enum _SC_MEMORY_PROTECTION = _SC_MEMORY_PROTECTION;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_MEMORY_PROTECTION); }))) {
            mixin(enumMixinStr__SC_MEMORY_PROTECTION);
        }
    }




    static if(!is(typeof(_SC_MEMLOCK_RANGE))) {
        private enum enumMixinStr__SC_MEMLOCK_RANGE = `enum _SC_MEMLOCK_RANGE = _SC_MEMLOCK_RANGE;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_MEMLOCK_RANGE); }))) {
            mixin(enumMixinStr__SC_MEMLOCK_RANGE);
        }
    }




    static if(!is(typeof(_SC_MEMLOCK))) {
        private enum enumMixinStr__SC_MEMLOCK = `enum _SC_MEMLOCK = _SC_MEMLOCK;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_MEMLOCK); }))) {
            mixin(enumMixinStr__SC_MEMLOCK);
        }
    }




    static if(!is(typeof(_SC_MAPPED_FILES))) {
        private enum enumMixinStr__SC_MAPPED_FILES = `enum _SC_MAPPED_FILES = _SC_MAPPED_FILES;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_MAPPED_FILES); }))) {
            mixin(enumMixinStr__SC_MAPPED_FILES);
        }
    }




    static if(!is(typeof(_SC_FSYNC))) {
        private enum enumMixinStr__SC_FSYNC = `enum _SC_FSYNC = _SC_FSYNC;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_FSYNC); }))) {
            mixin(enumMixinStr__SC_FSYNC);
        }
    }




    static if(!is(typeof(_SC_SYNCHRONIZED_IO))) {
        private enum enumMixinStr__SC_SYNCHRONIZED_IO = `enum _SC_SYNCHRONIZED_IO = _SC_SYNCHRONIZED_IO;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SYNCHRONIZED_IO); }))) {
            mixin(enumMixinStr__SC_SYNCHRONIZED_IO);
        }
    }




    static if(!is(typeof(_SC_PRIORITIZED_IO))) {
        private enum enumMixinStr__SC_PRIORITIZED_IO = `enum _SC_PRIORITIZED_IO = _SC_PRIORITIZED_IO;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_PRIORITIZED_IO); }))) {
            mixin(enumMixinStr__SC_PRIORITIZED_IO);
        }
    }




    static if(!is(typeof(_SC_ASYNCHRONOUS_IO))) {
        private enum enumMixinStr__SC_ASYNCHRONOUS_IO = `enum _SC_ASYNCHRONOUS_IO = _SC_ASYNCHRONOUS_IO;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_ASYNCHRONOUS_IO); }))) {
            mixin(enumMixinStr__SC_ASYNCHRONOUS_IO);
        }
    }




    static if(!is(typeof(_SC_TIMERS))) {
        private enum enumMixinStr__SC_TIMERS = `enum _SC_TIMERS = _SC_TIMERS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_TIMERS); }))) {
            mixin(enumMixinStr__SC_TIMERS);
        }
    }






    static if(!is(typeof(_SC_PRIORITY_SCHEDULING))) {
        private enum enumMixinStr__SC_PRIORITY_SCHEDULING = `enum _SC_PRIORITY_SCHEDULING = _SC_PRIORITY_SCHEDULING;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_PRIORITY_SCHEDULING); }))) {
            mixin(enumMixinStr__SC_PRIORITY_SCHEDULING);
        }
    }




    static if(!is(typeof(__NFDBITS))) {
        private enum enumMixinStr___NFDBITS = `enum __NFDBITS = ( 8 * cast( int ) ( __fd_mask ) .sizeof );`;
        static if(is(typeof({ mixin(enumMixinStr___NFDBITS); }))) {
            mixin(enumMixinStr___NFDBITS);
        }
    }
    static if(!is(typeof(_SC_REALTIME_SIGNALS))) {
        private enum enumMixinStr__SC_REALTIME_SIGNALS = `enum _SC_REALTIME_SIGNALS = _SC_REALTIME_SIGNALS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_REALTIME_SIGNALS); }))) {
            mixin(enumMixinStr__SC_REALTIME_SIGNALS);
        }
    }




    static if(!is(typeof(_SC_SAVED_IDS))) {
        private enum enumMixinStr__SC_SAVED_IDS = `enum _SC_SAVED_IDS = _SC_SAVED_IDS;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_SAVED_IDS); }))) {
            mixin(enumMixinStr__SC_SAVED_IDS);
        }
    }




    static if(!is(typeof(_SC_JOB_CONTROL))) {
        private enum enumMixinStr__SC_JOB_CONTROL = `enum _SC_JOB_CONTROL = _SC_JOB_CONTROL;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_JOB_CONTROL); }))) {
            mixin(enumMixinStr__SC_JOB_CONTROL);
        }
    }




    static if(!is(typeof(_SC_TZNAME_MAX))) {
        private enum enumMixinStr__SC_TZNAME_MAX = `enum _SC_TZNAME_MAX = _SC_TZNAME_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_TZNAME_MAX); }))) {
            mixin(enumMixinStr__SC_TZNAME_MAX);
        }
    }






    static if(!is(typeof(FD_SETSIZE))) {
        private enum enumMixinStr_FD_SETSIZE = `enum FD_SETSIZE = 1024;`;
        static if(is(typeof({ mixin(enumMixinStr_FD_SETSIZE); }))) {
            mixin(enumMixinStr_FD_SETSIZE);
        }
    }




    static if(!is(typeof(_SC_STREAM_MAX))) {
        private enum enumMixinStr__SC_STREAM_MAX = `enum _SC_STREAM_MAX = _SC_STREAM_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_STREAM_MAX); }))) {
            mixin(enumMixinStr__SC_STREAM_MAX);
        }
    }




    static if(!is(typeof(_SC_OPEN_MAX))) {
        private enum enumMixinStr__SC_OPEN_MAX = `enum _SC_OPEN_MAX = _SC_OPEN_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_OPEN_MAX); }))) {
            mixin(enumMixinStr__SC_OPEN_MAX);
        }
    }




    static if(!is(typeof(NFDBITS))) {
        private enum enumMixinStr_NFDBITS = `enum NFDBITS = ( 8 * cast( int ) ( __fd_mask ) .sizeof );`;
        static if(is(typeof({ mixin(enumMixinStr_NFDBITS); }))) {
            mixin(enumMixinStr_NFDBITS);
        }
    }
    static if(!is(typeof(_SC_NGROUPS_MAX))) {
        private enum enumMixinStr__SC_NGROUPS_MAX = `enum _SC_NGROUPS_MAX = _SC_NGROUPS_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_NGROUPS_MAX); }))) {
            mixin(enumMixinStr__SC_NGROUPS_MAX);
        }
    }




    static if(!is(typeof(_SC_CLK_TCK))) {
        private enum enumMixinStr__SC_CLK_TCK = `enum _SC_CLK_TCK = _SC_CLK_TCK;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_CLK_TCK); }))) {
            mixin(enumMixinStr__SC_CLK_TCK);
        }
    }




    static if(!is(typeof(_SC_CHILD_MAX))) {
        private enum enumMixinStr__SC_CHILD_MAX = `enum _SC_CHILD_MAX = _SC_CHILD_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_CHILD_MAX); }))) {
            mixin(enumMixinStr__SC_CHILD_MAX);
        }
    }




    static if(!is(typeof(_SC_ARG_MAX))) {
        private enum enumMixinStr__SC_ARG_MAX = `enum _SC_ARG_MAX = _SC_ARG_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__SC_ARG_MAX); }))) {
            mixin(enumMixinStr__SC_ARG_MAX);
        }
    }




    static if(!is(typeof(_PC_2_SYMLINKS))) {
        private enum enumMixinStr__PC_2_SYMLINKS = `enum _PC_2_SYMLINKS = _PC_2_SYMLINKS;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_2_SYMLINKS); }))) {
            mixin(enumMixinStr__PC_2_SYMLINKS);
        }
    }




    static if(!is(typeof(_PC_SYMLINK_MAX))) {
        private enum enumMixinStr__PC_SYMLINK_MAX = `enum _PC_SYMLINK_MAX = _PC_SYMLINK_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_SYMLINK_MAX); }))) {
            mixin(enumMixinStr__PC_SYMLINK_MAX);
        }
    }




    static if(!is(typeof(_PC_ALLOC_SIZE_MIN))) {
        private enum enumMixinStr__PC_ALLOC_SIZE_MIN = `enum _PC_ALLOC_SIZE_MIN = _PC_ALLOC_SIZE_MIN;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_ALLOC_SIZE_MIN); }))) {
            mixin(enumMixinStr__PC_ALLOC_SIZE_MIN);
        }
    }




    static if(!is(typeof(_SYS_TYPES_H))) {
        private enum enumMixinStr__SYS_TYPES_H = `enum _SYS_TYPES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__SYS_TYPES_H); }))) {
            mixin(enumMixinStr__SYS_TYPES_H);
        }
    }




    static if(!is(typeof(_PC_REC_XFER_ALIGN))) {
        private enum enumMixinStr__PC_REC_XFER_ALIGN = `enum _PC_REC_XFER_ALIGN = _PC_REC_XFER_ALIGN;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_REC_XFER_ALIGN); }))) {
            mixin(enumMixinStr__PC_REC_XFER_ALIGN);
        }
    }




    static if(!is(typeof(_PC_REC_MIN_XFER_SIZE))) {
        private enum enumMixinStr__PC_REC_MIN_XFER_SIZE = `enum _PC_REC_MIN_XFER_SIZE = _PC_REC_MIN_XFER_SIZE;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_REC_MIN_XFER_SIZE); }))) {
            mixin(enumMixinStr__PC_REC_MIN_XFER_SIZE);
        }
    }




    static if(!is(typeof(_PC_REC_MAX_XFER_SIZE))) {
        private enum enumMixinStr__PC_REC_MAX_XFER_SIZE = `enum _PC_REC_MAX_XFER_SIZE = _PC_REC_MAX_XFER_SIZE;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_REC_MAX_XFER_SIZE); }))) {
            mixin(enumMixinStr__PC_REC_MAX_XFER_SIZE);
        }
    }




    static if(!is(typeof(_PC_REC_INCR_XFER_SIZE))) {
        private enum enumMixinStr__PC_REC_INCR_XFER_SIZE = `enum _PC_REC_INCR_XFER_SIZE = _PC_REC_INCR_XFER_SIZE;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_REC_INCR_XFER_SIZE); }))) {
            mixin(enumMixinStr__PC_REC_INCR_XFER_SIZE);
        }
    }




    static if(!is(typeof(_PC_FILESIZEBITS))) {
        private enum enumMixinStr__PC_FILESIZEBITS = `enum _PC_FILESIZEBITS = _PC_FILESIZEBITS;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_FILESIZEBITS); }))) {
            mixin(enumMixinStr__PC_FILESIZEBITS);
        }
    }




    static if(!is(typeof(_PC_SOCK_MAXBUF))) {
        private enum enumMixinStr__PC_SOCK_MAXBUF = `enum _PC_SOCK_MAXBUF = _PC_SOCK_MAXBUF;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_SOCK_MAXBUF); }))) {
            mixin(enumMixinStr__PC_SOCK_MAXBUF);
        }
    }




    static if(!is(typeof(_PC_PRIO_IO))) {
        private enum enumMixinStr__PC_PRIO_IO = `enum _PC_PRIO_IO = _PC_PRIO_IO;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_PRIO_IO); }))) {
            mixin(enumMixinStr__PC_PRIO_IO);
        }
    }




    static if(!is(typeof(_PC_ASYNC_IO))) {
        private enum enumMixinStr__PC_ASYNC_IO = `enum _PC_ASYNC_IO = _PC_ASYNC_IO;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_ASYNC_IO); }))) {
            mixin(enumMixinStr__PC_ASYNC_IO);
        }
    }




    static if(!is(typeof(_PC_SYNC_IO))) {
        private enum enumMixinStr__PC_SYNC_IO = `enum _PC_SYNC_IO = _PC_SYNC_IO;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_SYNC_IO); }))) {
            mixin(enumMixinStr__PC_SYNC_IO);
        }
    }




    static if(!is(typeof(_PC_VDISABLE))) {
        private enum enumMixinStr__PC_VDISABLE = `enum _PC_VDISABLE = _PC_VDISABLE;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_VDISABLE); }))) {
            mixin(enumMixinStr__PC_VDISABLE);
        }
    }




    static if(!is(typeof(_PC_NO_TRUNC))) {
        private enum enumMixinStr__PC_NO_TRUNC = `enum _PC_NO_TRUNC = _PC_NO_TRUNC;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_NO_TRUNC); }))) {
            mixin(enumMixinStr__PC_NO_TRUNC);
        }
    }






    static if(!is(typeof(_PC_CHOWN_RESTRICTED))) {
        private enum enumMixinStr__PC_CHOWN_RESTRICTED = `enum _PC_CHOWN_RESTRICTED = _PC_CHOWN_RESTRICTED;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_CHOWN_RESTRICTED); }))) {
            mixin(enumMixinStr__PC_CHOWN_RESTRICTED);
        }
    }




    static if(!is(typeof(_PC_PIPE_BUF))) {
        private enum enumMixinStr__PC_PIPE_BUF = `enum _PC_PIPE_BUF = _PC_PIPE_BUF;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_PIPE_BUF); }))) {
            mixin(enumMixinStr__PC_PIPE_BUF);
        }
    }






    static if(!is(typeof(_PC_PATH_MAX))) {
        private enum enumMixinStr__PC_PATH_MAX = `enum _PC_PATH_MAX = _PC_PATH_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_PATH_MAX); }))) {
            mixin(enumMixinStr__PC_PATH_MAX);
        }
    }






    static if(!is(typeof(_PC_NAME_MAX))) {
        private enum enumMixinStr__PC_NAME_MAX = `enum _PC_NAME_MAX = _PC_NAME_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_NAME_MAX); }))) {
            mixin(enumMixinStr__PC_NAME_MAX);
        }
    }




    static if(!is(typeof(_PC_MAX_INPUT))) {
        private enum enumMixinStr__PC_MAX_INPUT = `enum _PC_MAX_INPUT = _PC_MAX_INPUT;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_MAX_INPUT); }))) {
            mixin(enumMixinStr__PC_MAX_INPUT);
        }
    }






    static if(!is(typeof(_PC_MAX_CANON))) {
        private enum enumMixinStr__PC_MAX_CANON = `enum _PC_MAX_CANON = _PC_MAX_CANON;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_MAX_CANON); }))) {
            mixin(enumMixinStr__PC_MAX_CANON);
        }
    }






    static if(!is(typeof(_PC_LINK_MAX))) {
        private enum enumMixinStr__PC_LINK_MAX = `enum _PC_LINK_MAX = _PC_LINK_MAX;`;
        static if(is(typeof({ mixin(enumMixinStr__PC_LINK_MAX); }))) {
            mixin(enumMixinStr__PC_LINK_MAX);
        }
    }
    static if(!is(typeof(_BITS_BYTESWAP_H))) {
        private enum enumMixinStr__BITS_BYTESWAP_H = `enum _BITS_BYTESWAP_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_BYTESWAP_H); }))) {
            mixin(enumMixinStr__BITS_BYTESWAP_H);
        }
    }






    static if(!is(typeof(EHWPOISON))) {
        private enum enumMixinStr_EHWPOISON = `enum EHWPOISON = 133;`;
        static if(is(typeof({ mixin(enumMixinStr_EHWPOISON); }))) {
            mixin(enumMixinStr_EHWPOISON);
        }
    }




    static if(!is(typeof(ERFKILL))) {
        private enum enumMixinStr_ERFKILL = `enum ERFKILL = 132;`;
        static if(is(typeof({ mixin(enumMixinStr_ERFKILL); }))) {
            mixin(enumMixinStr_ERFKILL);
        }
    }




    static if(!is(typeof(ENOTRECOVERABLE))) {
        private enum enumMixinStr_ENOTRECOVERABLE = `enum ENOTRECOVERABLE = 131;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOTRECOVERABLE); }))) {
            mixin(enumMixinStr_ENOTRECOVERABLE);
        }
    }




    static if(!is(typeof(EOWNERDEAD))) {
        private enum enumMixinStr_EOWNERDEAD = `enum EOWNERDEAD = 130;`;
        static if(is(typeof({ mixin(enumMixinStr_EOWNERDEAD); }))) {
            mixin(enumMixinStr_EOWNERDEAD);
        }
    }






    static if(!is(typeof(EKEYREJECTED))) {
        private enum enumMixinStr_EKEYREJECTED = `enum EKEYREJECTED = 129;`;
        static if(is(typeof({ mixin(enumMixinStr_EKEYREJECTED); }))) {
            mixin(enumMixinStr_EKEYREJECTED);
        }
    }




    static if(!is(typeof(EKEYREVOKED))) {
        private enum enumMixinStr_EKEYREVOKED = `enum EKEYREVOKED = 128;`;
        static if(is(typeof({ mixin(enumMixinStr_EKEYREVOKED); }))) {
            mixin(enumMixinStr_EKEYREVOKED);
        }
    }






    static if(!is(typeof(EKEYEXPIRED))) {
        private enum enumMixinStr_EKEYEXPIRED = `enum EKEYEXPIRED = 127;`;
        static if(is(typeof({ mixin(enumMixinStr_EKEYEXPIRED); }))) {
            mixin(enumMixinStr_EKEYEXPIRED);
        }
    }




    static if(!is(typeof(ENOKEY))) {
        private enum enumMixinStr_ENOKEY = `enum ENOKEY = 126;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOKEY); }))) {
            mixin(enumMixinStr_ENOKEY);
        }
    }




    static if(!is(typeof(ECANCELED))) {
        private enum enumMixinStr_ECANCELED = `enum ECANCELED = 125;`;
        static if(is(typeof({ mixin(enumMixinStr_ECANCELED); }))) {
            mixin(enumMixinStr_ECANCELED);
        }
    }




    static if(!is(typeof(EMEDIUMTYPE))) {
        private enum enumMixinStr_EMEDIUMTYPE = `enum EMEDIUMTYPE = 124;`;
        static if(is(typeof({ mixin(enumMixinStr_EMEDIUMTYPE); }))) {
            mixin(enumMixinStr_EMEDIUMTYPE);
        }
    }




    static if(!is(typeof(ENOMEDIUM))) {
        private enum enumMixinStr_ENOMEDIUM = `enum ENOMEDIUM = 123;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOMEDIUM); }))) {
            mixin(enumMixinStr_ENOMEDIUM);
        }
    }




    static if(!is(typeof(EDQUOT))) {
        private enum enumMixinStr_EDQUOT = `enum EDQUOT = 122;`;
        static if(is(typeof({ mixin(enumMixinStr_EDQUOT); }))) {
            mixin(enumMixinStr_EDQUOT);
        }
    }




    static if(!is(typeof(EREMOTEIO))) {
        private enum enumMixinStr_EREMOTEIO = `enum EREMOTEIO = 121;`;
        static if(is(typeof({ mixin(enumMixinStr_EREMOTEIO); }))) {
            mixin(enumMixinStr_EREMOTEIO);
        }
    }




    static if(!is(typeof(EISNAM))) {
        private enum enumMixinStr_EISNAM = `enum EISNAM = 120;`;
        static if(is(typeof({ mixin(enumMixinStr_EISNAM); }))) {
            mixin(enumMixinStr_EISNAM);
        }
    }




    static if(!is(typeof(ENAVAIL))) {
        private enum enumMixinStr_ENAVAIL = `enum ENAVAIL = 119;`;
        static if(is(typeof({ mixin(enumMixinStr_ENAVAIL); }))) {
            mixin(enumMixinStr_ENAVAIL);
        }
    }




    static if(!is(typeof(ENOTNAM))) {
        private enum enumMixinStr_ENOTNAM = `enum ENOTNAM = 118;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOTNAM); }))) {
            mixin(enumMixinStr_ENOTNAM);
        }
    }




    static if(!is(typeof(EUCLEAN))) {
        private enum enumMixinStr_EUCLEAN = `enum EUCLEAN = 117;`;
        static if(is(typeof({ mixin(enumMixinStr_EUCLEAN); }))) {
            mixin(enumMixinStr_EUCLEAN);
        }
    }




    static if(!is(typeof(ESTALE))) {
        private enum enumMixinStr_ESTALE = `enum ESTALE = 116;`;
        static if(is(typeof({ mixin(enumMixinStr_ESTALE); }))) {
            mixin(enumMixinStr_ESTALE);
        }
    }




    static if(!is(typeof(EINPROGRESS))) {
        private enum enumMixinStr_EINPROGRESS = `enum EINPROGRESS = 115;`;
        static if(is(typeof({ mixin(enumMixinStr_EINPROGRESS); }))) {
            mixin(enumMixinStr_EINPROGRESS);
        }
    }




    static if(!is(typeof(EALREADY))) {
        private enum enumMixinStr_EALREADY = `enum EALREADY = 114;`;
        static if(is(typeof({ mixin(enumMixinStr_EALREADY); }))) {
            mixin(enumMixinStr_EALREADY);
        }
    }




    static if(!is(typeof(EHOSTUNREACH))) {
        private enum enumMixinStr_EHOSTUNREACH = `enum EHOSTUNREACH = 113;`;
        static if(is(typeof({ mixin(enumMixinStr_EHOSTUNREACH); }))) {
            mixin(enumMixinStr_EHOSTUNREACH);
        }
    }




    static if(!is(typeof(EHOSTDOWN))) {
        private enum enumMixinStr_EHOSTDOWN = `enum EHOSTDOWN = 112;`;
        static if(is(typeof({ mixin(enumMixinStr_EHOSTDOWN); }))) {
            mixin(enumMixinStr_EHOSTDOWN);
        }
    }




    static if(!is(typeof(ECONNREFUSED))) {
        private enum enumMixinStr_ECONNREFUSED = `enum ECONNREFUSED = 111;`;
        static if(is(typeof({ mixin(enumMixinStr_ECONNREFUSED); }))) {
            mixin(enumMixinStr_ECONNREFUSED);
        }
    }




    static if(!is(typeof(__BIT_TYPES_DEFINED__))) {
        private enum enumMixinStr___BIT_TYPES_DEFINED__ = `enum __BIT_TYPES_DEFINED__ = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___BIT_TYPES_DEFINED__); }))) {
            mixin(enumMixinStr___BIT_TYPES_DEFINED__);
        }
    }




    static if(!is(typeof(ETIMEDOUT))) {
        private enum enumMixinStr_ETIMEDOUT = `enum ETIMEDOUT = 110;`;
        static if(is(typeof({ mixin(enumMixinStr_ETIMEDOUT); }))) {
            mixin(enumMixinStr_ETIMEDOUT);
        }
    }




    static if(!is(typeof(ETOOMANYREFS))) {
        private enum enumMixinStr_ETOOMANYREFS = `enum ETOOMANYREFS = 109;`;
        static if(is(typeof({ mixin(enumMixinStr_ETOOMANYREFS); }))) {
            mixin(enumMixinStr_ETOOMANYREFS);
        }
    }




    static if(!is(typeof(ESHUTDOWN))) {
        private enum enumMixinStr_ESHUTDOWN = `enum ESHUTDOWN = 108;`;
        static if(is(typeof({ mixin(enumMixinStr_ESHUTDOWN); }))) {
            mixin(enumMixinStr_ESHUTDOWN);
        }
    }




    static if(!is(typeof(ENOTCONN))) {
        private enum enumMixinStr_ENOTCONN = `enum ENOTCONN = 107;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOTCONN); }))) {
            mixin(enumMixinStr_ENOTCONN);
        }
    }




    static if(!is(typeof(EISCONN))) {
        private enum enumMixinStr_EISCONN = `enum EISCONN = 106;`;
        static if(is(typeof({ mixin(enumMixinStr_EISCONN); }))) {
            mixin(enumMixinStr_EISCONN);
        }
    }






    static if(!is(typeof(ENOBUFS))) {
        private enum enumMixinStr_ENOBUFS = `enum ENOBUFS = 105;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOBUFS); }))) {
            mixin(enumMixinStr_ENOBUFS);
        }
    }






    static if(!is(typeof(ECONNRESET))) {
        private enum enumMixinStr_ECONNRESET = `enum ECONNRESET = 104;`;
        static if(is(typeof({ mixin(enumMixinStr_ECONNRESET); }))) {
            mixin(enumMixinStr_ECONNRESET);
        }
    }






    static if(!is(typeof(ECONNABORTED))) {
        private enum enumMixinStr_ECONNABORTED = `enum ECONNABORTED = 103;`;
        static if(is(typeof({ mixin(enumMixinStr_ECONNABORTED); }))) {
            mixin(enumMixinStr_ECONNABORTED);
        }
    }






    static if(!is(typeof(ENETRESET))) {
        private enum enumMixinStr_ENETRESET = `enum ENETRESET = 102;`;
        static if(is(typeof({ mixin(enumMixinStr_ENETRESET); }))) {
            mixin(enumMixinStr_ENETRESET);
        }
    }




    static if(!is(typeof(ENETUNREACH))) {
        private enum enumMixinStr_ENETUNREACH = `enum ENETUNREACH = 101;`;
        static if(is(typeof({ mixin(enumMixinStr_ENETUNREACH); }))) {
            mixin(enumMixinStr_ENETUNREACH);
        }
    }




    static if(!is(typeof(ENETDOWN))) {
        private enum enumMixinStr_ENETDOWN = `enum ENETDOWN = 100;`;
        static if(is(typeof({ mixin(enumMixinStr_ENETDOWN); }))) {
            mixin(enumMixinStr_ENETDOWN);
        }
    }




    static if(!is(typeof(_UNISTD_H))) {
        private enum enumMixinStr__UNISTD_H = `enum _UNISTD_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__UNISTD_H); }))) {
            mixin(enumMixinStr__UNISTD_H);
        }
    }




    static if(!is(typeof(EADDRNOTAVAIL))) {
        private enum enumMixinStr_EADDRNOTAVAIL = `enum EADDRNOTAVAIL = 99;`;
        static if(is(typeof({ mixin(enumMixinStr_EADDRNOTAVAIL); }))) {
            mixin(enumMixinStr_EADDRNOTAVAIL);
        }
    }




    static if(!is(typeof(EADDRINUSE))) {
        private enum enumMixinStr_EADDRINUSE = `enum EADDRINUSE = 98;`;
        static if(is(typeof({ mixin(enumMixinStr_EADDRINUSE); }))) {
            mixin(enumMixinStr_EADDRINUSE);
        }
    }




    static if(!is(typeof(EAFNOSUPPORT))) {
        private enum enumMixinStr_EAFNOSUPPORT = `enum EAFNOSUPPORT = 97;`;
        static if(is(typeof({ mixin(enumMixinStr_EAFNOSUPPORT); }))) {
            mixin(enumMixinStr_EAFNOSUPPORT);
        }
    }




    static if(!is(typeof(_POSIX_VERSION))) {
        private enum enumMixinStr__POSIX_VERSION = `enum _POSIX_VERSION = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX_VERSION); }))) {
            mixin(enumMixinStr__POSIX_VERSION);
        }
    }




    static if(!is(typeof(EPFNOSUPPORT))) {
        private enum enumMixinStr_EPFNOSUPPORT = `enum EPFNOSUPPORT = 96;`;
        static if(is(typeof({ mixin(enumMixinStr_EPFNOSUPPORT); }))) {
            mixin(enumMixinStr_EPFNOSUPPORT);
        }
    }




    static if(!is(typeof(__POSIX2_THIS_VERSION))) {
        private enum enumMixinStr___POSIX2_THIS_VERSION = `enum __POSIX2_THIS_VERSION = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr___POSIX2_THIS_VERSION); }))) {
            mixin(enumMixinStr___POSIX2_THIS_VERSION);
        }
    }




    static if(!is(typeof(_POSIX2_VERSION))) {
        private enum enumMixinStr__POSIX2_VERSION = `enum _POSIX2_VERSION = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_VERSION); }))) {
            mixin(enumMixinStr__POSIX2_VERSION);
        }
    }




    static if(!is(typeof(_POSIX2_C_VERSION))) {
        private enum enumMixinStr__POSIX2_C_VERSION = `enum _POSIX2_C_VERSION = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_C_VERSION); }))) {
            mixin(enumMixinStr__POSIX2_C_VERSION);
        }
    }




    static if(!is(typeof(_POSIX2_C_BIND))) {
        private enum enumMixinStr__POSIX2_C_BIND = `enum _POSIX2_C_BIND = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_C_BIND); }))) {
            mixin(enumMixinStr__POSIX2_C_BIND);
        }
    }




    static if(!is(typeof(_POSIX2_C_DEV))) {
        private enum enumMixinStr__POSIX2_C_DEV = `enum _POSIX2_C_DEV = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_C_DEV); }))) {
            mixin(enumMixinStr__POSIX2_C_DEV);
        }
    }




    static if(!is(typeof(_POSIX2_SW_DEV))) {
        private enum enumMixinStr__POSIX2_SW_DEV = `enum _POSIX2_SW_DEV = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_SW_DEV); }))) {
            mixin(enumMixinStr__POSIX2_SW_DEV);
        }
    }




    static if(!is(typeof(_POSIX2_LOCALEDEF))) {
        private enum enumMixinStr__POSIX2_LOCALEDEF = `enum _POSIX2_LOCALEDEF = 200809L;`;
        static if(is(typeof({ mixin(enumMixinStr__POSIX2_LOCALEDEF); }))) {
            mixin(enumMixinStr__POSIX2_LOCALEDEF);
        }
    }




    static if(!is(typeof(EOPNOTSUPP))) {
        private enum enumMixinStr_EOPNOTSUPP = `enum EOPNOTSUPP = 95;`;
        static if(is(typeof({ mixin(enumMixinStr_EOPNOTSUPP); }))) {
            mixin(enumMixinStr_EOPNOTSUPP);
        }
    }




    static if(!is(typeof(_XOPEN_VERSION))) {
        private enum enumMixinStr__XOPEN_VERSION = `enum _XOPEN_VERSION = 700;`;
        static if(is(typeof({ mixin(enumMixinStr__XOPEN_VERSION); }))) {
            mixin(enumMixinStr__XOPEN_VERSION);
        }
    }




    static if(!is(typeof(_XOPEN_XCU_VERSION))) {
        private enum enumMixinStr__XOPEN_XCU_VERSION = `enum _XOPEN_XCU_VERSION = 4;`;
        static if(is(typeof({ mixin(enumMixinStr__XOPEN_XCU_VERSION); }))) {
            mixin(enumMixinStr__XOPEN_XCU_VERSION);
        }
    }




    static if(!is(typeof(_XOPEN_XPG2))) {
        private enum enumMixinStr__XOPEN_XPG2 = `enum _XOPEN_XPG2 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__XOPEN_XPG2); }))) {
            mixin(enumMixinStr__XOPEN_XPG2);
        }
    }




    static if(!is(typeof(_XOPEN_XPG3))) {
        private enum enumMixinStr__XOPEN_XPG3 = `enum _XOPEN_XPG3 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__XOPEN_XPG3); }))) {
            mixin(enumMixinStr__XOPEN_XPG3);
        }
    }




    static if(!is(typeof(_XOPEN_XPG4))) {
        private enum enumMixinStr__XOPEN_XPG4 = `enum _XOPEN_XPG4 = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__XOPEN_XPG4); }))) {
            mixin(enumMixinStr__XOPEN_XPG4);
        }
    }




    static if(!is(typeof(_XOPEN_UNIX))) {
        private enum enumMixinStr__XOPEN_UNIX = `enum _XOPEN_UNIX = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__XOPEN_UNIX); }))) {
            mixin(enumMixinStr__XOPEN_UNIX);
        }
    }




    static if(!is(typeof(_XOPEN_ENH_I18N))) {
        private enum enumMixinStr__XOPEN_ENH_I18N = `enum _XOPEN_ENH_I18N = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__XOPEN_ENH_I18N); }))) {
            mixin(enumMixinStr__XOPEN_ENH_I18N);
        }
    }




    static if(!is(typeof(_XOPEN_LEGACY))) {
        private enum enumMixinStr__XOPEN_LEGACY = `enum _XOPEN_LEGACY = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__XOPEN_LEGACY); }))) {
            mixin(enumMixinStr__XOPEN_LEGACY);
        }
    }




    static if(!is(typeof(ESOCKTNOSUPPORT))) {
        private enum enumMixinStr_ESOCKTNOSUPPORT = `enum ESOCKTNOSUPPORT = 94;`;
        static if(is(typeof({ mixin(enumMixinStr_ESOCKTNOSUPPORT); }))) {
            mixin(enumMixinStr_ESOCKTNOSUPPORT);
        }
    }




    static if(!is(typeof(EPROTONOSUPPORT))) {
        private enum enumMixinStr_EPROTONOSUPPORT = `enum EPROTONOSUPPORT = 93;`;
        static if(is(typeof({ mixin(enumMixinStr_EPROTONOSUPPORT); }))) {
            mixin(enumMixinStr_EPROTONOSUPPORT);
        }
    }




    static if(!is(typeof(ENOPROTOOPT))) {
        private enum enumMixinStr_ENOPROTOOPT = `enum ENOPROTOOPT = 92;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOPROTOOPT); }))) {
            mixin(enumMixinStr_ENOPROTOOPT);
        }
    }




    static if(!is(typeof(STDIN_FILENO))) {
        private enum enumMixinStr_STDIN_FILENO = `enum STDIN_FILENO = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_STDIN_FILENO); }))) {
            mixin(enumMixinStr_STDIN_FILENO);
        }
    }




    static if(!is(typeof(STDOUT_FILENO))) {
        private enum enumMixinStr_STDOUT_FILENO = `enum STDOUT_FILENO = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_STDOUT_FILENO); }))) {
            mixin(enumMixinStr_STDOUT_FILENO);
        }
    }




    static if(!is(typeof(STDERR_FILENO))) {
        private enum enumMixinStr_STDERR_FILENO = `enum STDERR_FILENO = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_STDERR_FILENO); }))) {
            mixin(enumMixinStr_STDERR_FILENO);
        }
    }




    static if(!is(typeof(EPROTOTYPE))) {
        private enum enumMixinStr_EPROTOTYPE = `enum EPROTOTYPE = 91;`;
        static if(is(typeof({ mixin(enumMixinStr_EPROTOTYPE); }))) {
            mixin(enumMixinStr_EPROTOTYPE);
        }
    }




    static if(!is(typeof(EMSGSIZE))) {
        private enum enumMixinStr_EMSGSIZE = `enum EMSGSIZE = 90;`;
        static if(is(typeof({ mixin(enumMixinStr_EMSGSIZE); }))) {
            mixin(enumMixinStr_EMSGSIZE);
        }
    }






    static if(!is(typeof(EDESTADDRREQ))) {
        private enum enumMixinStr_EDESTADDRREQ = `enum EDESTADDRREQ = 89;`;
        static if(is(typeof({ mixin(enumMixinStr_EDESTADDRREQ); }))) {
            mixin(enumMixinStr_EDESTADDRREQ);
        }
    }




    static if(!is(typeof(ENOTSOCK))) {
        private enum enumMixinStr_ENOTSOCK = `enum ENOTSOCK = 88;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOTSOCK); }))) {
            mixin(enumMixinStr_ENOTSOCK);
        }
    }




    static if(!is(typeof(EUSERS))) {
        private enum enumMixinStr_EUSERS = `enum EUSERS = 87;`;
        static if(is(typeof({ mixin(enumMixinStr_EUSERS); }))) {
            mixin(enumMixinStr_EUSERS);
        }
    }






    static if(!is(typeof(ESTRPIPE))) {
        private enum enumMixinStr_ESTRPIPE = `enum ESTRPIPE = 86;`;
        static if(is(typeof({ mixin(enumMixinStr_ESTRPIPE); }))) {
            mixin(enumMixinStr_ESTRPIPE);
        }
    }






    static if(!is(typeof(ERESTART))) {
        private enum enumMixinStr_ERESTART = `enum ERESTART = 85;`;
        static if(is(typeof({ mixin(enumMixinStr_ERESTART); }))) {
            mixin(enumMixinStr_ERESTART);
        }
    }






    static if(!is(typeof(EILSEQ))) {
        private enum enumMixinStr_EILSEQ = `enum EILSEQ = 84;`;
        static if(is(typeof({ mixin(enumMixinStr_EILSEQ); }))) {
            mixin(enumMixinStr_EILSEQ);
        }
    }






    static if(!is(typeof(ELIBEXEC))) {
        private enum enumMixinStr_ELIBEXEC = `enum ELIBEXEC = 83;`;
        static if(is(typeof({ mixin(enumMixinStr_ELIBEXEC); }))) {
            mixin(enumMixinStr_ELIBEXEC);
        }
    }






    static if(!is(typeof(ELIBMAX))) {
        private enum enumMixinStr_ELIBMAX = `enum ELIBMAX = 82;`;
        static if(is(typeof({ mixin(enumMixinStr_ELIBMAX); }))) {
            mixin(enumMixinStr_ELIBMAX);
        }
    }




    static if(!is(typeof(ELIBSCN))) {
        private enum enumMixinStr_ELIBSCN = `enum ELIBSCN = 81;`;
        static if(is(typeof({ mixin(enumMixinStr_ELIBSCN); }))) {
            mixin(enumMixinStr_ELIBSCN);
        }
    }






    static if(!is(typeof(ELIBBAD))) {
        private enum enumMixinStr_ELIBBAD = `enum ELIBBAD = 80;`;
        static if(is(typeof({ mixin(enumMixinStr_ELIBBAD); }))) {
            mixin(enumMixinStr_ELIBBAD);
        }
    }




    static if(!is(typeof(ELIBACC))) {
        private enum enumMixinStr_ELIBACC = `enum ELIBACC = 79;`;
        static if(is(typeof({ mixin(enumMixinStr_ELIBACC); }))) {
            mixin(enumMixinStr_ELIBACC);
        }
    }






    static if(!is(typeof(R_OK))) {
        private enum enumMixinStr_R_OK = `enum R_OK = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_R_OK); }))) {
            mixin(enumMixinStr_R_OK);
        }
    }




    static if(!is(typeof(W_OK))) {
        private enum enumMixinStr_W_OK = `enum W_OK = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_W_OK); }))) {
            mixin(enumMixinStr_W_OK);
        }
    }




    static if(!is(typeof(X_OK))) {
        private enum enumMixinStr_X_OK = `enum X_OK = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_X_OK); }))) {
            mixin(enumMixinStr_X_OK);
        }
    }




    static if(!is(typeof(F_OK))) {
        private enum enumMixinStr_F_OK = `enum F_OK = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_F_OK); }))) {
            mixin(enumMixinStr_F_OK);
        }
    }




    static if(!is(typeof(EREMCHG))) {
        private enum enumMixinStr_EREMCHG = `enum EREMCHG = 78;`;
        static if(is(typeof({ mixin(enumMixinStr_EREMCHG); }))) {
            mixin(enumMixinStr_EREMCHG);
        }
    }




    static if(!is(typeof(EBADFD))) {
        private enum enumMixinStr_EBADFD = `enum EBADFD = 77;`;
        static if(is(typeof({ mixin(enumMixinStr_EBADFD); }))) {
            mixin(enumMixinStr_EBADFD);
        }
    }




    static if(!is(typeof(ENOTUNIQ))) {
        private enum enumMixinStr_ENOTUNIQ = `enum ENOTUNIQ = 76;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOTUNIQ); }))) {
            mixin(enumMixinStr_ENOTUNIQ);
        }
    }




    static if(!is(typeof(EOVERFLOW))) {
        private enum enumMixinStr_EOVERFLOW = `enum EOVERFLOW = 75;`;
        static if(is(typeof({ mixin(enumMixinStr_EOVERFLOW); }))) {
            mixin(enumMixinStr_EOVERFLOW);
        }
    }




    static if(!is(typeof(EBADMSG))) {
        private enum enumMixinStr_EBADMSG = `enum EBADMSG = 74;`;
        static if(is(typeof({ mixin(enumMixinStr_EBADMSG); }))) {
            mixin(enumMixinStr_EBADMSG);
        }
    }




    static if(!is(typeof(EDOTDOT))) {
        private enum enumMixinStr_EDOTDOT = `enum EDOTDOT = 73;`;
        static if(is(typeof({ mixin(enumMixinStr_EDOTDOT); }))) {
            mixin(enumMixinStr_EDOTDOT);
        }
    }




    static if(!is(typeof(EMULTIHOP))) {
        private enum enumMixinStr_EMULTIHOP = `enum EMULTIHOP = 72;`;
        static if(is(typeof({ mixin(enumMixinStr_EMULTIHOP); }))) {
            mixin(enumMixinStr_EMULTIHOP);
        }
    }




    static if(!is(typeof(EPROTO))) {
        private enum enumMixinStr_EPROTO = `enum EPROTO = 71;`;
        static if(is(typeof({ mixin(enumMixinStr_EPROTO); }))) {
            mixin(enumMixinStr_EPROTO);
        }
    }




    static if(!is(typeof(ECOMM))) {
        private enum enumMixinStr_ECOMM = `enum ECOMM = 70;`;
        static if(is(typeof({ mixin(enumMixinStr_ECOMM); }))) {
            mixin(enumMixinStr_ECOMM);
        }
    }




    static if(!is(typeof(L_SET))) {
        private enum enumMixinStr_L_SET = `enum L_SET = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_L_SET); }))) {
            mixin(enumMixinStr_L_SET);
        }
    }




    static if(!is(typeof(L_INCR))) {
        private enum enumMixinStr_L_INCR = `enum L_INCR = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_L_INCR); }))) {
            mixin(enumMixinStr_L_INCR);
        }
    }




    static if(!is(typeof(L_XTND))) {
        private enum enumMixinStr_L_XTND = `enum L_XTND = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_L_XTND); }))) {
            mixin(enumMixinStr_L_XTND);
        }
    }




    static if(!is(typeof(ESRMNT))) {
        private enum enumMixinStr_ESRMNT = `enum ESRMNT = 69;`;
        static if(is(typeof({ mixin(enumMixinStr_ESRMNT); }))) {
            mixin(enumMixinStr_ESRMNT);
        }
    }




    static if(!is(typeof(EADV))) {
        private enum enumMixinStr_EADV = `enum EADV = 68;`;
        static if(is(typeof({ mixin(enumMixinStr_EADV); }))) {
            mixin(enumMixinStr_EADV);
        }
    }




    static if(!is(typeof(ENOLINK))) {
        private enum enumMixinStr_ENOLINK = `enum ENOLINK = 67;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOLINK); }))) {
            mixin(enumMixinStr_ENOLINK);
        }
    }




    static if(!is(typeof(EREMOTE))) {
        private enum enumMixinStr_EREMOTE = `enum EREMOTE = 66;`;
        static if(is(typeof({ mixin(enumMixinStr_EREMOTE); }))) {
            mixin(enumMixinStr_EREMOTE);
        }
    }




    static if(!is(typeof(ENOPKG))) {
        private enum enumMixinStr_ENOPKG = `enum ENOPKG = 65;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOPKG); }))) {
            mixin(enumMixinStr_ENOPKG);
        }
    }




    static if(!is(typeof(ENONET))) {
        private enum enumMixinStr_ENONET = `enum ENONET = 64;`;
        static if(is(typeof({ mixin(enumMixinStr_ENONET); }))) {
            mixin(enumMixinStr_ENONET);
        }
    }




    static if(!is(typeof(ENOSR))) {
        private enum enumMixinStr_ENOSR = `enum ENOSR = 63;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOSR); }))) {
            mixin(enumMixinStr_ENOSR);
        }
    }




    static if(!is(typeof(ETIME))) {
        private enum enumMixinStr_ETIME = `enum ETIME = 62;`;
        static if(is(typeof({ mixin(enumMixinStr_ETIME); }))) {
            mixin(enumMixinStr_ETIME);
        }
    }




    static if(!is(typeof(ENODATA))) {
        private enum enumMixinStr_ENODATA = `enum ENODATA = 61;`;
        static if(is(typeof({ mixin(enumMixinStr_ENODATA); }))) {
            mixin(enumMixinStr_ENODATA);
        }
    }




    static if(!is(typeof(ENOSTR))) {
        private enum enumMixinStr_ENOSTR = `enum ENOSTR = 60;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOSTR); }))) {
            mixin(enumMixinStr_ENOSTR);
        }
    }




    static if(!is(typeof(EBFONT))) {
        private enum enumMixinStr_EBFONT = `enum EBFONT = 59;`;
        static if(is(typeof({ mixin(enumMixinStr_EBFONT); }))) {
            mixin(enumMixinStr_EBFONT);
        }
    }




    static if(!is(typeof(EDEADLOCK))) {
        private enum enumMixinStr_EDEADLOCK = `enum EDEADLOCK = EDEADLK;`;
        static if(is(typeof({ mixin(enumMixinStr_EDEADLOCK); }))) {
            mixin(enumMixinStr_EDEADLOCK);
        }
    }




    static if(!is(typeof(EBADSLT))) {
        private enum enumMixinStr_EBADSLT = `enum EBADSLT = 57;`;
        static if(is(typeof({ mixin(enumMixinStr_EBADSLT); }))) {
            mixin(enumMixinStr_EBADSLT);
        }
    }




    static if(!is(typeof(EBADRQC))) {
        private enum enumMixinStr_EBADRQC = `enum EBADRQC = 56;`;
        static if(is(typeof({ mixin(enumMixinStr_EBADRQC); }))) {
            mixin(enumMixinStr_EBADRQC);
        }
    }




    static if(!is(typeof(ENOANO))) {
        private enum enumMixinStr_ENOANO = `enum ENOANO = 55;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOANO); }))) {
            mixin(enumMixinStr_ENOANO);
        }
    }




    static if(!is(typeof(EXFULL))) {
        private enum enumMixinStr_EXFULL = `enum EXFULL = 54;`;
        static if(is(typeof({ mixin(enumMixinStr_EXFULL); }))) {
            mixin(enumMixinStr_EXFULL);
        }
    }




    static if(!is(typeof(EBADR))) {
        private enum enumMixinStr_EBADR = `enum EBADR = 53;`;
        static if(is(typeof({ mixin(enumMixinStr_EBADR); }))) {
            mixin(enumMixinStr_EBADR);
        }
    }




    static if(!is(typeof(EBADE))) {
        private enum enumMixinStr_EBADE = `enum EBADE = 52;`;
        static if(is(typeof({ mixin(enumMixinStr_EBADE); }))) {
            mixin(enumMixinStr_EBADE);
        }
    }




    static if(!is(typeof(EL2HLT))) {
        private enum enumMixinStr_EL2HLT = `enum EL2HLT = 51;`;
        static if(is(typeof({ mixin(enumMixinStr_EL2HLT); }))) {
            mixin(enumMixinStr_EL2HLT);
        }
    }




    static if(!is(typeof(ENOCSI))) {
        private enum enumMixinStr_ENOCSI = `enum ENOCSI = 50;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOCSI); }))) {
            mixin(enumMixinStr_ENOCSI);
        }
    }




    static if(!is(typeof(EUNATCH))) {
        private enum enumMixinStr_EUNATCH = `enum EUNATCH = 49;`;
        static if(is(typeof({ mixin(enumMixinStr_EUNATCH); }))) {
            mixin(enumMixinStr_EUNATCH);
        }
    }




    static if(!is(typeof(ELNRNG))) {
        private enum enumMixinStr_ELNRNG = `enum ELNRNG = 48;`;
        static if(is(typeof({ mixin(enumMixinStr_ELNRNG); }))) {
            mixin(enumMixinStr_ELNRNG);
        }
    }




    static if(!is(typeof(EL3RST))) {
        private enum enumMixinStr_EL3RST = `enum EL3RST = 47;`;
        static if(is(typeof({ mixin(enumMixinStr_EL3RST); }))) {
            mixin(enumMixinStr_EL3RST);
        }
    }




    static if(!is(typeof(EL3HLT))) {
        private enum enumMixinStr_EL3HLT = `enum EL3HLT = 46;`;
        static if(is(typeof({ mixin(enumMixinStr_EL3HLT); }))) {
            mixin(enumMixinStr_EL3HLT);
        }
    }




    static if(!is(typeof(EL2NSYNC))) {
        private enum enumMixinStr_EL2NSYNC = `enum EL2NSYNC = 45;`;
        static if(is(typeof({ mixin(enumMixinStr_EL2NSYNC); }))) {
            mixin(enumMixinStr_EL2NSYNC);
        }
    }




    static if(!is(typeof(ECHRNG))) {
        private enum enumMixinStr_ECHRNG = `enum ECHRNG = 44;`;
        static if(is(typeof({ mixin(enumMixinStr_ECHRNG); }))) {
            mixin(enumMixinStr_ECHRNG);
        }
    }




    static if(!is(typeof(EIDRM))) {
        private enum enumMixinStr_EIDRM = `enum EIDRM = 43;`;
        static if(is(typeof({ mixin(enumMixinStr_EIDRM); }))) {
            mixin(enumMixinStr_EIDRM);
        }
    }




    static if(!is(typeof(ENOMSG))) {
        private enum enumMixinStr_ENOMSG = `enum ENOMSG = 42;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOMSG); }))) {
            mixin(enumMixinStr_ENOMSG);
        }
    }




    static if(!is(typeof(EWOULDBLOCK))) {
        private enum enumMixinStr_EWOULDBLOCK = `enum EWOULDBLOCK = EAGAIN;`;
        static if(is(typeof({ mixin(enumMixinStr_EWOULDBLOCK); }))) {
            mixin(enumMixinStr_EWOULDBLOCK);
        }
    }




    static if(!is(typeof(ELOOP))) {
        private enum enumMixinStr_ELOOP = `enum ELOOP = 40;`;
        static if(is(typeof({ mixin(enumMixinStr_ELOOP); }))) {
            mixin(enumMixinStr_ELOOP);
        }
    }




    static if(!is(typeof(ENOTEMPTY))) {
        private enum enumMixinStr_ENOTEMPTY = `enum ENOTEMPTY = 39;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOTEMPTY); }))) {
            mixin(enumMixinStr_ENOTEMPTY);
        }
    }




    static if(!is(typeof(ENOSYS))) {
        private enum enumMixinStr_ENOSYS = `enum ENOSYS = 38;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOSYS); }))) {
            mixin(enumMixinStr_ENOSYS);
        }
    }




    static if(!is(typeof(ENOLCK))) {
        private enum enumMixinStr_ENOLCK = `enum ENOLCK = 37;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOLCK); }))) {
            mixin(enumMixinStr_ENOLCK);
        }
    }




    static if(!is(typeof(ENAMETOOLONG))) {
        private enum enumMixinStr_ENAMETOOLONG = `enum ENAMETOOLONG = 36;`;
        static if(is(typeof({ mixin(enumMixinStr_ENAMETOOLONG); }))) {
            mixin(enumMixinStr_ENAMETOOLONG);
        }
    }




    static if(!is(typeof(EDEADLK))) {
        private enum enumMixinStr_EDEADLK = `enum EDEADLK = 35;`;
        static if(is(typeof({ mixin(enumMixinStr_EDEADLK); }))) {
            mixin(enumMixinStr_EDEADLK);
        }
    }






    static if(!is(typeof(ERANGE))) {
        private enum enumMixinStr_ERANGE = `enum ERANGE = 34;`;
        static if(is(typeof({ mixin(enumMixinStr_ERANGE); }))) {
            mixin(enumMixinStr_ERANGE);
        }
    }




    static if(!is(typeof(EDOM))) {
        private enum enumMixinStr_EDOM = `enum EDOM = 33;`;
        static if(is(typeof({ mixin(enumMixinStr_EDOM); }))) {
            mixin(enumMixinStr_EDOM);
        }
    }




    static if(!is(typeof(EPIPE))) {
        private enum enumMixinStr_EPIPE = `enum EPIPE = 32;`;
        static if(is(typeof({ mixin(enumMixinStr_EPIPE); }))) {
            mixin(enumMixinStr_EPIPE);
        }
    }




    static if(!is(typeof(EMLINK))) {
        private enum enumMixinStr_EMLINK = `enum EMLINK = 31;`;
        static if(is(typeof({ mixin(enumMixinStr_EMLINK); }))) {
            mixin(enumMixinStr_EMLINK);
        }
    }




    static if(!is(typeof(EROFS))) {
        private enum enumMixinStr_EROFS = `enum EROFS = 30;`;
        static if(is(typeof({ mixin(enumMixinStr_EROFS); }))) {
            mixin(enumMixinStr_EROFS);
        }
    }




    static if(!is(typeof(ESPIPE))) {
        private enum enumMixinStr_ESPIPE = `enum ESPIPE = 29;`;
        static if(is(typeof({ mixin(enumMixinStr_ESPIPE); }))) {
            mixin(enumMixinStr_ESPIPE);
        }
    }




    static if(!is(typeof(ENOSPC))) {
        private enum enumMixinStr_ENOSPC = `enum ENOSPC = 28;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOSPC); }))) {
            mixin(enumMixinStr_ENOSPC);
        }
    }




    static if(!is(typeof(EFBIG))) {
        private enum enumMixinStr_EFBIG = `enum EFBIG = 27;`;
        static if(is(typeof({ mixin(enumMixinStr_EFBIG); }))) {
            mixin(enumMixinStr_EFBIG);
        }
    }




    static if(!is(typeof(ETXTBSY))) {
        private enum enumMixinStr_ETXTBSY = `enum ETXTBSY = 26;`;
        static if(is(typeof({ mixin(enumMixinStr_ETXTBSY); }))) {
            mixin(enumMixinStr_ETXTBSY);
        }
    }




    static if(!is(typeof(ENOTTY))) {
        private enum enumMixinStr_ENOTTY = `enum ENOTTY = 25;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOTTY); }))) {
            mixin(enumMixinStr_ENOTTY);
        }
    }




    static if(!is(typeof(EMFILE))) {
        private enum enumMixinStr_EMFILE = `enum EMFILE = 24;`;
        static if(is(typeof({ mixin(enumMixinStr_EMFILE); }))) {
            mixin(enumMixinStr_EMFILE);
        }
    }




    static if(!is(typeof(ENFILE))) {
        private enum enumMixinStr_ENFILE = `enum ENFILE = 23;`;
        static if(is(typeof({ mixin(enumMixinStr_ENFILE); }))) {
            mixin(enumMixinStr_ENFILE);
        }
    }




    static if(!is(typeof(EINVAL))) {
        private enum enumMixinStr_EINVAL = `enum EINVAL = 22;`;
        static if(is(typeof({ mixin(enumMixinStr_EINVAL); }))) {
            mixin(enumMixinStr_EINVAL);
        }
    }




    static if(!is(typeof(EISDIR))) {
        private enum enumMixinStr_EISDIR = `enum EISDIR = 21;`;
        static if(is(typeof({ mixin(enumMixinStr_EISDIR); }))) {
            mixin(enumMixinStr_EISDIR);
        }
    }




    static if(!is(typeof(ENOTDIR))) {
        private enum enumMixinStr_ENOTDIR = `enum ENOTDIR = 20;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOTDIR); }))) {
            mixin(enumMixinStr_ENOTDIR);
        }
    }




    static if(!is(typeof(ENODEV))) {
        private enum enumMixinStr_ENODEV = `enum ENODEV = 19;`;
        static if(is(typeof({ mixin(enumMixinStr_ENODEV); }))) {
            mixin(enumMixinStr_ENODEV);
        }
    }




    static if(!is(typeof(EXDEV))) {
        private enum enumMixinStr_EXDEV = `enum EXDEV = 18;`;
        static if(is(typeof({ mixin(enumMixinStr_EXDEV); }))) {
            mixin(enumMixinStr_EXDEV);
        }
    }




    static if(!is(typeof(EEXIST))) {
        private enum enumMixinStr_EEXIST = `enum EEXIST = 17;`;
        static if(is(typeof({ mixin(enumMixinStr_EEXIST); }))) {
            mixin(enumMixinStr_EEXIST);
        }
    }




    static if(!is(typeof(EBUSY))) {
        private enum enumMixinStr_EBUSY = `enum EBUSY = 16;`;
        static if(is(typeof({ mixin(enumMixinStr_EBUSY); }))) {
            mixin(enumMixinStr_EBUSY);
        }
    }




    static if(!is(typeof(ENOTBLK))) {
        private enum enumMixinStr_ENOTBLK = `enum ENOTBLK = 15;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOTBLK); }))) {
            mixin(enumMixinStr_ENOTBLK);
        }
    }




    static if(!is(typeof(EFAULT))) {
        private enum enumMixinStr_EFAULT = `enum EFAULT = 14;`;
        static if(is(typeof({ mixin(enumMixinStr_EFAULT); }))) {
            mixin(enumMixinStr_EFAULT);
        }
    }




    static if(!is(typeof(EACCES))) {
        private enum enumMixinStr_EACCES = `enum EACCES = 13;`;
        static if(is(typeof({ mixin(enumMixinStr_EACCES); }))) {
            mixin(enumMixinStr_EACCES);
        }
    }




    static if(!is(typeof(ENOMEM))) {
        private enum enumMixinStr_ENOMEM = `enum ENOMEM = 12;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOMEM); }))) {
            mixin(enumMixinStr_ENOMEM);
        }
    }




    static if(!is(typeof(EAGAIN))) {
        private enum enumMixinStr_EAGAIN = `enum EAGAIN = 11;`;
        static if(is(typeof({ mixin(enumMixinStr_EAGAIN); }))) {
            mixin(enumMixinStr_EAGAIN);
        }
    }




    static if(!is(typeof(ECHILD))) {
        private enum enumMixinStr_ECHILD = `enum ECHILD = 10;`;
        static if(is(typeof({ mixin(enumMixinStr_ECHILD); }))) {
            mixin(enumMixinStr_ECHILD);
        }
    }




    static if(!is(typeof(EBADF))) {
        private enum enumMixinStr_EBADF = `enum EBADF = 9;`;
        static if(is(typeof({ mixin(enumMixinStr_EBADF); }))) {
            mixin(enumMixinStr_EBADF);
        }
    }




    static if(!is(typeof(ENOEXEC))) {
        private enum enumMixinStr_ENOEXEC = `enum ENOEXEC = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOEXEC); }))) {
            mixin(enumMixinStr_ENOEXEC);
        }
    }




    static if(!is(typeof(E2BIG))) {
        private enum enumMixinStr_E2BIG = `enum E2BIG = 7;`;
        static if(is(typeof({ mixin(enumMixinStr_E2BIG); }))) {
            mixin(enumMixinStr_E2BIG);
        }
    }




    static if(!is(typeof(ENXIO))) {
        private enum enumMixinStr_ENXIO = `enum ENXIO = 6;`;
        static if(is(typeof({ mixin(enumMixinStr_ENXIO); }))) {
            mixin(enumMixinStr_ENXIO);
        }
    }




    static if(!is(typeof(EIO))) {
        private enum enumMixinStr_EIO = `enum EIO = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_EIO); }))) {
            mixin(enumMixinStr_EIO);
        }
    }




    static if(!is(typeof(EINTR))) {
        private enum enumMixinStr_EINTR = `enum EINTR = 4;`;
        static if(is(typeof({ mixin(enumMixinStr_EINTR); }))) {
            mixin(enumMixinStr_EINTR);
        }
    }




    static if(!is(typeof(ESRCH))) {
        private enum enumMixinStr_ESRCH = `enum ESRCH = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_ESRCH); }))) {
            mixin(enumMixinStr_ESRCH);
        }
    }




    static if(!is(typeof(ENOENT))) {
        private enum enumMixinStr_ENOENT = `enum ENOENT = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_ENOENT); }))) {
            mixin(enumMixinStr_ENOENT);
        }
    }




    static if(!is(typeof(EPERM))) {
        private enum enumMixinStr_EPERM = `enum EPERM = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_EPERM); }))) {
            mixin(enumMixinStr_EPERM);
        }
    }
    static if(!is(typeof(_ALLOCA_H))) {
        private enum enumMixinStr__ALLOCA_H = `enum _ALLOCA_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__ALLOCA_H); }))) {
            mixin(enumMixinStr__ALLOCA_H);
        }
    }




    static if(!is(typeof(F_ULOCK))) {
        private enum enumMixinStr_F_ULOCK = `enum F_ULOCK = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_F_ULOCK); }))) {
            mixin(enumMixinStr_F_ULOCK);
        }
    }




    static if(!is(typeof(F_LOCK))) {
        private enum enumMixinStr_F_LOCK = `enum F_LOCK = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_F_LOCK); }))) {
            mixin(enumMixinStr_F_LOCK);
        }
    }




    static if(!is(typeof(F_TLOCK))) {
        private enum enumMixinStr_F_TLOCK = `enum F_TLOCK = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_F_TLOCK); }))) {
            mixin(enumMixinStr_F_TLOCK);
        }
    }




    static if(!is(typeof(F_TEST))) {
        private enum enumMixinStr_F_TEST = `enum F_TEST = 3;`;
        static if(is(typeof({ mixin(enumMixinStr_F_TEST); }))) {
            mixin(enumMixinStr_F_TEST);
        }
    }
    static if(!is(typeof(SCHAR_MAX))) {
        private enum enumMixinStr_SCHAR_MAX = `enum SCHAR_MAX = 0x7f;`;
        static if(is(typeof({ mixin(enumMixinStr_SCHAR_MAX); }))) {
            mixin(enumMixinStr_SCHAR_MAX);
        }
    }




    static if(!is(typeof(SHRT_MAX))) {
        private enum enumMixinStr_SHRT_MAX = `enum SHRT_MAX = 0x7fff;`;
        static if(is(typeof({ mixin(enumMixinStr_SHRT_MAX); }))) {
            mixin(enumMixinStr_SHRT_MAX);
        }
    }




    static if(!is(typeof(INT_MAX))) {
        private enum enumMixinStr_INT_MAX = `enum INT_MAX = 0x7fffffff;`;
        static if(is(typeof({ mixin(enumMixinStr_INT_MAX); }))) {
            mixin(enumMixinStr_INT_MAX);
        }
    }




    static if(!is(typeof(LONG_MAX))) {
        private enum enumMixinStr_LONG_MAX = `enum LONG_MAX = 0x7fffffffffffffffL;`;
        static if(is(typeof({ mixin(enumMixinStr_LONG_MAX); }))) {
            mixin(enumMixinStr_LONG_MAX);
        }
    }




    static if(!is(typeof(SCHAR_MIN))) {
        private enum enumMixinStr_SCHAR_MIN = `enum SCHAR_MIN = ( - 0x7f - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_SCHAR_MIN); }))) {
            mixin(enumMixinStr_SCHAR_MIN);
        }
    }




    static if(!is(typeof(SHRT_MIN))) {
        private enum enumMixinStr_SHRT_MIN = `enum SHRT_MIN = ( - 0x7fff - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_SHRT_MIN); }))) {
            mixin(enumMixinStr_SHRT_MIN);
        }
    }




    static if(!is(typeof(INT_MIN))) {
        private enum enumMixinStr_INT_MIN = `enum INT_MIN = ( - 0x7fffffff - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_INT_MIN); }))) {
            mixin(enumMixinStr_INT_MIN);
        }
    }




    static if(!is(typeof(LONG_MIN))) {
        private enum enumMixinStr_LONG_MIN = `enum LONG_MIN = ( - 0x7fffffffffffffffL - 1L );`;
        static if(is(typeof({ mixin(enumMixinStr_LONG_MIN); }))) {
            mixin(enumMixinStr_LONG_MIN);
        }
    }




    static if(!is(typeof(UCHAR_MAX))) {
        private enum enumMixinStr_UCHAR_MAX = `enum UCHAR_MAX = ( 0x7f * 2 + 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_UCHAR_MAX); }))) {
            mixin(enumMixinStr_UCHAR_MAX);
        }
    }




    static if(!is(typeof(USHRT_MAX))) {
        private enum enumMixinStr_USHRT_MAX = `enum USHRT_MAX = ( 0x7fff * 2 + 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_USHRT_MAX); }))) {
            mixin(enumMixinStr_USHRT_MAX);
        }
    }




    static if(!is(typeof(UINT_MAX))) {
        private enum enumMixinStr_UINT_MAX = `enum UINT_MAX = ( 0x7fffffff * 2U + 1U );`;
        static if(is(typeof({ mixin(enumMixinStr_UINT_MAX); }))) {
            mixin(enumMixinStr_UINT_MAX);
        }
    }




    static if(!is(typeof(ULONG_MAX))) {
        private enum enumMixinStr_ULONG_MAX = `enum ULONG_MAX = ( 0x7fffffffffffffffL * 2UL + 1UL );`;
        static if(is(typeof({ mixin(enumMixinStr_ULONG_MAX); }))) {
            mixin(enumMixinStr_ULONG_MAX);
        }
    }




    static if(!is(typeof(CHAR_BIT))) {
        private enum enumMixinStr_CHAR_BIT = `enum CHAR_BIT = 8;`;
        static if(is(typeof({ mixin(enumMixinStr_CHAR_BIT); }))) {
            mixin(enumMixinStr_CHAR_BIT);
        }
    }




    static if(!is(typeof(CHAR_MIN))) {
        private enum enumMixinStr_CHAR_MIN = `enum CHAR_MIN = ( - 0x7f - 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_CHAR_MIN); }))) {
            mixin(enumMixinStr_CHAR_MIN);
        }
    }




    static if(!is(typeof(CHAR_MAX))) {
        private enum enumMixinStr_CHAR_MAX = `enum CHAR_MAX = 0x7f;`;
        static if(is(typeof({ mixin(enumMixinStr_CHAR_MAX); }))) {
            mixin(enumMixinStr_CHAR_MAX);
        }
    }
    static if(!is(typeof(__GNUC_VA_LIST))) {
        private enum enumMixinStr___GNUC_VA_LIST = `enum __GNUC_VA_LIST = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___GNUC_VA_LIST); }))) {
            mixin(enumMixinStr___GNUC_VA_LIST);
        }
    }
    static if(!is(typeof(NULL))) {
        private enum enumMixinStr_NULL = `enum NULL = ( cast( void * ) 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_NULL); }))) {
            mixin(enumMixinStr_NULL);
        }
    }





}


struct __va_list_tag;
import std.string : toStringz, fromStringz;
import std.exception : enforce;
import std.conv : octal;
import std.base64 : Base64;
enum GSS_Indefinite = cast(OM_uint32) 0xffffffffUL;





enum GSS_CallingErrorOffset = 24;
enum GSS_RoutineErrorOffset = 16;
enum GSS_SupplementaryOffset = 0;
enum GSS_CallingErrorMask = (cast (OM_uint32) octal!377UL);
enum GSS_RoutineErrorMask = (cast (OM_uint32) octal!377UL);
enum GSS_SupplementaryMask = (cast (OM_uint32) octal!177777UL);






auto GSS_callingError(uint x)
{
  return ((x) & (GSS_CallingErrorMask << GSS_CallingErrorOffset));
}

auto GSS_routineError(uint x)
{
  return ((x) & (GSS_RoutineErrorMask << GSS_RoutineErrorOffset));
}

auto GSS_supplementaryInfo(uint x)
{
 return ((x) & (GSS_SupplementaryMask << GSS_SupplementaryOffset));
}

auto GSS_error(uint x)
{
  return GSS_callingError(x) | GSS_routineError(x);
}

auto krb5_get_err_text(T,U)(T context,U code)
{
 return error_message(code);
}


enum AUTH_GSS_ERROR = -1;
enum AUTH_GSS_COMPLETE = 1;
enum AUTH_GSS_CONTINUE = 0;

enum GSS_AUTH_P_NONE = 1;
enum GSS_AUTH_P_INTEGRITY = 2 ;
enum GSS_AUTH_P_PRIVACY = 4;
enum GSS_ERRBUF_SIZE = 512;

struct gss_client_state
{
    gss_ctx_id_t context;
    gss_name_t server_name;
    long gss_flags;
    gss_cred_id_t client_creds;
    char* username;
    char* response;
    int responseConf;
    OM_uint32 maj_stat;
    OM_uint32 min_stat;
}

struct gss_server_state
{
    gss_ctx_id_t context;
    gss_name_t server_name;
    gss_name_t client_name;
    gss_cred_id_t server_creds;
    gss_cred_id_t client_creds;
    char* username;
    char* targetname;
    char* response;
    char* ccname;
    OM_uint32 maj_stat;
    OM_uint32 min_stat;
}




gss_client_state* new_gss_client_state() {
    gss_client_state *state;

    state = cast(gss_client_state *) malloc(gss_client_state.sizeof);

    return state;
}

gss_server_state* new_gss_server_state() {
    gss_server_state *state;

    state = cast(gss_server_state *) malloc(gss_server_state.sizeof);

    return state;
}

void free_gss_client_state(gss_client_state *state) {
    free(state);
}

void free_gss_server_state(gss_server_state *state) {
    free(state);
}

int authenticate_gss_client_init(string service, string principal, long gss_flags,
    gss_server_state* delegatestate, gss_client_state* state
)
{
    gss_buffer_desc name_token = { 0 , null };
    gss_buffer_desc principal_token = { 0 , null };
    int ret = AUTH_GSS_COMPLETE;

    state.server_name = ( cast( gss_name_t ) 0 );
    state.context = ( cast( gss_ctx_id_t ) 0 );
    state.gss_flags = gss_flags;
    state.client_creds = ( cast( gss_cred_id_t ) 0 );
    state.username = null;
    state.response = null;


    name_token.length = service.length;
    name_token.value = cast(void*) service.toStringz;

    state.maj_stat = gss_import_name(
        &state.min_stat, &name_token, gss_nt_service_name, &state.server_name
    );

    if (GSS_error(state.maj_stat)) {
        ret = AUTH_GSS_ERROR;
        goto end;
    }

    if (delegatestate && delegatestate.client_creds != ( cast( gss_cred_id_t ) 0 )) {
        state.client_creds = delegatestate.client_creds;
    }

    else if (principal.length > 0) {
        gss_name_t name;
        principal_token.length = principal.length;
        principal_token.value = cast(void*) principal.toStringz;

        state.maj_stat = gss_import_name(
            &state.min_stat, &principal_token, GSS_C_NT_USER_NAME, &name
        );
        if (GSS_error(state.maj_stat)) {
            ret = AUTH_GSS_ERROR;
         goto end;
        }

        state.maj_stat = gss_acquire_cred(
            &state.min_stat, name, GSS_Indefinite, ( cast( gss_OID_set ) 0 ),
            1, &state.client_creds, null, null
        );
        if (GSS_error(state.maj_stat)) {
            ret = AUTH_GSS_ERROR;
            goto end;
        }

        state.maj_stat = gss_release_name(&state.min_stat, &name);
        if (GSS_error(state.maj_stat)) {
            ret = AUTH_GSS_ERROR;
            goto end;
        }
    }

end:
    return ret;
}

int authenticate_gss_client_clean(gss_client_state *state)
{
    OM_uint32 maj_stat;
    OM_uint32 min_stat;
    int ret = AUTH_GSS_COMPLETE;

    if (state.context != ( cast( gss_ctx_id_t ) 0 )) {
        maj_stat = gss_delete_sec_context(
            &min_stat, &state.context, ( cast( gss_buffer_t ) 0 )
        );
    }
    if (state.server_name != ( cast( gss_name_t ) 0 )) {
        maj_stat = gss_release_name(&min_stat, &state.server_name);
    }
    if (
        state.client_creds != ( cast( gss_cred_id_t ) 0 ) &&
        ! (state.gss_flags & 1)
    ) {
        maj_stat = gss_release_cred(&min_stat, &state.client_creds);
    }
    if (state.username != null) {
        free(state.username);
        state.username = null;
    }
    if (state.response != null) {
        free(state.response);
        state.response = null;
    }

    return ret;
}

int authenticate_gss_client_step(gss_client_state* state, string challenge)
{
    gss_buffer_desc input_token = { 0 , null };
    gss_buffer_desc output_token = { 0 , null };
    int ret = AUTH_GSS_CONTINUE;


    if (state.response != null) {
        free(state.response);
        state.response = null;
    }


    if (challenge.length > 0)
 {
        auto encoded = Base64.decode(challenge).idup;
        input_token.value = cast(void*) encoded.ptr;
        input_token.length = encoded.length;
    }


    state.maj_stat = gss_init_sec_context(
        &state.min_stat,
        state.client_creds,
        &state.context,
        state.server_name,
        ( cast( gss_OID ) 0 ),
        cast(OM_uint32)state.gss_flags,
        0,
        ( cast( gss_channel_bindings_t ) 0 ),
        &input_token,
        null,
        &output_token,
        null,
        null
    );

    if ((state.maj_stat != 0) && (state.maj_stat != ( 1 << ( 0 + 0 ) ))) {
        ret = AUTH_GSS_ERROR;
        goto end;
    }

    ret = (state.maj_stat == 0) ? AUTH_GSS_COMPLETE : AUTH_GSS_CONTINUE;

    if (output_token.length) {
        state.response = cast(char*)((cast(string)(Base64.encode((cast(const(ubyte)*)output_token.value)[0..output_token.length]).idup)).toStringz);
        state.maj_stat = gss_release_buffer(&state.min_stat, &output_token);
    }


    if (ret == AUTH_GSS_COMPLETE) {
        gss_name_t gssuser = ( cast( gss_name_t ) 0 );
        state.maj_stat = gss_inquire_context(&state.min_stat, state.context, &gssuser, null, null, null, null, null, null);
        if (GSS_error(state.maj_stat)) {
            ret = AUTH_GSS_ERROR;
            goto end;
        }

        gss_buffer_desc name_token;
        name_token.length = 0;
        state.maj_stat = gss_display_name(&state.min_stat, gssuser, &name_token, null);
        if (GSS_error(state.maj_stat)) {
            if (name_token.value)
                gss_release_buffer(&state.min_stat, &name_token);
            gss_release_name(&state.min_stat, &gssuser);

            ret = AUTH_GSS_ERROR;
            goto end;
        } else {
            state.username = cast(char *)malloc(name_token.length + 1);
            strncpy(state.username, cast(char*) name_token.value, name_token.length);
            state.username[name_token.length] = 0;
            gss_release_buffer(&state.min_stat, &name_token);
            gss_release_name(&state.min_stat, &gssuser);
        }
    }

end:
    if (output_token.value) {
        gss_release_buffer(&state.min_stat, &output_token);
    }
    if (input_token.value) {
        free(input_token.value);
    }
    return ret;
}

int authenticate_gss_server_init(string service, gss_server_state *state)
{
    gss_buffer_desc name_token = { 0 , null };
    int ret = AUTH_GSS_COMPLETE;

    state.context = ( cast( gss_ctx_id_t ) 0 );
    state.server_name = ( cast( gss_name_t ) 0 );
    state.client_name = ( cast( gss_name_t ) 0 );
    state.server_creds = ( cast( gss_cred_id_t ) 0 );
    state.client_creds = ( cast( gss_cred_id_t ) 0 );
    state.username = null;
    state.targetname = null;
    state.response = null;
    state.ccname = null;


    size_t service_len = service.length;
    if (service_len != 0) {

        name_token.length = service.length;
        name_token.value = cast(void*) service.toStringz;
        state.maj_stat = gss_import_name(
            &state.min_stat, &name_token, GSS_C_NT_HOSTBASED_SERVICE,
            &state.server_name
        );

        if (GSS_error(state.maj_stat)) {
            ret = AUTH_GSS_ERROR;
            goto end;
        }


        state.maj_stat = gss_acquire_cred(
            &state.min_stat, ( cast( gss_name_t ) 0 ), GSS_Indefinite, ( cast( gss_OID_set ) 0 ),
            0, &state.server_creds, null, null
        );

        if (GSS_error(state.maj_stat)) {
            ret = AUTH_GSS_ERROR;
            goto end;
        }
    }

end:
    return ret;
}

int authenticate_gss_server_clean(gss_server_state *state)
{
    int ret = AUTH_GSS_COMPLETE;

    if (state.context != ( cast( gss_ctx_id_t ) 0 )) {
        state.maj_stat = gss_delete_sec_context(
            &state.min_stat, &state.context, ( cast( gss_buffer_t ) 0 )
        );
    }
    if (state.server_name != ( cast( gss_name_t ) 0 )) {
        state.maj_stat = gss_release_name(&state.min_stat, &state.server_name);
    }
    if (state.client_name != ( cast( gss_name_t ) 0 )) {
        state.maj_stat = gss_release_name(&state.min_stat, &state.client_name);
    }
    if (state.server_creds != ( cast( gss_cred_id_t ) 0 )) {
        state.maj_stat = gss_release_cred(&state.min_stat, &state.server_creds);
    }
    if (state.client_creds != ( cast( gss_cred_id_t ) 0 )) {
        state.maj_stat = gss_release_cred(&state.min_stat, &state.client_creds);
    }
    if (state.username != null) {
        free(state.username);
        state.username = null;
    }
    if (state.targetname != null) {
        free(state.targetname);
        state.targetname = null;
    }
    if (state.response != null) {
        free(state.response);
        state.response = null;
    }
    if (state.ccname != null) {
        free(state.ccname);
        state.ccname = null;
    }

    return ret;
}

int authenticate_gss_server_step(gss_server_state *state, string challenge)
{
    gss_buffer_desc input_token = { 0 , null };
    gss_buffer_desc output_token = { 0 , null };
    int ret = AUTH_GSS_CONTINUE;


    if (state.response != null) {
        free(state.response);
        state.response = null;
    }


    if (challenge.length > 0)
 {
  auto decoded = Base64.decode(challenge);
        input_token.value = cast(char*) decoded.idup;
        input_token.length = decoded.length;
    } else
 {


        ret = AUTH_GSS_ERROR;
        goto end;
    }

    state.maj_stat = gss_accept_sec_context(
        &state.min_stat,
        &state.context,
        state.server_creds,
        &input_token,
        ( cast( gss_channel_bindings_t ) 0 ),
        &state.client_name,
        null,
        &output_token,
        null,
        null,
        &state.client_creds
    );

    if (GSS_error(state.maj_stat)) {
        ret = AUTH_GSS_ERROR;
        goto end;
    }


    if (output_token.length) {
  auto encoded = Base64.encode((cast(const(ubyte) *)output_token.value)[0..output_token.length]);
        state.response = cast(char*)encoded.idup;
        state.maj_stat = gss_release_buffer(&state.min_stat, &output_token);
    }


    state.maj_stat = gss_display_name(
        &state.min_stat, state.client_name, &output_token, null
    );
    if (GSS_error(state.maj_stat)) {
        ret = AUTH_GSS_ERROR;
        goto end;
    }
    state.username = cast(char *)malloc(output_token.length + 1);
    strncpy(state.username, cast(char*) output_token.value, output_token.length);
    state.username[output_token.length] = 0;


    if (state.server_creds == ( cast( gss_cred_id_t ) 0 )) {
        gss_name_t target_name = ( cast( gss_name_t ) 0 );
        state.maj_stat = gss_inquire_context(
            &state.min_stat, state.context, null, &target_name, null, null, null,
            null, null
        );
        if (GSS_error(state.maj_stat)) {
            ret = AUTH_GSS_ERROR;
            goto end;
        }
        state.maj_stat = gss_display_name(
            &state.min_stat, target_name, &output_token, null
        );
        if (GSS_error(state.maj_stat)) {
            ret = AUTH_GSS_ERROR;
            goto end;
        }
        state.targetname = cast(char *)malloc(output_token.length + 1);
        strncpy(
            state.targetname, cast(char*) output_token.value, output_token.length
        );
        state.targetname[output_token.length] = 0;
    }

    ret = AUTH_GSS_COMPLETE;

end:
    if (output_token.length) {
        gss_release_buffer(&state.min_stat, &output_token);
    }
    if (input_token.value) {
        free(input_token.value);
    }
    return ret;
}

void get_gss_error(OM_uint32 err_maj, char *buf_maj, OM_uint32 err_min, char *buf_min)
{
    OM_uint32 maj_stat, min_stat;
    OM_uint32 msg_ctx = 0;
    gss_buffer_desc status_string;

    do {
        maj_stat = gss_display_status(
            &min_stat,
            err_maj,
            1,
            ( cast( gss_OID ) 0 ),
            &msg_ctx,
            &status_string
        );
        if (GSS_error(maj_stat)) {
            break;
        }
        strncpy(buf_maj, cast(char*) status_string.value, GSS_ERRBUF_SIZE);
        gss_release_buffer(&min_stat, &status_string);

        maj_stat = gss_display_status(
            &min_stat,
            err_min,
            2,
            ( cast( gss_OID ) 0 ),
            &msg_ctx,
            &status_string
        );
        if (! GSS_error(maj_stat)) {
            strncpy(buf_min, cast(char*) status_string.value, GSS_ERRBUF_SIZE);
            gss_release_buffer(&min_stat, &status_string);
        }
    } while (!GSS_error(maj_stat) && msg_ctx != 0);
}
