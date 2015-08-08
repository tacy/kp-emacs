## kp-emacs
---

Emacs configuration for [Emacs for MacOSX](http://emacsformacosx.com/)

### Quickstart

#### Install Python Dependencies

* `pip install autopep8` or `conda install autopep8`
* `pip install jedi` or `conda install jedi`

#### Install Golang Dependencies

Golang currently expects `/usr/local/go/bin/go` and a GOPATH of `/Users/kpurdon/projects/gocode`. These are configurable in `dev/kp-dev-go.el`.

* `go get -u github.com/nsf/gocode`
* `go get -u github.com/rogpeppe/godef`

#### Install Ruby Dependencies

* `gem install rubocop`

#### Install JS Dependencies

* `npm install -g jslint`

#### Get Source

1. `cd ~`
2. `rm -rf .emacs.d`
3. `git clone git@github.com:kpurdon/kp-emacs.git .emacs.d`

#### Start Emacs

When you start emacs all of the required packages will be installed and settings applied.

### Included Configuration

* Python
* Ruby
* Puppet
* Markdown
* Dockerfile
* YAML
* Web (HTML/JS/CSS)
* SASS
* Jekyll Blog (Polymode Support)
* Golang
* NginX Config
* SQL (w/ indentation)

### License

GPLv3 - See LICENSE
