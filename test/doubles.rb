class DummyInput
    def initialize(returns)
        @returns = returns
    end

    def get_input
        return @returns
    end
end

class DummyOutput
    def show(text)
        # Do nothing
    end
end