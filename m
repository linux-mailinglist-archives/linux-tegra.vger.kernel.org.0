Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A89A010092B
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 17:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbfKRQZt (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 11:25:49 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38821 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbfKRQZt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 11:25:49 -0500
Received: by mail-lf1-f68.google.com with SMTP id q28so14337009lfa.5
        for <linux-tegra@vger.kernel.org>; Mon, 18 Nov 2019 08:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DwZQCrcyzqNURPHxyJNs+XQEHUkYuNYLuJ0RNSVriyM=;
        b=szf0+AfA5N/crDYTX8FpYVJ6wn/O532a8ELrqi1siGzwg2I14rg9IpPrkKUlIzzKTJ
         SQt8TYCVkMBtEzQTVCRnb7nxTf+voRKr3Wc4d4S7GvM7g3wtYpbKZtqUCY/CK0nVPxE2
         +1hPC4soCaqU/XSIDKxJfmE/5kT0GURMvYjCp9mT5y5QVC0YNB6f4uCaWX5OqmLwQA9/
         d68s14n4/ZiSi5BwSqUlRo2wIA15+KrVc/vG2EXSKwVn/cT3v/D+8Msv4QDD5aSUF3VR
         rfPtVyImSsNwIk86rMW2BihHOVzVSJi9hxEdmwwx3JrTJ0Kw1YTfBfJ6U7Jd26SYRFcy
         f2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DwZQCrcyzqNURPHxyJNs+XQEHUkYuNYLuJ0RNSVriyM=;
        b=PYlgA6su1fNqrdf/SXORnc6rh1NplDcbxQQmSl+dzvifHlfy37LBoSMpwq30wn0phH
         u6GmjHqArAsufmDPMLqP7LVuiGDk2ex2iFVE55W+3pm7Knz1at2wvlxr0f1B+qetXh5L
         s7jYdjyFENO2cIs0z7fQHGDTC685obOIZILgyQZ2pJEJpCElxsz/noonakcGoyyQSSVt
         mq2RRtdiNeEJQOaF92U8aZDC7Oh1YQg7+sDRSgarZQkKp0TAgGKS4aS5iQlH9T1OiM0j
         iJ/MVkEr1Cxq++Ii/D0W/XOpJZjjZhtPZDUxJqeVxK3oegRXtMkO0r9ExsWLVj53lPuw
         qpJA==
X-Gm-Message-State: APjAAAW9LtQGwAlG2EiiQ7V2y06Hp0p6+Gv+bBVwQl40LWcD9bJnUsPu
        U6caKThMZIHQErhR4rKQvXd+3bKl
X-Google-Smtp-Source: APXvYqyHVASOTyx0eRxqX3vdXYATU3qG4g1jOd3RtcuYENU64+s2wIATwJBvQ5JkxtSJ5VECGgfIcw==
X-Received: by 2002:a19:790c:: with SMTP id u12mr166606lfc.183.1574094347079;
        Mon, 18 Nov 2019 08:25:47 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id d24sm8582872ljg.73.2019.11.18.08.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 08:25:46 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v3 0/4] Minor cleanup of tegra-apbmisc.c
Date:   Mon, 18 Nov 2019 19:24:56 +0300
Message-Id: <20191118162500.6651-1-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

There are couple things could be improved in tegra-apbmisc.c and this
patchset addresses them. Please note that the fallback for older device
trees was broken for T124 since 2015, so it is also a minor change.

Changelog:

v3: - Michał Mirosław suggested to unmap APB MISC registers after they
      are not needed anymore. There is now a new patch which does that,
      see patch "Unmap registers once they are not needed anymore".

v2: - Corrected commit's title of the "Warn if straps are not ready" patch.

Dmitry Osipenko (4):
  soc/tegra: fuse: Cache values of straps and Chip ID registers
  soc/tegra: fuse: Warn if straps are not ready
  soc/tegra: fuse: Correct straps' address for older Tegra124 device
    trees
  soc/tegra: fuse: Unmap registers once they are not needed anymore

 drivers/soc/tegra/fuse/tegra-apbmisc.c | 33 +++++++++++++++-----------
 1 file changed, 19 insertions(+), 14 deletions(-)

-- 
2.23.0

