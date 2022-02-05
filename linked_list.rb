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
    #returns the total number of nodes in the list(did they think without head or with head?)
    #here we display nodes with head
    def size
        if head.nil?
            return 0
        else
            counter = 1
            curent = head
            while (!curent.next_node.nil?)
                counter += 1
                curent = curent.next_node
            end
            counter
        end
    end
    #returns the last node in the list
    #if there is only head, then head is also tail,we return whole node, if we want value, then just return tail.value
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
        #index must be greater than zero
        if index > 0
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
        #if we don't wont to delete head if it'i only remaining node, then just remove this condition
        else
            @head = nil
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
    #inserts a new node with the provided value at the given index
    def insert_at(value,index)
        if index == 0
            if head.nil?
                @head = Node.new(value)
            else
                old_head = head
                @head = Node.new(value,old_head)
            end
        #index must be positive
        elsif index > 0
            return if head.nil?
                
            curent = head
            count = 0
            while(!curent.next_node.nil?)
                count += 1
                curent = curent.next_node
                if index == count
                    #we must change node before current to pointing at new, and new point to old node
                    old_node = curent
                    curent = Node.new(value,old_node)
                    #we already have function to find at(index)
                    behind_node = at(count - 1)
                    behind_node.next_node = curent
                end
            end     
       else
           puts "Index must be greater than zero!"
       end       
    end
    #that removes the node at the given index
    def remove_at(index)
        if index == 0
            return if head.nil?
                
            front_node = at(1)
            @head = front_node
        #index must be positive
        elsif index > 0
           return if head.nil?
               
           curent = head
           count = 0
           while(!curent.next_node.nil?)
               count += 1
               curent = curent.next_node
               if index == count
                   #we already have function to find at(index)
                   #behind_node make point to node after current, and current is removed
                   behind_node = at(count - 1)
                   behind_node.next_node = curent.next_node
               end
            end     
       else
           puts "Index must be greater than zero!"
       end       
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
#both append and prepend work for head.nil
p ll.size # => 0
p ll.tail # => nil
ll.append(11)
p ll.tail # => #<Node:0x0000562050c488c8 @value=11, @next_node=nil>
p ll.size # => 1
ll.prepend(20)
ll.prepend(10)
p ll.tail # => #<Node:0x000055ba93514868 @value=11, @next_node=nil>
ll.append(17)
p ll.size # => 4
p ll.at(2) # => #<Node:0x000055ba93514868 @value=11, @next_node=#<Node:0x000055ba9386fd78 @value=17, @next_node=nil>>
p ll.at(8) # => nil
puts ll.to_s # => (10) -> (20) -> (11) -> (17) -> nil
ll.pop
puts ll.to_s # => (10) -> (20) -> (11) -> nil
p ll.contains(20) # => true
p ll.contains(10) # => true
p ll.contains(3) # => false
p ll.find(11) # => 2
p ll.find(10) # => 0
p ll.find(22) # => nil
ll.insert_at(3,0)
puts ll.to_s # => (3) -> (10) -> (20) -> (11) -> nil
ll.insert_at(4,2)
puts ll.to_s # => (3) -> (10) -> (4) -> (20) -> (11) -> nil
ll.insert_at(11,8)
puts ll.to_s # => (3) -> (10) -> (4) -> (20) -> (11) -> nil
ll.remove_at(2)
puts ll.to_s # => (3) -> (10) -> (20) -> (11) -> nil
ll.remove_at(3)
puts ll.to_s # => (3) -> (10) -> (20) -> nil
ll.remove_at(0)
puts ll.to_s # => (10) -> (20) -> nil