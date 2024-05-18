# 获取个人数据
def generate_data():

    # 定义欲输出的markdown字符串
    markdown_content = '''
<p align="center">
    <font size='6px'>{qq_number}的个人QQ历史报告</font>
    <img src="{qq_icon_png}" align="right" height="60">
</p>
'''

    # 初始化文件夹
    init_folders()
    # 写入项目所需资源文件到本地目录
    write_data()




    # 创建一个自己编写的qq bot对象
    bot = Bot()
    custom_print(u'登录成功!')
    # 更新一下欲输出的markdown文本
    markdown_content = markdown_content.replace('{qq_number}',bot.qq_number)
    markdown_content = markdown_content.replace('{qq_icon_png}', 'data/qq_icon.png')




    # 获取该登录账户的详细资料
    custom_print(u'正在获取该账户的个人数据...')
    detail_information = bot.get_detail_information()
    # content为markdown语法文本
    content = '\n<br/><br/>\n' + '## 我的详细资料\n' + '种类|内容\n:- | :-\n'

    # 将key换成中文文本
    key_dict = {
        'bind_email':'绑定邮箱',
        'last_contact_friend_count': '最近联系人数量',
        'friend_count': '好友数量',
        'group_count': '好友分组数量',
        'qq_level': '账号等级',
        'qq_level_rank': '等级排名',
        'nickname': '昵称',
        'odd_friend_count': '**单向好友数量**',
        'qq_age': 'Q龄',
        'remark_friend_count':'已备注的好友数量',
        'mobile_qq_online_hour': '**手机QQ累计在线时间(小时)**',
        'no_hide_online_hour': '**未隐身状态下累计在线时间(小时)**',
        'total_active_day': '**在线活跃时间**',
        'age': '真实年龄',
        'birthday': '出生日期',
        'qq_signature': '个性签名(前20字)',
    }
