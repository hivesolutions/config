#!/usr/bin/python
# -*- coding: utf-8 -*-

import re

import netius.extra

if __name__ == "__main__":
    regex = (
        (
            re.compile(r"https://*"),
            (
                "http://172.17.42.1:8080",
                "http://172.17.42.1:8181",
                "http://172.17.42.1:8282",
                "http://172.17.42.1:8383",
                "http://172.17.42.1:8484",
                "http://172.17.42.1:8585",
                "http://172.17.42.1:8686",
                "http://172.17.42.1:8787"
            )
        ),
    )
    server = netius.extra.ReverseProxyServer(regex = regex)
    server.serve(env = True)
