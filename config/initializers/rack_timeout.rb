Rack::Timeout.timeout = (1000).to_i
Rack::Timeout.unregister_state_change_observer(:logger)
