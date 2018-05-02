L2I = dict(zip("ABCDEFGHIJKLMNOPQRSTUVWXYZ", range(26)))
I2L = dict(zip(range(26), "ABCDEFGHIJKLMNOPQRSTUVWXYZ"))

ciphertext = "start"
while ciphertext != "stop":

    ciphertext = str(input("Enter new text\n"))
    if ciphertext == "stop":
        exit(1)
    for key in range(26):

        plaintext2 = ""
        for c in ciphertext.upper():
            if c.isalpha():
                plaintext2 += I2L[(L2I[c] - key) % 26]
            else:
                plaintext2 += c

        print ("Key " + str(key) + " / " + I2L[key] + ". Text :" + plaintext2)

