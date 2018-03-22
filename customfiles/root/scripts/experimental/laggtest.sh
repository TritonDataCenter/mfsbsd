#!/bin/sh --

ifconfig lagg0 create
ifconfig lagg0 up laggproto lacp laggport ixl1
