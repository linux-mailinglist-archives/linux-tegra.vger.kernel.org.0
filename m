Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7770B4EB74
	for <lists+linux-tegra@lfdr.de>; Fri, 21 Jun 2019 17:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbfFUPCM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 21 Jun 2019 11:02:12 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42428 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfFUPCM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jun 2019 11:02:12 -0400
Received: by mail-wr1-f66.google.com with SMTP id x17so6887377wrl.9
        for <linux-tegra@vger.kernel.org>; Fri, 21 Jun 2019 08:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1h6XJ5OhQWJ9WnLTMAcYwIqIRZbHQHwK183NqHTTkqE=;
        b=L8qdZ67/uqfvi3TBYrRdLx/FaNFulsbj6J7nviPrp1E8/9PQ5WhjW858T2IRH7X/P/
         zmUpU83OKDEDlbAqQwStA9QWsm6Z6n0+mFfOOrsGwcqg/MGWS9oB59JeBioZv2RcTKhu
         SLEBvVm3nuTxQpf2RlmWPRikhDCgAOrnEczxzM+1KFf/4JmYL60q34zcuMIv0IzdmdJA
         APKnuC5h5p3sbn0M7U/QbqyEOBJ5E2JFpKVk/+Qo7jY7HlkUgXzdAjAozKoP32ZtyU0A
         hbhVtjxAMzhgoxfsh37CBoP2YsKG4/Uvjr2MvZRXBWrIBcuv6cW7OCEzLd9dG05017vO
         qB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1h6XJ5OhQWJ9WnLTMAcYwIqIRZbHQHwK183NqHTTkqE=;
        b=qIvVb3I+mlWLgSOhmytlIScMvdF4v3I9mOhNAk2T5XC4gM355KCac4Jju238z7IvGP
         4xSlKojz57sQIxqqyAvivcbHJX8nUi6GuuVSCm/L8UUMkmoeqf/6ZYnTvs1pqVVJIDVY
         RD+V96z1kjIb8ReQ9VMVFD0HyKy71uo++EtTRsu+xV2tN5vuBS/q4aEt1zGRJhSi2QKI
         1unlipfrbdYCm6o9tlw3BtPSMFQogn1/505vOLNplpWE6IpqfvPuCEauSsKkOwK7I1sa
         zXqO/PjEiKxLNO8IshcGH/tLRIDr7fQl3oCFWDw21LvjtD3urn4+EybbxxMSE3kCZ2c7
         DoDw==
X-Gm-Message-State: APjAAAXU+DJl2yFfqRlq/j5RfZ0OcCW+idKUaSQffncRBuSwRVa14oON
        vZaLl8Pfk+XFvgv2QJ7cXr8=
X-Google-Smtp-Source: APXvYqyorCk4OcXIKyoPbn3x/xMcQPSmgP9su2DFFoV31EmJZwmwiqzkHUBVKVS8aGsESSc10C91ww==
X-Received: by 2002:adf:c541:: with SMTP id s1mr294725wrf.44.1561129330076;
        Fri, 21 Jun 2019 08:02:10 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id l17sm3684989wrq.37.2019.06.21.08.02.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 08:02:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] memory: tegra: Changes for v5.3-rc1
Date:   Fri, 21 Jun 2019 17:02:03 +0200
Message-Id: <20190621150206.19037-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190621150206.19037-1-thierry.reding@gmail.com>
References: <20190621150206.19037-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.3-memory

for you to fetch changes up to 76ce48bdb303afa6e33cfbadca9d6bee23a4f559:

  memory: tegra: Fix -Wunused-const-variable (2019-06-14 18:02:02 +0200)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v5.3-rc1

A single fix for an unused constant variable, due to it being declared
outside the only #ifdef that it was being used from.

----------------------------------------------------------------
Nathan Huckleberry (1):
      memory: tegra: Fix -Wunused-const-variable

 drivers/memory/tegra/tegra124.c | 44 ++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 22 deletions(-)
