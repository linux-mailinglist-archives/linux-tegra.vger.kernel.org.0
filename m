Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4376F21B77A
	for <lists+linux-tegra@lfdr.de>; Fri, 10 Jul 2020 16:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbgGJOAz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Jul 2020 10:00:55 -0400
Received: from mail-lj1-f173.google.com ([209.85.208.173]:33029 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgGJOAz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Jul 2020 10:00:55 -0400
Received: by mail-lj1-f173.google.com with SMTP id e8so6600036ljb.0;
        Fri, 10 Jul 2020 07:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QYFh8vpRLnjHCKHrvg828YTkUsQRpahtN+xt+XiOHc4=;
        b=ICX7g9Epf/w8ThhZU60f1V2uquuiYTwxaFzKKzIFaKHIdNU3MtlMxMwhslOo8T+ffa
         dRuPRmyZCvCO70zd11USsgYiYDaMe7HOiwLE0UghIyGeGZi7PyxAeJ2isW3OrTOilytW
         TkuzP3CEo9dv1YXATiOICixKPUvbV1JnEI0v6A24j1eo5LlWz/FTzmQcafvKKcKKSQG7
         3k0M3fOxP5nfJkTPYhsH1nJRXf5yzQE0hu1Rj/R9Sit4CyLmrt7LBWHPj87Jj5ETEbL0
         INLsEfR/daMuFUNEIUX0r6b+QeCyKzTrkN+SX7d7r+1/l6T4fDbbKZW5k2KToMAzhC3z
         H72Q==
X-Gm-Message-State: AOAM533oWGQcb7o11dEDuP2AoiAPC/geQW3yUMoNbYsaX0tqCcZGy5U8
        +0X/ClVBA930CA/Nyhq2Y3E=
X-Google-Smtp-Source: ABdhPJzevn8gUmq/9y0I8eNw0EPgWLFAUMqx4wIZ2a74v7sMRQ83y6efxRC2uxBXvJxHkd/JXbqEPw==
X-Received: by 2002:a2e:859a:: with SMTP id b26mr28374983lji.241.1594389652997;
        Fri, 10 Jul 2020 07:00:52 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id m14sm3244483lfp.18.2020.07.10.07.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 07:00:52 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jttaB-0000jR-O9; Fri, 10 Jul 2020 16:00:55 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Laxman Dewangan <ldewangan@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jslaby@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/2] serial: tegra: fix CREAD handling for PIO
Date:   Fri, 10 Jul 2020 15:59:45 +0200
Message-Id: <20200710135947.2737-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Stumbled over these two; compile-tested only.

Johan


Johan Hovold (2):
  serial: tegra: fix CREAD handling for PIO
  serial: tegra: drop bogus NULL tty-port checks

 drivers/tty/serial/serial-tegra.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

-- 
2.26.2

