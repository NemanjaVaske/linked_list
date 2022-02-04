class LinkedList
    attr_accessor :head

    def initialize
        @head = nil
    end
    #adds a new node containing value to the end of the list
    def append(value)
        if head.nil?
            @head = Node.new(value)
        else
            last_node = @head
            while (!last_node.next_node.nil?)
                last_node = last_node.next_node
            end
            last_node.next_node = Node.new(value)
        end
    end
    #adds a new node containing value to the start of the list
    def prepend(value)
        if head.nil?
            @head = Node.new(value)
        else
            old_head = head
            @head = Node.new(value,old_head)
        end
    end
    #returns the total number of nodes in the list
    def size
        if head.nil?
            return 0
        else
            counter = 0
            start = head
            while (!start.next_node.nil?)
                counter += 1
                start = start.next_node
            end
            counter
        end
    end
    #returns the last node in the list
    def tail
        return if head.nil?
        tail = head
        while(!tail.next_node.nil?)
            tail = tail.next_node
        end
        tail
    end
    #returns the node at the given index
    def at(index)
        return if head.nil?
        return head if index == 0
        curent = head
        count = 0
        while(!curent.next_node.nil?)
            curent = curent.next_node
            count += 1
            if count == index
                return curent
            end
        end
    end
    #removes the last element from the list
    def pop
        return if head.nil?
        curent = head
        index = 0
        while(!curent.next_node.nil?)
            index += 1
            curent = curent.next_node
        end
        
        if index > 0
            curent = at(index - 1)
            curent.next_node = nil
        end

    end
    #returns true if the passed in value is in the list and otherwise returns false.
    def contains(value)
        return if head.nil?
        curent = head
        return true if curent.value == value
        while(!curent.next_node.nil?)
            curent = curent.next_node
            if curent.value == value
                return true
            end
        end
        false
    end
    #returns the index of the node containing value, or nil if not found.
    def find(value)
        return if head.nil?
        return 0 if head.value == value
        index = 0
        curent = head
        while(!curent.next_node.nil?)
            curent = curent.next_node
            index += 1
            if(curent.value == value)
                return index
            end
        end
        nil
    end
    #represent your LinkedList objects as strings, so you can print them out and preview them in the console. 
    #The format should be: ( value ) -> ( value ) -> ( value ) -> nil
    def to_s
        return if head.nil?
        curent = head
        print = "(#{curent.value})"
        while(!curent.next_node.nil?)
            curent = curent.next_node
            print = print + " -> (#{curent.value})"
            
        end
        print + " -> nil"
    end
end

class Node
    attr_accessor :value, :next_node

    def initialize(value = nil, next_node=nil)
        @value = value
        @next_node = next_node
    end
end

ll = LinkedList.new()
ll.append(10)
ll.append(20)
ll.prepend(5)
ll.prepend(15)
ll.append(9)
ll.append(11)

puts ll.to_s
ll.pop
puts ll.to_s
ll.pop
puts ll.to_s
ll.pop
puts ll.to_s
ll.pop
puts ll.to_s
ll.pop
puts ll.to_s
ll.pop
puts ll.to_s
ll.prepend(17)
puts ll.to_s
ll.append(2)
puts ll.to_s
#p ll.find(15)
#p ll.find(10)
#p ll.find(18)
#p ll.find(9)
#p ll.contains(5)
#p ll.contains(3)
#p ll.contains(10)
#p ll.contains(20)
#p ll.contains(5)
#p ll.contains(13)
#p ll.contains(9)
#p ll.contains(11)

#ovo je da pokazemo da moze da skracuje do zadnjeg elementa
#p ll.size
#p ll.tail
#p ll.at(2).value
#p ll.at(0)
#ll.pop
#p ll.size
#ll.pop
#ll.pop
#ll.pop
#ll.pop
#ll.pop
#p ll.size
#p ll.at(0)