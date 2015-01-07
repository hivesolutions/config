#!/usr/bin/python
# -*- coding: utf-8 -*-

import re

import netius.extra

if __name__ == "__main__":
    regex = (
        (
            re.compile(r"https://{{ OMNI_DOMAIN }}"),
            (
                "http://{{ OMNI_HOST }}:{{ OMNI_PORT }}",
            )
        ),
        (
            re.compile(r"https://{{ TTB_DOMAIN }}"),
            (
                "http://{{ TTB_HOST }}:{{ TTB_PORT }}",
            )
        ),
    )
    server = netius.extra.ReverseProxyServer(regex = regex)
    server.serve(env = True)
