-- If this fails, check that finaleplugin.LoadLuaOSUtils is true in the top-level plugindef function your are invoking
local osutils = DoRequire("luaosutils")
if not osutils then return end
local crypto = osutils.crypto
if not AssureNonNil(crypto, "Luaosutils "..osutils._VERSION.." is not the right version.") then
    return
end

local crypto_file = GetRunningFolderPath() .. "/tools/crypto_testfile.xml"
local file <close> = io.open(crypto_file, "rb")
if not AssureNonNil(file, "failed to open "..crypto_file) then
    return
end
local plaintext = file:read("a")

local test_hash = crypto.calc_file_hash(crypto_file)
local expected_hash = "f0bb1f396b3d486d4491b77f6c693bc8f44d9a7a17bf0541fd51152dd6adbbf029f1e47a25b178533ce4dd073e721597f8e7dbbf82586a51e1359fbf681d5ff9"
AssureEqual(test_hash, expected_hash, "the test hash and expected hash values are equal.")
local hash_bin = crypto.conv_chars_to_bin(test_hash)
local hash_chars = crypto.conv_bin_to_chars(hash_bin)
AssureEqual(test_hash, hash_chars, "Hash succcesfully converted from chars to binary and back.")

local key_seed = "This is an easy key seed." -- for a real application, this should be a random sequence of characters constructed on the fly
local salt = crypto.calc_randomized_data()
local key = crypto.calc_crypto_key(key_seed, salt)
local cyphertext, iv = crypto.encrypt(key, plaintext)
local new_plaintext = crypto.decrypt(key, cyphertext, iv)
AssureEqual(plaintext, new_plaintext, "decrypted text is equal to original text.")

local key_str = crypto.conv_bin_to_chars(key)
local key_bin = crypto.conv_chars_to_bin(key_str)
AssureEqual(key, key_bin, "Key successfully converted from binary to string and back.")
