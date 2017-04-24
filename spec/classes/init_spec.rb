require 'spec_helper'
describe 'filebeat' do
  context 'with default values for all parameters' do
    it { should contain_class('filebeat') }
  end
end
