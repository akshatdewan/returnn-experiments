import logging

def logging_test():
    handler = logging.FileHandler("logfile.txt", "w",)
                                  #encoding = "UTF-8")
    formatter = logging.Formatter("%(message)s")
    handler.setFormatter(formatter)
    root_logger = logging.getLogger()
    root_logger.addHandler(handler)
    root_logger.setLevel(logging.INFO)

    # This is an o with a hat on it.
    string = u'\u2019'
    #unicode_string = unicode("\xc3\xb4", "utf-8")

    #print("printed unicode object: %s".encode("utf-8") % string,encoding="utf-8")

    # Explode
    root_logger.info(string)
    root_logger.log(1,string)

if __name__ == "__main__":
    logging_test()
