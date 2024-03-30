#!/usr/bin/env ruby

# frozen_string_literal: true

require "date"
require "yaml"

Dir["bibliography/**/*.yml"].each do |file|
  # Load file
  entries = YAML.load_file(file, permitted_classes: [Date])

  entries.transform_values do |entry|
    next unless entry.is_a? Hash

    # Use only year as date
    if entry["date"]
      entry["date"] = entry["date"].year if entry["date"].is_a? Date
      entry["date"] = entry["date"].split("-").first if entry["date"].is_a? String
    end

    # Remove page range
    entry.delete("page-range")

    # Remove URL
    entry.delete("url")

    # Remove serial number
    entry.delete("serial-number")

    # Remove parent
    entry.delete("parent")

    entry
  end

  # Write back to file
  File.open(file, "w") { |f| f.write(entries.to_yaml) }
end
