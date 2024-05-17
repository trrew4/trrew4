

    # 对好友数最多的省份进行一进步分析
    max_count_province = ''
    for key, value in province_dict.items():
        if(value == max(province_dict.values())):
            max_count_province = key
            break

    # 使用一个字典统计好友地区分布数量
    city_dict = {}
    # 遍历
    for user in friends:
        if(user.province == max_count_province):
            # 更新键值对
            if(user.city in city_dict.keys()):
                city_dict[user.city] += 1
            else:
                city_dict[user.city] = 1

    bar = Bar()
    bar.add_xaxis([x for x in city_dict.keys()])
    bar.add_yaxis("地区分布", [x for x in city_dict.values()])
    bar.render('data/某省好友地区分布.html')

