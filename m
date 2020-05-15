Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F421D528F
	for <lists+linux-tegra@lfdr.de>; Fri, 15 May 2020 16:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726226AbgEOOx1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 15 May 2020 10:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726144AbgEOOx1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 May 2020 10:53:27 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC05DC061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:26 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j5so3925764wrq.2
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lmddG1DMrrGkke9u3HDcgb/fjnSseCSdskwqTBgBjgk=;
        b=q1fU14e/mOgYr938TfV6SPOJ7D9L+MpnBPrkDRV2T44t8K5evvwQXFnWPhQSJUUcNs
         Xxm+y09XZyuLuVlpifnOBLgGzWDZ7KFY6qpGIJtcuhqsYtoAS4bWWdaAnQqoif1/0HXI
         F9+jWf8tkXThsFxkzptiTUqzJlJ4EpKeJQgIwoTZSp68r1oJD9E6y5c+TBnqfsA79pxH
         x9tM/ivbLNv1JBXZObMh5+ntg53ldtRe+yG4xVNrqM3Q6G5z89sLigYqRo6/AWxGh2vU
         PRszP2TA3enGxV3bhqQkYyfblFZ7GBIVLs7I4cGvSqISGJvuXCC4xS+t194qV+pwR9cr
         nRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lmddG1DMrrGkke9u3HDcgb/fjnSseCSdskwqTBgBjgk=;
        b=OWJTORWDrzftUpJqp3nIIsZlR1eYJkUNdU+1XfAKPLoEo3Nh1ZJZF4f5HrWGiKRS57
         VMf4hCce0h9Lk/r3RgiRSbhbwI/fiLKipogIka13Farm8IJVWrsw5TLRG24tN+zGLXPy
         GcG63QAw08DaE129Jq1IezQo2kejsFhvYC9pc41Nof38TZNhTxYhuqOzE5tPpUgioh+F
         JudpIOpI9PYL3upnwX5NN22QG5E/hAPaTGZ4HZBCMQImPw9rrnUsm9EWECXqmuLwEBX4
         5wFswlt/5fo8JMNaKQp78ekkdtL9DlSaKTOyex88YKgC6Kznxpkv0S3prqWEYE9FHjID
         8zyQ==
X-Gm-Message-State: AOAM532QUu0nnFrB/vxo4hLvUVlySWEZYNTVzZGL4Pbw2Oh9G6oibNyl
        jCpqqaphBjrJ/miksO8BwyQ=
X-Google-Smtp-Source: ABdhPJwSfno+ANZFWnQdMXycMoy1GpWpsz0ZHcxrlPpJgQkF8J4ctobz+omnB2PeS9mJO2gEXhG84Q==
X-Received: by 2002:adf:dfc6:: with SMTP id q6mr4939259wrn.217.1589554405703;
        Fri, 15 May 2020 07:53:25 -0700 (PDT)
Received: from localhost (pD9E51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id w15sm3924018wrl.73.2020.05.15.07.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:53:25 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 05/11] firmware: tegra: Changes for v5.8-rc1
Date:   Fri, 15 May 2020 16:53:05 +0200
Message-Id: <20200515145311.1580134-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200515145311.1580134-1-thierry.reding@gmail.com>
References: <20200515145311.1580134-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-firmware

for you to fetch changes up to b720aaa347f227c416e8aed2f12ca62ea4f1cd4e:

  firmware: tf: Different way of L2 cache enabling after LP2 suspend (2020-05-06 18:27:26 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.8-rc1

This contains a change that makes the BPMP driver a regular driver,
which fixes some weird suspend/resume ordering issues. Another fix is
also included to implement another way of enabling the L2 cache after
LP2 suspend.

----------------------------------------------------------------
Dmitry Osipenko (1):
      firmware: tf: Different way of L2 cache enabling after LP2 suspend

Thierry Reding (1):
      firmware: tegra: Make BPMP a regular driver

 drivers/firmware/tegra/bpmp.c                |  9 +++------
 drivers/firmware/trusted_foundations.c       | 21 +++++++++++++++++++--
 include/linux/firmware/trusted_foundations.h |  1 +
 3 files changed, 23 insertions(+), 8 deletions(-)
