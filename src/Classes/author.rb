class Author
    def initialize(id = Random.rand(1..10_000), first_name, last_name)
        @id = id
        @first_name = first_name
        @last_name = last_name
        @items = []
    end
end
