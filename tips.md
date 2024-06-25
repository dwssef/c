# Shard library
```bash
# 查看main动态链接依赖
ldd main 
```

```bash
(base) ictrek@ictrek:~/test$ cat /etc/ld.so.conf
include /etc/ld.so.conf.d/*.conf
/home/ictrek/test

# 再运行该指令
ldconfig
```

# Reference
[4. 共享库]( https://akaedu.github.io/book/ch20s04.html )