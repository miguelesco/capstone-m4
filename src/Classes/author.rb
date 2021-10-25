class Author
    attr_accessor :id, :first_name, :last_name, :items
    def initialize(id = Random.rand(1..10_000), first_name, last_name)
        @id = id
        @first_name = first_name
        @last_name = last_name
        @items = []
    end

    def add_item(item)
        @items << item unless @items.include?(item)
        item.author = self
      end
end
