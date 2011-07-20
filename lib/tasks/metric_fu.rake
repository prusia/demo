require 'metrics_fu'

MetricFu::Configuration.run do |config|
        config.metrics  = [:roodi]
        config.graphs   = [:roodi]
        config.roodi    = { :dirs_to_roodi => ['lib'] }
end
