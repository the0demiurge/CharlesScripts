#!/usr/bin/env python
import requests
import time
import re
import os
import bs4

help = '''东北大学IP网关登陆器
用法：
    {name} query 查询状态
    {name} login username password 登陆网关
    {name} logout username password 退出网关
'''.format(name=os.path.split(__file__)[-1])


def connect(payload={}, url='http://ipgw.neu.edu.cn/srun_portal_pc.php'):
    not_connetced = True
    while not_connetced:
        try:
            response = requests.post(url, data=payload)
            not_connetced = False
        except requests.exceptions.ConnectionError:
            ...
    return response


def query():
    # 查询状态
    payload = {
        'action': 'get_online_info',
    }
    r = connect(payload, 'http://ipgw.neu.edu.cn/include/auth_action.php')
    return r.content.decode('utf-8')


def login(username='', password=''):
    # 登陆
    # E2531 用户不存在
    # E2553 密码错误
    # E2606 用户被禁用
    # E2616 已欠费
    # E2620 已经在线

    # '1. 请' 成功登陆
    payload = {
        'action': 'login',
        'ac_id': '1',
        'user_ip': '',
        'nas_ip': '',
        'user_mac': '',
        'url': '',
        'username': '{}'.format(username),
        'password': '{}'.format(password),
        'save_me': '0'}
    r = connect(payload)
    soup = bs4.BeautifulSoup(r.content.decode('utf-8'), 'html.parser')
    if re.findall('5分钟', str(soup.p)):
        return 'sleep', str(soup.p)
    if str(soup.p)[3:7] == '1. 请':
        return 'True', str(soup.p)
    else:
        return str(soup.p)[3:8], str(soup.p)


def logout(username='', password=''):
    # 断开连接
    payload = {
        'action': 'logout',
        'ajax': '1',
        'username': '{}'.format(username),
        'password': '{}'.format(password)}
    r = connect(payload)
    return r.text

if __name__ == '__main__':
    import fire
    fire.Fire()
