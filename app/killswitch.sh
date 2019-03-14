#!/bin/bash

ps a | grep -v grep | grep rtorrent | awk '{print $1}' | xargs kill
