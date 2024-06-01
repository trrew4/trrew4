if __name__ == '__main__':


    # chromedriver驱动文件的位置，可输入绝对路径或者相对路径，./表示当前目录下
    # './chromedriver_win32.exe'表示当前目录下的chromedriver_win32.exe文件
    # 不同系统和不同chrome版本需要下载不同的chromedriver，请下载合适自己的版本
    # chromedriver下载地址http://chromedriver.chromium.org/downloads
    # 默认的chromedriver支持的Chrome版本为74
    # chromedriver_path = './chromedriver_win32_74.0.3729.6.exe'
    chromedriver_path = './chromedriver_mac_74.0.3729.6'




    option = webdriver.ChromeOptions()
    # 屏蔽chrome的提示
    option.add_argument('disable-infobars')
    # 静默自动打印为高清PDF文件，并存储到os.getcwd()目录，也就是当前目录
    appState = {
        # 添加保存为pdf选项
        "recentDestinations": [
            {
                "id": "Save as PDF",
                "origin": "local",
                 "account":""
            }
        ],
        # 选择保存为pdf选项
        "selectedDestinationId": "Save as PDF",
        # 版本2
        "version": 2,
        # 不显示页眉页脚
        "isHeaderFooterEnabled": False
    }

    profile = {
        # 打印前置参数
        'printing.print_preview_sticky_settings.appState': json.dumps(appState),
        # 默认下载、打印保存路径
        'savefile.default_directory': os.getcwd()
    }

    # 添加实验性质的设置参数
    option.add_experimental_option('prefs', profile)

    # 添加启动参数，后台静默打印
    option.add_argument('--kiosk-printing')


    # 绑定Chrome和chromedriver，不同Chrome版本对应的chromedriver是不同的，请注意
    driver = webdriver.Chrome(executable_path=chromedriver_path, options=option)

    # 将浏览器最大化显示，使得截图效果更好
    driver.maximize_window()

    # 延迟2秒，给最大化过程一点时间
    time.sleep(2)


