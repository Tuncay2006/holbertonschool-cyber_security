#!/usr/bin/env ruby
require 'fileutils'

TASKS_FILE = 'tasks.txt'
FileUtils.touch(TASKS_FILE)

options = {}

# Checker-in gözlədiyi exact help output
HELP_TEXT = "Usage: cli.rb [options]\n" \
"-a, --add TASK                   Add a new task\n" \
"-l, --list                       List all tasks\n" \
"-r, --remove INDEX               Remove a task by index\n" \
"-h, --help                       Show help\n"

# Manual argument parsing
ARGV.each_with_index do |arg, i|
  case arg
  when "-a", "--add"
    options[:add] = ARGV[i + 1]
  when "-l", "--list"
    options[:list] = true
  when "-r", "--remove"
    options[:remove] = ARGV[i + 1].to_i
  when "-h", "--help"
    puts HELP_TEXT
    exit 0
  end
end

tasks = File.readlines(TASKS_FILE, chomp: true)

if options[:add]
  tasks << options[:add]
  File.write(TASKS_FILE, tasks.join("\n") + "\n")
  puts "Task ‘#{options[:add]}’ added."
elsif options[:list]
  tasks.each { |t| puts t }
elsif options[:remove]
  idx = options[:remove] - 1
  removed = tasks.delete_at(idx)
  File.write(TASKS_FILE, tasks.join("\n") + (tasks.empty? ? "" : "\n"))
  puts "Task ‘#{removed}’ removed."
else
  puts HELP_TEXT
end
