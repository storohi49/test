$w = []
class Dir

  def self.print_tree(top_dir = Dir.pwd)
    unless File.directory?(top_dir)
      raise %("#{top_dir}") + " is not directory."
    end
    puts "<#{File.basename(top_dir)}>"
    $w << "<#{File.basename(top_dir)}>"

    walk_dir = ->(dir, pre) {
      Dir.chdir(dir) rescue return
      d_f = Dir.glob("*").sort_by{|fn| 
       if File.directory?(fn) 
        File.dirname(fn) 
       else
        File.basename(fn) 
       end
      }
      dirs = d_f.select {|df| File.directory?(df)}
      files = d_f - dirs
      end_num = d_f.size
      line_num = 1
      
      dirs.each do |d|
        s0 = (line_num == end_num) ? "└" : "├"
        line_num += 1
        puts pre + s0 + "<#{d}>"
        w1 = pre.gsub(/ */,'').gsub(/└/,"\t").gsub(/├/,"\t").gsub(/│ */,"\t")
        w2 = s0.gsub(/ */,'').gsub(/└/,"\t").gsub(/├/,"\t").gsub(/│ */,"\t")
        # $w << pre + s0 + "<#{d}>"
        $w << w1 + w2 + "<#{d}>"

        s1 = pre + ((s0 == "└") ? "   " : "│  ")
        walk_dir.(d, s1)
      end
      
      files.each do |f|
        s = (line_num == end_num) ? "└" : "├"
        line_num += 1
        puts pre + s + f
        # $w << pre + s + f
        $w << "\t\t\t\t\t#{File.basename(f,".*")}\t#{f}\tFILE"
      end
      Dir.chdir("..")
    }
    walk_dir.(top_dir, "  ")
  end
end

TARGET_DIR = "C:\\Users\\kreis\\Desktop\\いったん整理"
OUTPUT_FILE = "C:\\RubyWork\\test04\\result.txt"

if __FILE__ == $0
  Dir.print_tree(TARGET_DIR)
  File.open(OUTPUT_FILE, mode = "w:sjis:utf-8"){|f|
    $w.each do | s |
      f.write(s + "\n")  # ファイルに書き込む
    end
  }
end

