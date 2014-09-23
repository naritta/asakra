# Asakra

'Asakra' is monitoring tool for fluentd itself with ESPER.

* output log file for fluentd tail-input plugin, then you can see statements of every fluentd on the user interface using kibana and elasticsearch.
* All you have to do is just add all hostnames of your fluentd to the setting file.
* you can know immediately when something is wrong with fluentd.

And, easy to install/execute dramatically, and more, fully open source software.

## Install and Execute

On JRuby environment, do these command (and, that all):

    gem install asakra

To execute:

    asakra

For JRuby installation, you can use `rbenv`, `rvm` and `xbuild`, or install JRuby directly.
