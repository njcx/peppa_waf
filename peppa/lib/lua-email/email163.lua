--
-- email163
-- 羽
-- <https://github.com/Existence01/lua-email163.git>
--
local _M = {}
local smtp = require("socket.smtp")
local mime = require("socket.mime")
local ltn12 = require("socket.ltn12")
local source,mailt,config = {},{},{}

-- 邮箱默认配置
config['name'] = "羽" -- 发送人名称
config['server'] = "smtp.163.com" -- smtp服务器地址
config['user'] = "xx@163.com" -- 邮箱账号
config['password'] = "" -- 邮箱密码
config['html'] = false -- 是否使用html

function _M.new(conf)
    config = conf
    smtp.HTML = config['html']

    mailt['from'] = "<" .. config.user .. ">"
    mailt['server'] = config.server
    mailt['user'] = config.user
    mailt['password'] = config.password

    source['headers'] = {
       from = config.name .."<".. config.user ..">",
       to = config.user,
       
    }

    if config['html'] then
        source['headers']["content-type"] = 'multipart/alternative'
        source['headers']["content-transfer-encoding"] = "BASE64"
    end

    return _M
end

-- 发送邮件
function _M.send(tab)
    mailt['rcpt'] = tab.to
    source['headers']['subject'] = tab.title
    source['body'] = {{body = mime.eol(0, tab.body)}}

    if tab.cc then
    mailt['cc'] = tab.cc
    end

    if tab.file then
        local fio = {}
        for i,v in pairs(tab.file) do
          fio[i] = io.open(v.path, "rb")
          table.insert(source.body,{headers = {
            ["content-type"] = v.type,
            ["content-transfer-encoding"] = "BASE64"
          },body = ltn12.source.chain(
            ltn12.source.file(fio[i]),
            ltn12.filter.chain(
              mime.encode("base64"),
              mime.wrap()
            )
          )})
        end
    end

    mailt['source'] = smtp.message(source)
    r, e = smtp.send(mailt)

    if r then
        return true,"发送邮件成功"
    else
        return false,e
    end
end

_M._DESCRIPTION = ""
_M._URL         = ""
_M._VERSION     = ''

return _M
