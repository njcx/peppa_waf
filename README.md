# peppa_waf ：

#### an open source waf (Web Application Firewalls) base on Tengine-2.2.2 and luajit2.1.0，jemalloc-5.1.0
### 计划包括如下模块：

1，规则处理引擎：加载规则并实时分析处理请求

2，联动模块： 与前置waf,cdn联动,与防火墙联动

3，数据收集模块：统计业务metrics，收集结构化日志

4，数据分析模块：分析并确定关键指标，进行机器学习训练，反馈到规则

5，数据展示模块：图形展示关键指标，性能，请求数

### 安装

#sudo apt-get install libpcre3 libpcre3-dev openssl wget libssl-dev

#yum install pcre pcre-devel openssl openssl-devel zlib-devel wget

#cd lua && make && make install

#cd /usr/local/src && wget https://github.com/jemalloc/jemalloc/releases/download/5.1.0/jemalloc-5.1.0.tar.bz2 && tar xvf jemalloc-5.1.0.tar.bz2 && cd jemalloc-5.1.0 && ./configure --prefix=/usr/local/jemalloc && make && make install

#echo "/usr/local/lib" >> /etc/ld.so.conf

#ldconfig

先安装 luajit

然后安装tengine

#./configure --prefix=/usr/local/nginx --with-jemalloc=/usr/local/src/jemalloc-5.1.0 --with-http_lua_module --with-luajit-lib=/usr/local/lib/ --with-luajit-inc=/usr/local/include/luajit-2.1/ --with-lua-inc=/usr/local/include/luajit-2.1/ 

#make && make install
