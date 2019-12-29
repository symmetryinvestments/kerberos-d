


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
    alias ssize_t = c_long;
    alias id_t = uint;
    alias pid_t = int;
    alias off_t = c_long;
    alias uid_t = uint;
    alias nlink_t = c_ulong;
    alias mode_t = uint;
    alias gid_t = uint;
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
    pragma(mangle, "alloca") void* alloca_(c_ulong) @nogc nothrow;
    static ushort __bswap_16(ushort) @nogc nothrow;
    char* strrchr(const(char)*, int) @nogc nothrow;
    static uint __bswap_32(uint) @nogc nothrow;
    static c_ulong __bswap_64(c_ulong) @nogc nothrow;
    char* strchr(const(char)*, int) @nogc nothrow;
    char* strndup(const(char)*, c_ulong) @nogc nothrow;
    char* strdup(const(char)*) @nogc nothrow;
    c_ulong strxfrm_l(char*, const(char)*, c_ulong, __locale_struct*) @nogc nothrow;
    int strcoll_l(const(char)*, const(char)*, __locale_struct*) @nogc nothrow;
    alias _Float32 = float;
    alias _Float64 = double;
    c_ulong strxfrm(char*, const(char)*, c_ulong) @nogc nothrow;
    alias _Float32x = double;
    int strcoll(const(char)*, const(char)*) @nogc nothrow;
    alias _Float64x = real;
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
    int mbtowc(int*, const(char)*, c_ulong) @nogc nothrow;
    int mblen(const(char)*, c_ulong) @nogc nothrow;
    int qfcvt_r(real, int, int*, int*, char*, c_ulong) @nogc nothrow;
    int qecvt_r(real, int, int*, int*, char*, c_ulong) @nogc nothrow;
    int fcvt_r(double, int, int*, int*, char*, c_ulong) @nogc nothrow;
    int ecvt_r(double, int, int*, int*, char*, c_ulong) @nogc nothrow;
    char* qgcvt(real, int, char*) @nogc nothrow;
    char* qfcvt(real, int, int*, int*) @nogc nothrow;
    char* qecvt(real, int, int*, int*) @nogc nothrow;
    char* gcvt(double, int, char*) @nogc nothrow;
    char* fcvt(double, int, int*, int*) @nogc nothrow;
    char* ecvt(double, int, int*, int*) @nogc nothrow;
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
    lldiv_t lldiv(long, long) @nogc nothrow;
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
    ldiv_t ldiv(c_long, c_long) @nogc nothrow;
    div_t div(int, int) @nogc nothrow;
    alias int8_t = byte;
    alias int16_t = short;
    alias int32_t = int;
    alias int64_t = c_long;
    alias uint8_t = ubyte;
    alias uint16_t = ushort;
    alias uint32_t = uint;
    alias uint64_t = ulong;
    long llabs(long) @nogc nothrow;
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
    struct __pthread_cond_s
    {
        static union _Anonymous_0
        {
            ulong __wseq;
            static struct _Anonymous_1
            {
                uint __low;
                uint __high;
            }
            _Anonymous_1 __wseq32;
        }
        _Anonymous_0 _anonymous_2;
        auto __wseq() @property @nogc pure nothrow { return _anonymous_2.__wseq; }
        void __wseq(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_2.__wseq = val; }
        auto __wseq32() @property @nogc pure nothrow { return _anonymous_2.__wseq32; }
        void __wseq32(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_2.__wseq32 = val; }
        static union _Anonymous_3
        {
            ulong __g1_start;
            static struct _Anonymous_4
            {
                uint __low;
                uint __high;
            }
            _Anonymous_4 __g1_start32;
        }
        _Anonymous_3 _anonymous_5;
        auto __g1_start() @property @nogc pure nothrow { return _anonymous_5.__g1_start; }
        void __g1_start(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_5.__g1_start = val; }
        auto __g1_start32() @property @nogc pure nothrow { return _anonymous_5.__g1_start32; }
        void __g1_start32(_T_)(auto ref _T_ val) @property @nogc pure nothrow { _anonymous_5.__g1_start32 = val; }
        uint[2] __g_refs;
        uint[2] __g_size;
        uint __g1_orig_size;
        uint __wrefs;
        uint[2] __g_signals;
    }
    c_long labs(c_long) @nogc nothrow;
    int abs(int) @nogc nothrow;
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
    void qsort(void*, c_ulong, c_ulong, int function(const(void)*, const(void)*)) @nogc nothrow;
    void* bsearch(const(void)*, const(void)*, c_ulong, c_ulong, int function(const(void)*, const(void)*)) @nogc nothrow;
    alias __compar_fn_t = int function(const(void)*, const(void)*);
    char* realpath(const(char)*, char*) @nogc nothrow;
    int system(const(char)*) @nogc nothrow;
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
    char* mkdtemp(char*) @nogc nothrow;
    struct __locale_struct
    {
        __locale_data*[13] __locales;
        const(ushort)* __ctype_b;
        const(int)* __ctype_tolower;
        const(int)* __ctype_toupper;
        const(char)*[13] __names;
    }
    alias __locale_t = __locale_struct*;
    struct __sigset_t
    {
        c_ulong[16] __val;
    }
    alias clock_t = c_long;
    int mkstemps(char*, int) @nogc nothrow;
    alias clockid_t = int;
    alias locale_t = __locale_struct*;
    alias sigset_t = __sigset_t;
    struct timespec
    {
        c_long tv_sec;
        c_long tv_nsec;
    }
    int mkstemp(char*) @nogc nothrow;
    struct timeval
    {
        c_long tv_sec;
        c_long tv_usec;
    }
    alias time_t = c_long;
    alias timer_t = void*;
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
    static ushort __uint16_identity(ushort) @nogc nothrow;
    static uint __uint32_identity(uint) @nogc nothrow;
    static c_ulong __uint64_identity(c_ulong) @nogc nothrow;
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
    int lrand48_r(drand48_data*, c_long*) @nogc nothrow;
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
    void lcong48(ushort*) @nogc nothrow;
    ushort* seed48(ushort*) @nogc nothrow;
    void srand48(c_long) @nogc nothrow;
    c_long jrand48(ushort*) @nogc nothrow;
    c_long mrand48() @nogc nothrow;
    c_long nrand48(ushort*) @nogc nothrow;
    c_long lrand48() @nogc nothrow;
    double erand48(ushort*) @nogc nothrow;
    double drand48() @nogc nothrow;
    int rand_r(uint*) @nogc nothrow;
    void srand(uint) @nogc nothrow;
    int rand() @nogc nothrow;
    int setstate_r(char*, random_data*) @nogc nothrow;
    int initstate_r(uint, char*, c_ulong, random_data*) @nogc nothrow;
    int srandom_r(uint, random_data*) @nogc nothrow;
    int random_r(random_data*, int*) @nogc nothrow;
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
    struct _profile_t;
    alias krb5_octet = ubyte;
    alias krb5_int16 = short;
    alias krb5_ui_2 = ushort;
    alias krb5_int32 = int;
    alias krb5_ui_4 = uint;
    char* setstate(char*) @nogc nothrow;
    char* initstate(uint, char*, c_ulong) @nogc nothrow;
    void srandom(uint) @nogc nothrow;
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
    c_long random() @nogc nothrow;
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
    c_long a64l(const(char)*) @nogc nothrow;
    char* l64a(c_long) @nogc nothrow;
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
    ulong strtoull(const(char)*, char**, int) @nogc nothrow;
    long strtoll(const(char)*, char**, int) @nogc nothrow;
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
    ulong strtouq(const(char)*, char**, int) @nogc nothrow;
    long strtoq(const(char)*, char**, int) @nogc nothrow;
    c_ulong strtoul(const(char)*, char**, int) @nogc nothrow;
    c_long strtol(const(char)*, char**, int) @nogc nothrow;
    real strtold(const(char)*, char**) @nogc nothrow;
    float strtof(const(char)*, char**) @nogc nothrow;
    double strtod(const(char)*, char**) @nogc nothrow;
    long atoll(const(char)*) @nogc nothrow;
    enum _Anonymous_6
    {
        KRB5_C_RANDSOURCE_OLDAPI = 0,
        KRB5_C_RANDSOURCE_OSRAND = 1,
        KRB5_C_RANDSOURCE_TRUSTEDPARTY = 2,
        KRB5_C_RANDSOURCE_TIMING = 3,
        KRB5_C_RANDSOURCE_EXTERNAL_PROTOCOL = 4,
        KRB5_C_RANDSOURCE_MAX = 5,
    }
    enum KRB5_C_RANDSOURCE_OLDAPI = _Anonymous_6.KRB5_C_RANDSOURCE_OLDAPI;
    enum KRB5_C_RANDSOURCE_OSRAND = _Anonymous_6.KRB5_C_RANDSOURCE_OSRAND;
    enum KRB5_C_RANDSOURCE_TRUSTEDPARTY = _Anonymous_6.KRB5_C_RANDSOURCE_TRUSTEDPARTY;
    enum KRB5_C_RANDSOURCE_TIMING = _Anonymous_6.KRB5_C_RANDSOURCE_TIMING;
    enum KRB5_C_RANDSOURCE_EXTERNAL_PROTOCOL = _Anonymous_6.KRB5_C_RANDSOURCE_EXTERNAL_PROTOCOL;
    enum KRB5_C_RANDSOURCE_MAX = _Anonymous_6.KRB5_C_RANDSOURCE_MAX;
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
    alias uintmax_t = c_ulong;
    alias intmax_t = c_long;
    alias uintptr_t = c_ulong;
    alias intptr_t = c_long;
    uint krb5_c_valid_enctype(int) @nogc nothrow;
    uint krb5_c_valid_cksumtype(int) @nogc nothrow;
    uint krb5_c_is_coll_proof_cksum(int) @nogc nothrow;
    uint krb5_c_is_keyed_cksum(int) @nogc nothrow;
    alias uint_fast64_t = c_ulong;
    alias uint_fast32_t = c_ulong;
    alias uint_fast16_t = c_ulong;
    alias uint_fast8_t = ubyte;
    alias int_fast64_t = c_long;
    alias int_fast32_t = c_long;
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
    void initialize_k524_error_table_r(et_list**) @nogc nothrow;
    void initialize_k524_error_table() @nogc nothrow;
    extern __gshared const(error_table) et_k524_error_table;
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
    int krb5_pac_parse(_krb5_context*, const(void)*, c_ulong, krb5_pac_data**) @nogc nothrow;
    int krb5_pac_init(_krb5_context*, krb5_pac_data**) @nogc nothrow;
    int krb5_pac_get_types(_krb5_context*, krb5_pac_data*, c_ulong*, uint**) @nogc nothrow;
    int krb5_pac_get_buffer(_krb5_context*, krb5_pac_data*, uint, _krb5_data*) @nogc nothrow;
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
    int krb5_get_renewed_creds(_krb5_context*, _krb5_creds*, krb5_principal_data*, _krb5_ccache*, const(char)*) @nogc nothrow;
    int krb5_get_validated_creds(_krb5_context*, _krb5_creds*, krb5_principal_data*, _krb5_ccache*, const(char)*) @nogc nothrow;
    int krb5_verify_init_creds(_krb5_context*, _krb5_creds*, krb5_principal_data*, _krb5_kt*, _krb5_ccache**, _krb5_verify_init_creds_opt*) @nogc nothrow;
    struct krb5_replay_data
    {
        int timestamp;
        int usec;
        uint seq;
    }
    void krb5_verify_init_creds_opt_set_ap_req_nofail(_krb5_verify_init_creds_opt*, int) @nogc nothrow;
    void krb5_verify_init_creds_opt_init(_krb5_verify_init_creds_opt*) @nogc nothrow;
    struct _krb5_verify_init_creds_opt
    {
        int flags;
        int ap_req_nofail;
    }
    alias krb5_mk_req_checksum_func = int function(_krb5_context*, _krb5_auth_context*, void*, _krb5_data**);
    alias krb5_cc_cursor = void*;
    struct _krb5_ccache;
    alias krb5_ccache = _krb5_ccache*;
    struct _krb5_cc_ops;
    alias krb5_cc_ops = _krb5_cc_ops;
    struct _krb5_cccol_cursor;
    alias krb5_cccol_cursor = _krb5_cccol_cursor*;
    alias krb5_verify_init_creds_opt = _krb5_verify_init_creds_opt;
    int krb5_get_init_creds_keytab(_krb5_context*, _krb5_creds*, krb5_principal_data*, _krb5_kt*, int, const(char)*, _krb5_get_init_creds_opt*) @nogc nothrow;
    int krb5_tkt_creds_get_times(_krb5_context*, _krb5_tkt_creds_context*, _krb5_ticket_times*) @nogc nothrow;
    int krb5_tkt_creds_step(_krb5_context*, _krb5_tkt_creds_context*, _krb5_data*, _krb5_data*, _krb5_data*, uint*) @nogc nothrow;
    void krb5_tkt_creds_free(_krb5_context*, _krb5_tkt_creds_context*) @nogc nothrow;
    int krb5_tkt_creds_get_creds(_krb5_context*, _krb5_tkt_creds_context*, _krb5_creds*) @nogc nothrow;
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
    int krb5_tkt_creds_get(_krb5_context*, _krb5_tkt_creds_context*) @nogc nothrow;
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
    int krb5_tkt_creds_init(_krb5_context*, _krb5_ccache*, _krb5_creds*, int, _krb5_tkt_creds_context**) @nogc nothrow;
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
    alias krb5_tkt_creds_context = _krb5_tkt_creds_context*;
    struct _krb5_tkt_creds_context;
    int krb5_init_creds_get_times(_krb5_context*, _krb5_init_creds_context*, _krb5_ticket_times*) @nogc nothrow;
    int krb5_init_creds_set_service(_krb5_context*, _krb5_init_creds_context*, const(char)*) @nogc nothrow;
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
    int krb5_init_creds_set_password(_krb5_context*, _krb5_init_creds_context*, const(char)*) @nogc nothrow;
    int krb5_init_creds_step(_krb5_context*, _krb5_init_creds_context*, _krb5_data*, _krb5_data*, _krb5_data*, uint*) @nogc nothrow;
    int krb5_parse_name_flags(_krb5_context*, const(char)*, int, krb5_principal_data**) @nogc nothrow;
    int krb5_unparse_name(_krb5_context*, const(krb5_principal_data)*, char**) @nogc nothrow;
    int krb5_unparse_name_ext(_krb5_context*, const(krb5_principal_data)*, char**, uint*) @nogc nothrow;
    int krb5_init_creds_set_keytab(_krb5_context*, _krb5_init_creds_context*, _krb5_kt*) @nogc nothrow;
    int krb5_init_creds_init(_krb5_context*, krb5_principal_data*, int function(_krb5_context*, void*, const(char)*, const(char)*, int, _krb5_prompt[0]), void*, int, _krb5_get_init_creds_opt*, _krb5_init_creds_context**) @nogc nothrow;
    int krb5_unparse_name_flags(_krb5_context*, const(krb5_principal_data)*, int, char**) @nogc nothrow;
    int krb5_unparse_name_flags_ext(_krb5_context*, const(krb5_principal_data)*, int, char**, uint*) @nogc nothrow;
    int krb5_set_principal_realm(_krb5_context*, krb5_principal_data*, const(char)*) @nogc nothrow;
    uint krb5_address_search(_krb5_context*, const(_krb5_address)*, _krb5_address**) @nogc nothrow;
    uint krb5_address_compare(_krb5_context*, const(_krb5_address)*, const(_krb5_address)*) @nogc nothrow;
    int krb5_address_order(_krb5_context*, const(_krb5_address)*, const(_krb5_address)*) @nogc nothrow;
    uint krb5_realm_compare(_krb5_context*, const(krb5_principal_data)*, const(krb5_principal_data)*) @nogc nothrow;
    uint krb5_principal_compare(_krb5_context*, const(krb5_principal_data)*, const(krb5_principal_data)*) @nogc nothrow;
    uint krb5_principal_compare_any_realm(_krb5_context*, const(krb5_principal_data)*, const(krb5_principal_data)*) @nogc nothrow;
    int krb5_init_creds_get_error(_krb5_context*, _krb5_init_creds_context*, _krb5_error**) @nogc nothrow;
    int krb5_init_creds_get_creds(_krb5_context*, _krb5_init_creds_context*, _krb5_creds*) @nogc nothrow;
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
    int krb5_init_creds_get(_krb5_context*, _krb5_init_creds_context*) @nogc nothrow;
    void krb5_init_creds_free(_krb5_context*, _krb5_init_creds_context*) @nogc nothrow;
    alias krb5_init_creds_context = _krb5_init_creds_context*;
    alias krb5_prompt = _krb5_prompt;
    struct _krb5_prompt
    {
        char* prompt;
        int hidden;
        _krb5_data* reply;
    }
    alias krb5_prompter_fct = int function(_krb5_context*, void*, const(char)*, const(char)*, int, _krb5_prompt*);
    int krb5_prompter_posix(_krb5_context*, void*, const(char)*, const(char)*, int, _krb5_prompt*) @nogc nothrow;
    struct _krb5_init_creds_context;
    int krb5_get_etype_info(_krb5_context*, krb5_principal_data*, _krb5_get_init_creds_opt*, int*, _krb5_data*, _krb5_data*) @nogc nothrow;
    int krb5_get_init_creds_password(_krb5_context*, _krb5_creds*, krb5_principal_data*, const(char)*, int function(_krb5_context*, void*, const(char)*, const(char)*, int, _krb5_prompt[0]), void*, int, const(char)*, _krb5_get_init_creds_opt*) @nogc nothrow;
    int krb5_get_init_creds_opt_set_responder(_krb5_context*, _krb5_get_init_creds_opt*, int function(_krb5_context*, void*, krb5_responder_context_st*), void*) @nogc nothrow;
    int krb5_get_init_creds_opt_set_expire_callback(_krb5_context*, _krb5_get_init_creds_opt*, void function(_krb5_context*, void*, int, int, uint), void*) @nogc nothrow;
    alias krb5_expire_callback_func = void function(_krb5_context*, void*, int, int, uint);
    int krb5_get_init_creds_opt_get_fast_flags(_krb5_context*, _krb5_get_init_creds_opt*, int*) @nogc nothrow;
    alias krb5_responder_context = krb5_responder_context_st*;
    struct krb5_responder_context_st;
    const(const(char)*)* krb5_responder_list_questions(_krb5_context*, krb5_responder_context_st*) @nogc nothrow;
    const(char)* krb5_responder_get_challenge(_krb5_context*, krb5_responder_context_st*, const(char)*) @nogc nothrow;
    int krb5_responder_set_answer(_krb5_context*, krb5_responder_context_st*, const(char)*, const(char)*) @nogc nothrow;
    alias krb5_responder_fn = int function(_krb5_context*, void*, krb5_responder_context_st*);
    alias krb5_responder_otp_tokeninfo = _krb5_responder_otp_tokeninfo;
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
    alias krb5_responder_otp_challenge = _krb5_responder_otp_challenge;
    struct _krb5_responder_otp_challenge
    {
        char* service;
        _krb5_responder_otp_tokeninfo** tokeninfo;
    }
    int krb5_responder_otp_get_challenge(_krb5_context*, krb5_responder_context_st*, _krb5_responder_otp_challenge**) @nogc nothrow;
    int krb5_responder_otp_set_answer(_krb5_context*, krb5_responder_context_st*, c_ulong, const(char)*, const(char)*) @nogc nothrow;
    void krb5_responder_otp_challenge_free(_krb5_context*, krb5_responder_context_st*, _krb5_responder_otp_challenge*) @nogc nothrow;
    alias krb5_responder_pkinit_identity = _krb5_responder_pkinit_identity;
    struct _krb5_responder_pkinit_identity
    {
        char* identity;
        int token_flags;
    }
    alias krb5_responder_pkinit_challenge = _krb5_responder_pkinit_challenge;
    struct _krb5_responder_pkinit_challenge
    {
        _krb5_responder_pkinit_identity** identities;
    }
    int krb5_responder_pkinit_get_challenge(_krb5_context*, krb5_responder_context_st*, _krb5_responder_pkinit_challenge**) @nogc nothrow;
    int krb5_responder_pkinit_set_answer(_krb5_context*, krb5_responder_context_st*, const(char)*, const(char)*) @nogc nothrow;
    void krb5_responder_pkinit_challenge_free(_krb5_context*, krb5_responder_context_st*, _krb5_responder_pkinit_challenge*) @nogc nothrow;
    alias krb5_get_init_creds_opt = _krb5_get_init_creds_opt;
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
    int krb5_get_init_creds_opt_set_fast_flags(_krb5_context*, _krb5_get_init_creds_opt*, int) @nogc nothrow;
    int krb5_get_init_creds_opt_set_pac_request(_krb5_context*, _krb5_get_init_creds_opt*, uint) @nogc nothrow;
    int krb5_get_init_creds_opt_set_out_ccache(_krb5_context*, _krb5_get_init_creds_opt*, _krb5_ccache*) @nogc nothrow;
    int krb5_get_init_creds_opt_set_in_ccache(_krb5_context*, _krb5_get_init_creds_opt*, _krb5_ccache*) @nogc nothrow;
    int krb5_get_init_creds_opt_set_fast_ccache(_krb5_context*, _krb5_get_init_creds_opt*, _krb5_ccache*) @nogc nothrow;
    int krb5_get_init_creds_opt_alloc(_krb5_context*, _krb5_get_init_creds_opt**) @nogc nothrow;
    void krb5_get_init_creds_opt_free(_krb5_context*, _krb5_get_init_creds_opt*) @nogc nothrow;
    void krb5_get_init_creds_opt_init(_krb5_get_init_creds_opt*) @nogc nothrow;
    void krb5_get_init_creds_opt_set_tkt_life(_krb5_get_init_creds_opt*, int) @nogc nothrow;
    void krb5_get_init_creds_opt_set_renew_life(_krb5_get_init_creds_opt*, int) @nogc nothrow;
    void krb5_get_init_creds_opt_set_forwardable(_krb5_get_init_creds_opt*, int) @nogc nothrow;
    void krb5_get_init_creds_opt_set_proxiable(_krb5_get_init_creds_opt*, int) @nogc nothrow;
    void krb5_get_init_creds_opt_set_canonicalize(_krb5_get_init_creds_opt*, int) @nogc nothrow;
    void krb5_get_init_creds_opt_set_anonymous(_krb5_get_init_creds_opt*, int) @nogc nothrow;
    void krb5_get_init_creds_opt_set_etype_list(_krb5_get_init_creds_opt*, int*, int) @nogc nothrow;
    void krb5_get_init_creds_opt_set_address_list(_krb5_get_init_creds_opt*, _krb5_address**) @nogc nothrow;
    void krb5_get_init_creds_opt_set_preauth_list(_krb5_get_init_creds_opt*, int*, int) @nogc nothrow;
    void krb5_get_init_creds_opt_set_salt(_krb5_get_init_creds_opt*, _krb5_data*) @nogc nothrow;
    void krb5_get_init_creds_opt_set_change_password_prompt(_krb5_get_init_creds_opt*, int) @nogc nothrow;
    alias krb5_gic_opt_pa_data = _krb5_gic_opt_pa_data;
    struct _krb5_gic_opt_pa_data
    {
        char* attr;
        char* value;
    }
    int krb5_get_init_creds_opt_set_pa(_krb5_context*, _krb5_get_init_creds_opt*, const(char)*, const(char)*) @nogc nothrow;
    int krb5_get_init_creds_opt_set_fast_ccache_name(_krb5_context*, _krb5_get_init_creds_opt*, const(char)*) @nogc nothrow;



    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_ANONYMOUS))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_ANONYMOUS = `enum KRB5_GET_INIT_CREDS_OPT_ANONYMOUS = 0x0400;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_ANONYMOUS); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_ANONYMOUS);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_CANONICALIZE))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_CANONICALIZE = `enum KRB5_GET_INIT_CREDS_OPT_CANONICALIZE = 0x0200;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_CANONICALIZE); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_CANONICALIZE);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_CHG_PWD_PRMPT))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_CHG_PWD_PRMPT = `enum KRB5_GET_INIT_CREDS_OPT_CHG_PWD_PRMPT = 0x0100;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_CHG_PWD_PRMPT); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_CHG_PWD_PRMPT);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_SALT))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_SALT = `enum KRB5_GET_INIT_CREDS_OPT_SALT = 0x0080;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_SALT); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_SALT);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_PREAUTH_LIST))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_PREAUTH_LIST = `enum KRB5_GET_INIT_CREDS_OPT_PREAUTH_LIST = 0x0040;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_PREAUTH_LIST); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_PREAUTH_LIST);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_ADDRESS_LIST))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_ADDRESS_LIST = `enum KRB5_GET_INIT_CREDS_OPT_ADDRESS_LIST = 0x0020;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_ADDRESS_LIST); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_ADDRESS_LIST);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_ETYPE_LIST))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_ETYPE_LIST = `enum KRB5_GET_INIT_CREDS_OPT_ETYPE_LIST = 0x0010;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_ETYPE_LIST); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_ETYPE_LIST);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_PROXIABLE))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_PROXIABLE = `enum KRB5_GET_INIT_CREDS_OPT_PROXIABLE = 0x0008;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_PROXIABLE); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_PROXIABLE);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_FORWARDABLE))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_FORWARDABLE = `enum KRB5_GET_INIT_CREDS_OPT_FORWARDABLE = 0x0004;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_FORWARDABLE); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_FORWARDABLE);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_RENEW_LIFE))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_RENEW_LIFE = `enum KRB5_GET_INIT_CREDS_OPT_RENEW_LIFE = 0x0002;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_RENEW_LIFE); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_RENEW_LIFE);
        }
    }




    static if(!is(typeof(KRB5_GET_INIT_CREDS_OPT_TKT_LIFE))) {
        private enum enumMixinStr_KRB5_GET_INIT_CREDS_OPT_TKT_LIFE = `enum KRB5_GET_INIT_CREDS_OPT_TKT_LIFE = 0x0001;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_TKT_LIFE); }))) {
            mixin(enumMixinStr_KRB5_GET_INIT_CREDS_OPT_TKT_LIFE);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_LOCKED))) {
        private enum enumMixinStr_KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_LOCKED = `enum KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_LOCKED = ( 1 << 2 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_LOCKED); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_LOCKED);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_FINAL_TRY))) {
        private enum enumMixinStr_KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_FINAL_TRY = `enum KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_FINAL_TRY = ( 1 << 1 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_FINAL_TRY); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_FINAL_TRY);
        }
    }




    static if(!is(typeof(KRB5_FAST_REQUIRED))) {
        private enum enumMixinStr_KRB5_FAST_REQUIRED = `enum KRB5_FAST_REQUIRED = 0x0001;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_FAST_REQUIRED); }))) {
            mixin(enumMixinStr_KRB5_FAST_REQUIRED);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_COUNT_LOW))) {
        private enum enumMixinStr_KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_COUNT_LOW = `enum KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_COUNT_LOW = ( 1 << 0 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_COUNT_LOW); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_PKINIT_FLAGS_TOKEN_USER_PIN_COUNT_LOW);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_QUESTION_PKINIT))) {
        private enum enumMixinStr_KRB5_RESPONDER_QUESTION_PKINIT = `enum KRB5_RESPONDER_QUESTION_PKINIT = "pkinit";`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_QUESTION_PKINIT); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_QUESTION_PKINIT);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_OTP_FLAGS_SEPARATE_PIN))) {
        private enum enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_SEPARATE_PIN = `enum KRB5_RESPONDER_OTP_FLAGS_SEPARATE_PIN = 0x0008;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_SEPARATE_PIN); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_SEPARATE_PIN);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_OTP_FLAGS_NEXTOTP))) {
        private enum enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_NEXTOTP = `enum KRB5_RESPONDER_OTP_FLAGS_NEXTOTP = 0x0004;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_NEXTOTP); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_NEXTOTP);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_OTP_FLAGS_COLLECT_PIN))) {
        private enum enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_COLLECT_PIN = `enum KRB5_RESPONDER_OTP_FLAGS_COLLECT_PIN = 0x0002;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_COLLECT_PIN); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_COLLECT_PIN);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_OTP_FLAGS_COLLECT_TOKEN))) {
        private enum enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_COLLECT_TOKEN = `enum KRB5_RESPONDER_OTP_FLAGS_COLLECT_TOKEN = 0x0001;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_COLLECT_TOKEN); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_OTP_FLAGS_COLLECT_TOKEN);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_OTP_FORMAT_ALPHANUMERIC))) {
        private enum enumMixinStr_KRB5_RESPONDER_OTP_FORMAT_ALPHANUMERIC = `enum KRB5_RESPONDER_OTP_FORMAT_ALPHANUMERIC = 2;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_OTP_FORMAT_ALPHANUMERIC); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_OTP_FORMAT_ALPHANUMERIC);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_OTP_FORMAT_HEXADECIMAL))) {
        private enum enumMixinStr_KRB5_RESPONDER_OTP_FORMAT_HEXADECIMAL = `enum KRB5_RESPONDER_OTP_FORMAT_HEXADECIMAL = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_OTP_FORMAT_HEXADECIMAL); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_OTP_FORMAT_HEXADECIMAL);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_OTP_FORMAT_DECIMAL))) {
        private enum enumMixinStr_KRB5_RESPONDER_OTP_FORMAT_DECIMAL = `enum KRB5_RESPONDER_OTP_FORMAT_DECIMAL = 0;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_OTP_FORMAT_DECIMAL); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_OTP_FORMAT_DECIMAL);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_QUESTION_OTP))) {
        private enum enumMixinStr_KRB5_RESPONDER_QUESTION_OTP = `enum KRB5_RESPONDER_QUESTION_OTP = "otp";`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_QUESTION_OTP); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_QUESTION_OTP);
        }
    }




    static if(!is(typeof(KRB5_RESPONDER_QUESTION_PASSWORD))) {
        private enum enumMixinStr_KRB5_RESPONDER_QUESTION_PASSWORD = `enum KRB5_RESPONDER_QUESTION_PASSWORD = "password";`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RESPONDER_QUESTION_PASSWORD); }))) {
            mixin(enumMixinStr_KRB5_RESPONDER_QUESTION_PASSWORD);
        }
    }




    static if(!is(typeof(KRB5_RECVAUTH_BADAUTHVERS))) {
        private enum enumMixinStr_KRB5_RECVAUTH_BADAUTHVERS = `enum KRB5_RECVAUTH_BADAUTHVERS = 0x0002;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_RECVAUTH_BADAUTHVERS); }))) {
            mixin(enumMixinStr_KRB5_RECVAUTH_BADAUTHVERS);
        }
    }




    static if(!is(typeof(KRB5_INIT_CREDS_STEP_FLAG_CONTINUE))) {
        private enum enumMixinStr_KRB5_INIT_CREDS_STEP_FLAG_CONTINUE = `enum KRB5_INIT_CREDS_STEP_FLAG_CONTINUE = 0x1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_INIT_CREDS_STEP_FLAG_CONTINUE); }))) {
            mixin(enumMixinStr_KRB5_INIT_CREDS_STEP_FLAG_CONTINUE);
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




    static if(!is(typeof(KRB5_TKT_CREDS_STEP_FLAG_CONTINUE))) {
        private enum enumMixinStr_KRB5_TKT_CREDS_STEP_FLAG_CONTINUE = `enum KRB5_TKT_CREDS_STEP_FLAG_CONTINUE = 0x1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TKT_CREDS_STEP_FLAG_CONTINUE); }))) {
            mixin(enumMixinStr_KRB5_TKT_CREDS_STEP_FLAG_CONTINUE);
        }
    }




    static if(!is(typeof(KRB5_TC_MATCH_SRV_NAMEONLY))) {
        private enum enumMixinStr_KRB5_TC_MATCH_SRV_NAMEONLY = `enum KRB5_TC_MATCH_SRV_NAMEONLY = 0x00000040;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TC_MATCH_SRV_NAMEONLY); }))) {
            mixin(enumMixinStr_KRB5_TC_MATCH_SRV_NAMEONLY);
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




    static if(!is(typeof(KRB5_VERIFY_INIT_CREDS_OPT_AP_REQ_NOFAIL))) {
        private enum enumMixinStr_KRB5_VERIFY_INIT_CREDS_OPT_AP_REQ_NOFAIL = `enum KRB5_VERIFY_INIT_CREDS_OPT_AP_REQ_NOFAIL = 0x0001;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_VERIFY_INIT_CREDS_OPT_AP_REQ_NOFAIL); }))) {
            mixin(enumMixinStr_KRB5_VERIFY_INIT_CREDS_OPT_AP_REQ_NOFAIL);
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




    static if(!is(typeof(krb5_const))) {
        private enum enumMixinStr_krb5_const = `enum krb5_const = const;`;
        static if(is(typeof({ mixin(enumMixinStr_krb5_const); }))) {
            mixin(enumMixinStr_krb5_const);
        }
    }




    static if(!is(typeof(KRB5_SAFE))) {
        private enum enumMixinStr_KRB5_SAFE = `enum KRB5_SAFE = ( cast( krb5_msgtype ) 20 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_SAFE); }))) {
            mixin(enumMixinStr_KRB5_SAFE);
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




    static if(!is(typeof(KRB5_TGS_REQ))) {
        private enum enumMixinStr_KRB5_TGS_REQ = `enum KRB5_TGS_REQ = ( cast( krb5_msgtype ) 12 );`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_TGS_REQ); }))) {
            mixin(enumMixinStr_KRB5_TGS_REQ);
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




    static if(!is(typeof(MSEC_VAL_MASK))) {
        private enum enumMixinStr_MSEC_VAL_MASK = `enum MSEC_VAL_MASK = 0x7fff;`;
        static if(is(typeof({ mixin(enumMixinStr_MSEC_VAL_MASK); }))) {
            mixin(enumMixinStr_MSEC_VAL_MASK);
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




    static if(!is(typeof(LR_TYPE_THIS_SERVER_ONLY))) {
        private enum enumMixinStr_LR_TYPE_THIS_SERVER_ONLY = `enum LR_TYPE_THIS_SERVER_ONLY = 0x8000;`;
        static if(is(typeof({ mixin(enumMixinStr_LR_TYPE_THIS_SERVER_ONLY); }))) {
            mixin(enumMixinStr_LR_TYPE_THIS_SERVER_ONLY);
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




    static if(!is(typeof(TKT_FLG_ANONYMOUS))) {
        private enum enumMixinStr_TKT_FLG_ANONYMOUS = `enum TKT_FLG_ANONYMOUS = 0x00008000;`;
        static if(is(typeof({ mixin(enumMixinStr_TKT_FLG_ANONYMOUS); }))) {
            mixin(enumMixinStr_TKT_FLG_ANONYMOUS);
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




    static if(!is(typeof(TKT_FLG_HW_AUTH))) {
        private enum enumMixinStr_TKT_FLG_HW_AUTH = `enum TKT_FLG_HW_AUTH = 0x00100000;`;
        static if(is(typeof({ mixin(enumMixinStr_TKT_FLG_HW_AUTH); }))) {
            mixin(enumMixinStr_TKT_FLG_HW_AUTH);
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




    static if(!is(typeof(TKT_FLG_INVALID))) {
        private enum enumMixinStr_TKT_FLG_INVALID = `enum TKT_FLG_INVALID = 0x01000000;`;
        static if(is(typeof({ mixin(enumMixinStr_TKT_FLG_INVALID); }))) {
            mixin(enumMixinStr_TKT_FLG_INVALID);
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






    static if(!is(typeof(TKT_FLG_PROXIABLE))) {
        private enum enumMixinStr_TKT_FLG_PROXIABLE = `enum TKT_FLG_PROXIABLE = 0x10000000;`;
        static if(is(typeof({ mixin(enumMixinStr_TKT_FLG_PROXIABLE); }))) {
            mixin(enumMixinStr_TKT_FLG_PROXIABLE);
        }
    }




    static if(!is(typeof(MB_LEN_MAX))) {
        private enum enumMixinStr_MB_LEN_MAX = `enum MB_LEN_MAX = 16;`;
        static if(is(typeof({ mixin(enumMixinStr_MB_LEN_MAX); }))) {
            mixin(enumMixinStr_MB_LEN_MAX);
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




    static if(!is(typeof(KRB5_KEYUSAGE_ENC_CHALLENGE_KDC))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_ENC_CHALLENGE_KDC = `enum KRB5_KEYUSAGE_ENC_CHALLENGE_KDC = 55;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_ENC_CHALLENGE_KDC); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_ENC_CHALLENGE_KDC);
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




    static if(!is(typeof(KRB5_KEYUSAGE_ENC_CHALLENGE_CLIENT))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_ENC_CHALLENGE_CLIENT = `enum KRB5_KEYUSAGE_ENC_CHALLENGE_CLIENT = 54;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_ENC_CHALLENGE_CLIENT); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_ENC_CHALLENGE_CLIENT);
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




    static if(!is(typeof(KRB5_KEYUSAGE_FAST_FINISHED))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_FAST_FINISHED = `enum KRB5_KEYUSAGE_FAST_FINISHED = 53;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_FAST_FINISHED); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_FAST_FINISHED);
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




    static if(!is(typeof(KRB5_KEYUSAGE_FAST_REP))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_FAST_REP = `enum KRB5_KEYUSAGE_FAST_REP = 52;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_FAST_REP); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_FAST_REP);
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




    static if(!is(typeof(KRB5_KEYUSAGE_FAST_ENC))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_FAST_ENC = `enum KRB5_KEYUSAGE_FAST_ENC = 51;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_FAST_ENC); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_FAST_ENC);
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




    static if(!is(typeof(KRB5_KEYUSAGE_FAST_REQ_CHKSUM))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_FAST_REQ_CHKSUM = `enum KRB5_KEYUSAGE_FAST_REQ_CHKSUM = 50;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_FAST_REQ_CHKSUM); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_FAST_REQ_CHKSUM);
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




    static if(!is(typeof(_STDLIB_H))) {
        private enum enumMixinStr__STDLIB_H = `enum _STDLIB_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STDLIB_H); }))) {
            mixin(enumMixinStr__STDLIB_H);
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




    static if(!is(typeof(__ldiv_t_defined))) {
        private enum enumMixinStr___ldiv_t_defined = `enum __ldiv_t_defined = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___ldiv_t_defined); }))) {
            mixin(enumMixinStr___ldiv_t_defined);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_KRB_ERROR_CKSUM))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_KRB_ERROR_CKSUM = `enum KRB5_KEYUSAGE_KRB_ERROR_CKSUM = 18;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_KRB_ERROR_CKSUM); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_KRB_ERROR_CKSUM);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_APP_DATA_CKSUM))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_APP_DATA_CKSUM = `enum KRB5_KEYUSAGE_APP_DATA_CKSUM = 17;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_APP_DATA_CKSUM); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_APP_DATA_CKSUM);
        }
    }




    static if(!is(typeof(KRB5_KEYUSAGE_APP_DATA_ENCRYPT))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_APP_DATA_ENCRYPT = `enum KRB5_KEYUSAGE_APP_DATA_ENCRYPT = 16;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_APP_DATA_ENCRYPT); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_APP_DATA_ENCRYPT);
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




    static if(!is(typeof(KRB5_KEYUSAGE_KRB_PRIV_ENCPART))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_KRB_PRIV_ENCPART = `enum KRB5_KEYUSAGE_KRB_PRIV_ENCPART = 13;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_KRB_PRIV_ENCPART); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_KRB_PRIV_ENCPART);
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




    static if(!is(typeof(KRB5_KEYUSAGE_TGS_REP_ENCPART_SUBKEY))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_TGS_REP_ENCPART_SUBKEY = `enum KRB5_KEYUSAGE_TGS_REP_ENCPART_SUBKEY = 9;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_TGS_REP_ENCPART_SUBKEY); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_TGS_REP_ENCPART_SUBKEY);
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




    static if(!is(typeof(KRB5_KEYUSAGE_TGS_REQ_AD_SUBKEY))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_TGS_REQ_AD_SUBKEY = `enum KRB5_KEYUSAGE_TGS_REQ_AD_SUBKEY = 5;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_TGS_REQ_AD_SUBKEY); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_TGS_REQ_AD_SUBKEY);
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




    static if(!is(typeof(KRB5_KEYUSAGE_AS_REQ_PA_ENC_TS))) {
        private enum enumMixinStr_KRB5_KEYUSAGE_AS_REQ_PA_ENC_TS = `enum KRB5_KEYUSAGE_AS_REQ_PA_ENC_TS = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_KEYUSAGE_AS_REQ_PA_ENC_TS); }))) {
            mixin(enumMixinStr_KRB5_KEYUSAGE_AS_REQ_PA_ENC_TS);
        }
    }
    static if(!is(typeof(CKSUMTYPE_HMAC_MD5_ARCFOUR))) {
        private enum enumMixinStr_CKSUMTYPE_HMAC_MD5_ARCFOUR = `enum CKSUMTYPE_HMAC_MD5_ARCFOUR = - 138;`;
        static if(is(typeof({ mixin(enumMixinStr_CKSUMTYPE_HMAC_MD5_ARCFOUR); }))) {
            mixin(enumMixinStr_CKSUMTYPE_HMAC_MD5_ARCFOUR);
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




    static if(!is(typeof(CKSUMTYPE_HMAC_SHA384_192_AES256))) {
        private enum enumMixinStr_CKSUMTYPE_HMAC_SHA384_192_AES256 = `enum CKSUMTYPE_HMAC_SHA384_192_AES256 = 0x0014;`;
        static if(is(typeof({ mixin(enumMixinStr_CKSUMTYPE_HMAC_SHA384_192_AES256); }))) {
            mixin(enumMixinStr_CKSUMTYPE_HMAC_SHA384_192_AES256);
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




    static if(!is(typeof(ADDRTYPE_ISO))) {
        private enum enumMixinStr_ADDRTYPE_ISO = `enum ADDRTYPE_ISO = 0x0007;`;
        static if(is(typeof({ mixin(enumMixinStr_ADDRTYPE_ISO); }))) {
            mixin(enumMixinStr_ADDRTYPE_ISO);
        }
    }




    static if(!is(typeof(ADDRTYPE_XNS))) {
        private enum enumMixinStr_ADDRTYPE_XNS = `enum ADDRTYPE_XNS = 0x0006;`;
        static if(is(typeof({ mixin(enumMixinStr_ADDRTYPE_XNS); }))) {
            mixin(enumMixinStr_ADDRTYPE_XNS);
        }
    }




    static if(!is(typeof(ADDRTYPE_CHAOS))) {
        private enum enumMixinStr_ADDRTYPE_CHAOS = `enum ADDRTYPE_CHAOS = 0x0005;`;
        static if(is(typeof({ mixin(enumMixinStr_ADDRTYPE_CHAOS); }))) {
            mixin(enumMixinStr_ADDRTYPE_CHAOS);
        }
    }




    static if(!is(typeof(ADDRTYPE_INET))) {
        private enum enumMixinStr_ADDRTYPE_INET = `enum ADDRTYPE_INET = 0x0002;`;
        static if(is(typeof({ mixin(enumMixinStr_ADDRTYPE_INET); }))) {
            mixin(enumMixinStr_ADDRTYPE_INET);
        }
    }




    static if(!is(typeof(KRB5_ANONYMOUS_PRINCSTR))) {
        private enum enumMixinStr_KRB5_ANONYMOUS_PRINCSTR = `enum KRB5_ANONYMOUS_PRINCSTR = "ANONYMOUS";`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_ANONYMOUS_PRINCSTR); }))) {
            mixin(enumMixinStr_KRB5_ANONYMOUS_PRINCSTR);
        }
    }




    static if(!is(typeof(KRB5_ANONYMOUS_REALMSTR))) {
        private enum enumMixinStr_KRB5_ANONYMOUS_REALMSTR = `enum KRB5_ANONYMOUS_REALMSTR = "WELLKNOWN:ANONYMOUS";`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_ANONYMOUS_REALMSTR); }))) {
            mixin(enumMixinStr_KRB5_ANONYMOUS_REALMSTR);
        }
    }




    static if(!is(typeof(KRB5_REFERRAL_REALM))) {
        private enum enumMixinStr_KRB5_REFERRAL_REALM = `enum KRB5_REFERRAL_REALM = "";`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_REFERRAL_REALM); }))) {
            mixin(enumMixinStr_KRB5_REFERRAL_REALM);
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




    static if(!is(typeof(KRB5_NT_PRINCIPAL))) {
        private enum enumMixinStr_KRB5_NT_PRINCIPAL = `enum KRB5_NT_PRINCIPAL = 1;`;
        static if(is(typeof({ mixin(enumMixinStr_KRB5_NT_PRINCIPAL); }))) {
            mixin(enumMixinStr_KRB5_NT_PRINCIPAL);
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






    static if(!is(typeof(_BITS_TYPES___LOCALE_T_H))) {
        private enum enumMixinStr__BITS_TYPES___LOCALE_T_H = `enum _BITS_TYPES___LOCALE_T_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_TYPES___LOCALE_T_H); }))) {
            mixin(enumMixinStr__BITS_TYPES___LOCALE_T_H);
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




    static if(!is(typeof(_STRING_H))) {
        private enum enumMixinStr__STRING_H = `enum _STRING_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STRING_H); }))) {
            mixin(enumMixinStr__STRING_H);
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






    static if(!is(typeof(__BYTE_ORDER))) {
        private enum enumMixinStr___BYTE_ORDER = `enum __BYTE_ORDER = 1234;`;
        static if(is(typeof({ mixin(enumMixinStr___BYTE_ORDER); }))) {
            mixin(enumMixinStr___BYTE_ORDER);
        }
    }
    static if(!is(typeof(_BITS_BYTESWAP_H))) {
        private enum enumMixinStr__BITS_BYTESWAP_H = `enum _BITS_BYTESWAP_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__BITS_BYTESWAP_H); }))) {
            mixin(enumMixinStr__BITS_BYTESWAP_H);
        }
    }






    static if(!is(typeof(_ALLOCA_H))) {
        private enum enumMixinStr__ALLOCA_H = `enum _ALLOCA_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__ALLOCA_H); }))) {
            mixin(enumMixinStr__ALLOCA_H);
        }
    }




    static if(!is(typeof(_STRINGS_H))) {
        private enum enumMixinStr__STRINGS_H = `enum _STRINGS_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__STRINGS_H); }))) {
            mixin(enumMixinStr__STRINGS_H);
        }
    }




    static if(!is(typeof(_SYS_CDEFS_H))) {
        private enum enumMixinStr__SYS_CDEFS_H = `enum _SYS_CDEFS_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__SYS_CDEFS_H); }))) {
            mixin(enumMixinStr__SYS_CDEFS_H);
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
    static if(!is(typeof(__ptr_t))) {
        private enum enumMixinStr___ptr_t = `enum __ptr_t = void *;`;
        static if(is(typeof({ mixin(enumMixinStr___ptr_t); }))) {
            mixin(enumMixinStr___ptr_t);
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
    static if(!is(typeof(__attribute_malloc__))) {
        private enum enumMixinStr___attribute_malloc__ = `enum __attribute_malloc__ = __attribute__ ( ( __malloc__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_malloc__); }))) {
            mixin(enumMixinStr___attribute_malloc__);
        }
    }






    static if(!is(typeof(__attribute_pure__))) {
        private enum enumMixinStr___attribute_pure__ = `enum __attribute_pure__ = __attribute__ ( ( __pure__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_pure__); }))) {
            mixin(enumMixinStr___attribute_pure__);
        }
    }




    static if(!is(typeof(__attribute_const__))) {
        private enum enumMixinStr___attribute_const__ = `enum __attribute_const__ = __attribute__ ( cast( __const__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_const__); }))) {
            mixin(enumMixinStr___attribute_const__);
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




    static if(!is(typeof(__attribute_deprecated__))) {
        private enum enumMixinStr___attribute_deprecated__ = `enum __attribute_deprecated__ = __attribute__ ( ( __deprecated__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_deprecated__); }))) {
            mixin(enumMixinStr___attribute_deprecated__);
        }
    }
    static if(!is(typeof(__attribute_warn_unused_result__))) {
        private enum enumMixinStr___attribute_warn_unused_result__ = `enum __attribute_warn_unused_result__ = __attribute__ ( ( __warn_unused_result__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___attribute_warn_unused_result__); }))) {
            mixin(enumMixinStr___attribute_warn_unused_result__);
        }
    }






    static if(!is(typeof(__always_inline))) {
        private enum enumMixinStr___always_inline = `enum __always_inline = __inline __attribute__ ( ( __always_inline__ ) );`;
        static if(is(typeof({ mixin(enumMixinStr___always_inline); }))) {
            mixin(enumMixinStr___always_inline);
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




    static if(!is(typeof(__fortify_function))) {
        private enum enumMixinStr___fortify_function = `enum __fortify_function = extern __inline __attribute__ ( ( __always_inline__ ) ) __attribute__ ( ( __gnu_inline__ ) ) ;`;
        static if(is(typeof({ mixin(enumMixinStr___fortify_function); }))) {
            mixin(enumMixinStr___fortify_function);
        }
    }




    static if(!is(typeof(__restrict_arr))) {
        private enum enumMixinStr___restrict_arr = `enum __restrict_arr = __restrict;`;
        static if(is(typeof({ mixin(enumMixinStr___restrict_arr); }))) {
            mixin(enumMixinStr___restrict_arr);
        }
    }
    static if(!is(typeof(__glibc_has_include))) {
        private enum enumMixinStr___glibc_has_include = `enum __glibc_has_include = __has_include;`;
        static if(is(typeof({ mixin(enumMixinStr___glibc_has_include); }))) {
            mixin(enumMixinStr___glibc_has_include);
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






    static if(!is(typeof(__NFDBITS))) {
        private enum enumMixinStr___NFDBITS = `enum __NFDBITS = ( 8 * cast( int ) ( __fd_mask ) .sizeof );`;
        static if(is(typeof({ mixin(enumMixinStr___NFDBITS); }))) {
            mixin(enumMixinStr___NFDBITS);
        }
    }
    static if(!is(typeof(FD_SETSIZE))) {
        private enum enumMixinStr_FD_SETSIZE = `enum FD_SETSIZE = 1024;`;
        static if(is(typeof({ mixin(enumMixinStr_FD_SETSIZE); }))) {
            mixin(enumMixinStr_FD_SETSIZE);
        }
    }




    static if(!is(typeof(NFDBITS))) {
        private enum enumMixinStr_NFDBITS = `enum NFDBITS = ( 8 * cast( int ) ( __fd_mask ) .sizeof );`;
        static if(is(typeof({ mixin(enumMixinStr_NFDBITS); }))) {
            mixin(enumMixinStr_NFDBITS);
        }
    }
    static if(!is(typeof(_SYS_TYPES_H))) {
        private enum enumMixinStr__SYS_TYPES_H = `enum _SYS_TYPES_H = 1;`;
        static if(is(typeof({ mixin(enumMixinStr__SYS_TYPES_H); }))) {
            mixin(enumMixinStr__SYS_TYPES_H);
        }
    }
    static if(!is(typeof(__BIT_TYPES_DEFINED__))) {
        private enum enumMixinStr___BIT_TYPES_DEFINED__ = `enum __BIT_TYPES_DEFINED__ = 1;`;
        static if(is(typeof({ mixin(enumMixinStr___BIT_TYPES_DEFINED__); }))) {
            mixin(enumMixinStr___BIT_TYPES_DEFINED__);
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







krb5_error_code _hkrb5_login(krb5_context kcontext, krb5_principal client, string password)
{
 import std.string : toStringz;
    krb5_creds creds;
    krb5_get_init_creds_opt *gic_options = null;
    krb5_error_code code;

    krb5_get_init_creds_opt_alloc(kcontext, &gic_options);
    code = krb5_get_init_creds_password(kcontext, &creds, client, password.toStringz, null, null, 0, null, gic_options);
    if (!code)
      krb5_free_cred_contents(kcontext, &creds);
    krb5_get_init_creds_opt_free(kcontext, gic_options);

    return code;
}
