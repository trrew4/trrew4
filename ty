
    chapters_map = {title: level for level, title in get_chapters(int(bookId), headers)}
    res = ''
    for c in sorted(chapters.keys()):
        title = chapters[c]
        res += '#' * chapters_map[title] + ' ' + title + '\n'
        for start, text in sorted(contents[c], key=lambda e: e[0]):
            res += '> ' + text.strip() + '\n\n'
        res += '\n'

    return res


def get_bestbookmarks(bookId, headers):
    """获取书籍的热门划线,返回文本"""
    url = "https://i.weread.qq.com/book/bestbookmarks"
    params = dict(bookId=bookId)
    r = requests.get(url, params=params, headers=headers, verify=False)
    if r.ok:
        data = r.json()
        # clipboard.copy(json.dumps(data, indent=4, sort_keys=True))
    else:
        raise Exception(r.text)
    chapters = {c['chapterUid']: c['title'] for c in data['chapters']}
    contents = defaultdict(list)
    for item in data['items']:
        chapter = item['chapterUid']
        text = item['markText']
        contents[chapter].append(text)

    chapters_map = {title: level for level, title in get_chapters(int(bookId))}
    res = ''
    for c in chapters:
        title = chapters[c]
        res += '#' * chapters_map[title] + ' ' + title + '\n'
        for text in contents[c]:
            res += '> ' + text.strip() + '\n\n'
        res += '\n'
    return res
