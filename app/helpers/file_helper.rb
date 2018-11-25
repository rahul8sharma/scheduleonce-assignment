module FileHelper
  def new_file(path, mode)
    File.new(path, mode)
  end

  def open_file(path)
    File.open(path)
  end

  def put_in_file(file, str)
    file.puts(str)
  end

  def close_file(file)
    file.close
  end
end
