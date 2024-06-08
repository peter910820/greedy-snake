require "tk"

class GreedySnack
  def initialize
    @root = TkRoot.new do
      title "GreedySnack"
      geometry "800x800"
      resizable false, false
    end    

    @canvas = TkCanvas.new(@root) do
      background "black"
      pack(fill: 'both', expand:true) # 設定為填滿整個視窗
    end
    
    @snack = [[0, 0],[50, 0],[100, 0]]

    @snack.each do |body|
      x, y = body
      TkcRectangle.new(@canvas, x, y, x+50, y+40, "fill"=>"green")
    end

    @canvas.bind("KeyPress") { |event| key_press(event) }
    @canvas.focus

    fruit
  end

  def fruit
    TkcRectangle.new(@canvas, 200, 200, 250, 240, "fill"=>"red")
  end
  
  def key_press(event)
    @running = false
    case event.keysym
    when "Left"
      puts ""
    when "Right"
      unless @running
        @running = true
        Thread.new do
          while @running
            puts "r"
            sleep 0.5
          end
        end
      end
    when "Up"
      puts ""
    when "Down"
      puts ""
    end
  end

  def run
    Tk.mainloop
  end


end

app = GreedySnack.new
app.run