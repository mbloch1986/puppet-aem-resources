# Copyright 2016-2019 Shine Solutions
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

Puppet::Type.newtype(:aem_bundle) do
  ensurable do
    newvalue(:started) do
      provider.start
    end

    newvalue(:stopped) do
      provider.stop
    end
  end

  def self.title_patterns
    [[/^(.*)$/, [[:name, ->(x) { x }]]]]
  end

  newparam :name do
    isnamevar
    desc 'AEM bundle name'
    validate do |value|
      raise ArgumentError.new('Bundle name must be provided') if value == ''
    end
  end

  newparam :aem_id do
    isnamevar
    desc 'AEM instance ID'
  end

  newparam :aem_username do
    desc 'AEM username'
  end

  newparam :aem_password do
    desc 'AEM password'
  end

  newparam :retries_max_tries do
    desc 'Maximum number of tries'
    validate do |value|
      value = 60 if value == ''
    end
  end

  newparam :retries_base_sleep_seconds do
    desc 'Starting sleep duration in seconds'
    validate do |value|
      value = 2 if value == ''
    end
  end

  newparam :retries_max_sleep_seconds do
    desc 'Maximum sleep duration in seconds'
    validate do |value|
      value = 5 if value == ''
    end
  end
end
