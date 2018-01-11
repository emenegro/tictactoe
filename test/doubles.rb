class DummyInput
    @returns
    @count

    def initialize(returns)
        @returns = returns
        @count = 0
    end

    def get_input
        result = @returns[@count]
        @count += 1
        return result
    end
end

class DummyOutput
    def show(text)
    end
end