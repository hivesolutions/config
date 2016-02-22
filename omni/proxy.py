#!/usr/bin/python
# -*- coding: utf-8 -*-

import re

import netius.extra

BASE_PORT = netius.conf("BASE_PORT", 8080, cast = int)
NUMBER_PROCESSES = netius.conf("NUMBER_PROCESSES", 8, cast = int)
NODE_TEMPLATE = netius.conf("NODE_TEMPLATE", "http://172.17.0.1:%d")
AUTH_PASSWORD = netius.conf("AUTH_PASSWORD", None)
AUTH_ADDRESSES = netius.conf("AUTH_ADDRESSES", [], cast = list)

if __name__ == "__main__":
    nodes = []

    for port in range(BASE_PORT, BASE_PORT + NUMBER_PROCESSES):
        nodes.append(NODE_TEMPLATE % port)

    nodes = tuple(nodes)

    if AUTH_PASSWORD: auth = netius.SimpleAuth(password = AUTH_PASSWORD)
    else: auth = None
    auth_address = netius.AddressAuth(AUTH_ADDRESSES)

    regex = (
        (re.compile(r"https://*"), nodes),
    )
    auth_regex = (
        (re.compile(r"https://[^/]+/omni/*"), None),
        (re.compile(r"https://*"), (auth, auth_address))
    )
    server = netius.extra.ReverseProxyServer(regex = regex, auth_regex = auth_regex)
    server.serve(env = True)
