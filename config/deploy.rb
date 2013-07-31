require "bundler/capistrano"
require "rvm/capistrano"

load "config/recipes/base"
load "config/recipes/node"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/mysql"
load "config/recipes/rvm"

server "olivierdoe.no-ip.biz", :web, :app, :db, primary: true

set :site_url, "olivierdoe.no-ip.biz"
set :application, "gallery"
set :user, "olivierdoe"

set :deploy_to, "/home/#{user}/apps/#{application}"
set :use_sudo, false

set :scm, "git"
set :repository,  "https://github.com/OlIvIeR77/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true


after "deploy", "deploy:cleanup" # keep only the last 5 releases

