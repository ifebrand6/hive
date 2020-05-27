module CustomerDashboardHelper
    def get_browser_name(user_agent)
        client = DeviceDetector.new(user_agent)
        return client.name
    end
end
