# 5-cipher.rb

class CaesarCipher
  def initialize(shift)
    @shift = shift % 26  # Keep shift within 0-25
  end

  # Public method to encrypt a plaintext message
  def encrypt(message)
    cipher(message, @shift)
  end

  # Public method to decrypt a ciphertext message
  def decrypt(message)
    cipher(message, -@shift)
  end

  private

  # Private method to shift characters
  def cipher(message, shift)
    result = message.chars.map do |char|
      if char =~ /[A-Z]/  # Uppercase letters
        ((char.ord - 'A'.ord + shift) % 26 + 'A'.ord).chr
      elsif char =~ /[a-z]/  # Lowercase letters
        ((char.ord - 'a'.ord + shift) % 26 + 'a'.ord).chr
      else
        char  # Non-letter characters remain unchanged
      end
    end
    result.join
  end
end
