test_that("A list of sequences are denoised properly.", {

  list_seq_output1 = denoise_list(ex_nt_list, dir_check = FALSE)

  expected1 = list( "ATTTTTGGTGCATGAGCAGGAATAGTTGGAATAGCTTTAAGTTTACTAATTCGCGCTGAACTAGGTCAACCCGGATCTCTTTTAGGGGATGATCAGATTTATAATGTGATCGTAACCGCCCATGCCTTTGTAATAATCTTTTTTATGGTTATACCTGTAATAATTGGTGGCTTTGGCAATTGACTTGTTCCTTTAATAATTGGTGCACCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTCTGGCTTCTTCCTCCTTCGTTCTTACTTCTCCTGGCCTCCGCAGGAGTAGAAGCTGGAGCAGGAACCGGATGAACTGTATATCCTCCTTTAGCAGGTAATTTAGCACATGCTGGCCCCTCTGTTGATTTAGCCATCTTTTCCCTTCATTTGGCCGGTATCTCATCAATTTTAGCCTCTATTAATTTTATTACAACTATTATTAATATAAAACCCCCAACTATTTCTCAATATCAAACACCATTATTTGTTTGATCTATTCTTATCACCACTGTTCTTCTACTCCTTGCTCTCCCTGTTCTTGCAGCCGGAATTACAATATNNNNNNNNNNNNNNNACCTCAACACTACATTCTTTGACCCCGCAGGGGGAGGGGACCCAATTCTCTATCAACACTTA",
       "CTCTACTTGATTTTTGGTGCATGAGCAGGAATAGTTGGAATAGCTTTAAGTTTACTAATNNNNNNNNNNNNNNNTCAACCCGGATCTCTTTTAGGGGATGATCAGATTTATAATGTGATCGTAACCGCCCATGCCTTTGTAATAATCTTTTTTATGGTTATACCTGTAATAATTGGTGGCTTTGGCAATTGACTTGTTCCTTTAATAATTGGTGCACCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTCTGGCTTCTTCCTCCTTCGTTCTTACTTCTCCTGGCCTCCGCAGGAGTAGAAGCTGGAGCAGGAACCGGATGAACTGTATATCCTCCTTTAGCAGGTAATTTAGCACATGCTGGCCCCTCTGTTGATTTAGCCATCTTTTCCCTTCATTTGGCCGGTATCTCATCAATTTTAGCCTCTATTAATTTTATTACAACTATTATTAATATAAAACCCCCAACTATTTCTCAATATCAAACACCATTATTTGTTTGATCTATTCTTATCACCACTGTTCTTCTACTCCTTGCTCTCCCTGTTCTTGCAGCCGGAATTACAATATTATTAACAGACCGCAACCTCAACACTACATTCTTTGACCCCGCAGGGGGAGGGGACCCAATTCTCTATCAACACTTA",
        "CTCTACTTGATTTTTGGTGCATGAGCAGGAATAGTTGGAATAGCTTTAAGNNNNNNNNNNNNNNCTGAACTAGGTCAACCCGGATCTCTTTTAGGGGATGATCAGATTTATAATGTGATCGTAACCGCCCATGCCTTTGTAATAATCTTTTTTATGGTTATACCTGTAATAATTGGTGGCTTTGGCAATTGACTTGTTCCTTTAATAATTGGTGCACCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTCTGGCTTCTTCCTCCTTCGTTCTTACTTCTCCTGGCCTCCGCNNNNNNNNNNNNNNNAGCAGGAACCGGATGAACTGTATATCCTCCTTTAGCAGGTAATTTAGCACATGCTGGCCCCTCTGTTGATTTAGCCATCTTTTCCCTTCATTTGGCCGGTATCTCATCAATTTTAGCCTCTATTAATTTTATTACAACTATTATTAATATAAAACCCCCAACTATTTCTCAATATCAAACACCATTATTTGTTTGATCTATTCTTATCACCACTGTTCTTCTACTCCTTGCTCTCCCTGTTCTTGCAGCCGGAATTACAATATTATTAACAGACCGCAACCTCAACACTACATTCTTTGACCCCGCAGGGGGAGGGGACCCAATTCTCTATCAACACTTA",
        "CTCTACTTGATTTTTGGTGCATGAGCAGGAATAGTTGGAATAGCTTTAAGTTTACTAATTCGCGCTGAACTAGGTCAACCCGGATCTCTTTTAGGGGATGATCAGATTTATAATGTGATCGTAACCGCCCATGCCTTTGTAATAATCTTTTTTATGGTTATACCTGTAATAATTGGTGGCTTTGGCAATTGACTTGTTCCTTTAATAATTGGTGCACCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTCTGGCTTCTTCCTCCTTCGTTCTTACTTCTCCTGGCCTCCGCAGGAGTAGAAGCTGGAGCAGGAACCGGATNNNNNNNNNNNNNNNCTTTAGCAGGTAATTTAGCACATGCTGGCCCCTCTGTTGATTTAGCCATCTTTTCCCTTCATTTGGCCGGTATCTCATCAATTTTAGCCTCTATTAATTTTATTACAACTATTATTAATATAAAACCCCCAACTATTTCTCAATATCAAACACCATTATTTGTTTGATCTATTCTTATCACCACTGTTCTTCTACTCCTTGCTCTCCCTGTTCTTGCAGCCGGAATTACAATATTATTAACAGACCGCAACCTCAACACTACATTCTTTGACCCCGCAGGGGGAGG")
  
  expect_equal(all.equal(expected1, list_seq_output1), TRUE)
  
  list_seq_output2 = denoise_list(ex_nt_list, keep_flanks=FALSE, dir_check = FALSE)
  expected2 = list( "NNNNNNNNNNNNATTTTTGGTGCATGAGCAGGAATAGTTGGAATAGCTTTAAGTTTACTAATTCGCGCTGAACTAGGTCAACCCGGATCTCTTTTAGGGGATGATCAGATTTATAATGTGATCGTAACCGCCCATGCCTTTGTAATAATCTTTTTTATGGTTATACCTGTAATAATTGGTGGCTTTGGCAATTGACTTGTTCCTTTAATAATTGGTGCACCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTCTGGCTTCTTCCTCCTTCGTTCTTACTTCTCCTGGCCTCCGCAGGAGTAGAAGCTGGAGCAGGAACCGGATGAACTGTATATCCTCCTTTAGCAGGTAATTTAGCACATGCTGGCCCCTCTGTTGATTTAGCCATCTTTTCCCTTCATTTGGCCGGTATCTCATCAATTTTAGCCTCTATTAATTTTATTACAACTATTATTAATATAAAACCCCCAACTATTTCTCAATATCAAACACCATTATTTGTTTGATCTATTCTTATCACCACTGTTCTTCTACTCCTTGCTCTCCCTGTTCTTGCAGCCGGAATTACAATATNNNNNNNNNNNNNNNACCTCAACACTACATTCTTTGACCCCGCAGGGGGAGGGGACCCAATTCTCTATCAACACTTA",
                    "NNNCTCTACTTGATTTTTGGTGCATGAGCAGGAATAGTTGGAATAGCTTTAAGTTTACTAATNNNNNNNNNNNNNNNTCAACCCGGATCTCTTTTAGGGGATGATCAGATTTATAATGTGATCGTAACCGCCCATGCCTTTGTAATAATCTTTTTTATGGTTATACCTGTAATAATTGGTGGCTTTGGCAATTGACTTGTTCCTTTAATAATTGGTGCACCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTCTGGCTTCTTCCTCCTTCGTTCTTACTTCTCCTGGCCTCCGCAGGAGTAGAAGCTGGAGCAGGAACCGGATGAACTGTATATCCTCCTTTAGCAGGTAATTTAGCACATGCTGGCCCCTCTGTTGATTTAGCCATCTTTTCCCTTCATTTGGCCGGTATCTCATCAATTTTAGCCTCTATTAATTTTATTACAACTATTATTAATATAAAACCCCCAACTATTTCTCAATATCAAACACCATTATTTGTTTGATCTATTCTTATCACCACTGTTCTTCTACTCCTTGCTCTCCCTGTTCTTGCAGCCGGAATTACAATATTATTAACAGACCGCAACCTCAACACTACATTCTTTGACCCCGCAGGGGGAGGGGACCCAATTCTCTATCAACACTTA",
                    "NNNCTCTACTTGATTTTTGGTGCATGAGCAGGAATAGTTGGAATAGCTTTAAGNNNNNNNNNNNNNNCTGAACTAGGTCAACCCGGATCTCTTTTAGGGGATGATCAGATTTATAATGTGATCGTAACCGCCCATGCCTTTGTAATAATCTTTTTTATGGTTATACCTGTAATAATTGGTGGCTTTGGCAATTGACTTGTTCCTTTAATAATTGGTGCACCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTCTGGCTTCTTCCTCCTTCGTTCTTACTTCTCCTGGCCTCCGCNNNNNNNNNNNNNNNAGCAGGAACCGGATGAACTGTATATCCTCCTTTAGCAGGTAATTTAGCACATGCTGGCCCCTCTGTTGATTTAGCCATCTTTTCCCTTCATTTGGCCGGTATCTCATCAATTTTAGCCTCTATTAATTTTATTACAACTATTATTAATATAAAACCCCCAACTATTTCTCAATATCAAACACCATTATTTGTTTGATCTATTCTTATCACCACTGTTCTTCTACTCCTTGCTCTCCCTGTTCTTGCAGCCGGAATTACAATATTATTAACAGACCGCAACCTCAACACTACATTCTTTGACCCCGCAGGGGGAGGGGACCCAATTCTCTATCAACACTTA",
                    "NNNCTCTACTTGATTTTTGGTGCATGAGCAGGAATAGTTGGAATAGCTTTAAGTTTACTAATTCGCGCTGAACTAGGTCAACCCGGATCTCTTTTAGGGGATGATCAGATTTATAATGTGATCGTAACCGCCCATGCCTTTGTAATAATCTTTTTTATGGTTATACCTGTAATAATTGGTGGCTTTGGCAATTGACTTGTTCCTTTAATAATTGGTGCACCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTCTGGCTTCTTCCTCCTTCGTTCTTACTTCTCCTGGCCTCCGCAGGAGTAGAAGCTGGAGCAGGAACCGGATNNNNNNNNNNNNNNNCTTTAGCAGGTAATTTAGCACATGCTGGCCCCTCTGTTGATTTAGCCATCTTTTCCCTTCATTTGGCCGGTATCTCATCAATTTTAGCCTCTATTAATTTTATTACAACTATTATTAATATAAAACCCCCAACTATTTCTCAATATCAAACACCATTATTTGTTTGATCTATTCTTATCACCACTGTTCTTCTACTCCTTGCTCTCCCTGTTCTTGCAGCCGGAATTACAATATTATTAACAGACCGCAACCTCAACACTACATTCTTTGACCCCGCAGGGGGAG")
                    #one bp gets dropped from the final sequence when flanks are not kept... odd little quirk
  expect_equal(all.equal(expected2, list_seq_output2), TRUE)

  list_seq_output3 = denoise_list(ex_nt_list, to_return = "DNAseq", keep_flanks=FALSE, dir_check = FALSE)
  
  })