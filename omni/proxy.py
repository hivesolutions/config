#!/usr/bin/python
# -*- coding: utf-8 -*-

import re

import netius.extra

BASE_PORT = netius.conf("BASE_PORT", 8080, cast = int)
NUMBER_PROCESSES = netius.conf("NUMBER_PROCESSES", 16, cast = int)
NODE_TEMPLATE = netius.conf("NODE_TEMPLATE", "http://172.17.0.1:%d")

if __name__ == "__main__":
    nodes = []

    for port in range(BASE_PORT, BASE_PORT + NUMBER_PROCESSES):
        api_nodes.append(NODE_TEMPLATE % port)

    regex = (
        (re.compile(r"https://*"), nodes),
    )
    server = netius.extra.ReverseProxyServer(regex = regex)
    server.serve(env = True)
