# frozen_string_literal: true

require 'net/ftp'

class FtpImage
  FTP_URL = Rails.application.credentials.ftp_url
  FTP_LOGIN = Rails.application.credentials.ftp_login
  FTP_PASSWORD = Rails.application.credentials.ftp_password
  HOST_SERVER_PATH = Rails.application.credentials.host_server_path

  def initialize(image)
    @image = image.to_io
  end

  def save
    file_name = generate_file_name

    Net::FTP.open(FTP_URL, FTP_LOGIN, FTP_PASSWORD) do |ftp|
      ftp.chdir(HOST_SERVER_PATH)
      ftp.storbinary("STOR #{file_name}", StringIO.new(@image.read), Net::FTP::DEFAULT_BLOCKSIZE)
    end

    "http://#{HOST_SERVER_PATH}/#{file_name}"
  end

  def self.remove(full_file_path)
    file_name = full_file_path.split('/').last

    Net::FTP.open(FTP_URL, FTP_LOGIN, FTP_PASSWORD) do |ftp|
      ftp.chdir(HOST_SERVER_PATH)
      ftp.delete(file_name)
    end
    true
  rescue Net::FTPPermError
    false
  end

  private

  def generate_file_name
    file_name = File.basename(@image)
    uuid = SecureRandom.uuid

    "#{uuid}-#{file_name}"
  end
end
