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
  end

  def fruit
      
  end
  
  def run
    Tk.mainloop
  end


end

app = GreedySnack.new
app.run