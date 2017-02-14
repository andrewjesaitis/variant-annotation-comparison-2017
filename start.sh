#!/usr/bin/env bash
cp -R /snpEff/* .
java -Xmx4g -jar snpEff.jar "$@"
