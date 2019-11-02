Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57DB1ECF41
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Nov 2019 15:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbfKBOpg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Nov 2019 10:45:36 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39831 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbfKBOpf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Nov 2019 10:45:35 -0400
Received: by mail-wr1-f68.google.com with SMTP id a11so12438002wra.6
        for <linux-tegra@vger.kernel.org>; Sat, 02 Nov 2019 07:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MAOpf19Rv+QTNeLC4ay/kzy/vxHx95YXt4ybf6UxezE=;
        b=cEFeNCO996rwT9dLDb6PazDHruS2DXgFrmVk1ZCp1mheM3zejbF+Aml+a+wzdZzSc5
         CKMmKWiEP4KwznsXm7b2nS0ZAjgnAtWAehw5fCZUh7DVuhIcFVe7IhZz74bobBwGkiSw
         0Gv6VRQ9zzUgIQsoiC8wGMhqK6ejk0dPhDLYew8OVCXXLVMwwNDwkOAr1/xowhYjCj8Z
         oK9hK/DC/HTYRDmlwZYLYdAhFb5l+qScBa1gIMeDNO8uhesH/qkFg0bNlqytFrNf9QBB
         1EOicvAr4+rhx4SrRFuuIm6wEUH5ot/xqdILc5zmCiLQYJmQHbcn19IobBWs7iT/nEV7
         d1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MAOpf19Rv+QTNeLC4ay/kzy/vxHx95YXt4ybf6UxezE=;
        b=IN0fXPjCyLZ0z1j64SFFtprk9I6jmnqwdzSD8z3/8MSISKvCeCoA8RS3n1US6y2pbi
         ARlZIf8nAGGd+lTLIQ9TYGK3jhfWGbxxTLcHSNbwt3AFjoWk+AtO4bYxc+j/pdAnxZZt
         NKJ3FCFknDFs3OG2eglQTYbe4YRsz92aFYO2twp4YbTIWGSFyAvz4vQjK2TluX+1ITMQ
         hI+nGPS+jEu54kH6Jdhw4acXMzAeJ/xuYNbXRt2sotOL+UtfTo534Gum63jodj8+G2mo
         +VM9m8gdZdMHQu0BbT9az94XiLwNa16s0CDaw5gaanYk3rtmTjR7eBATxh131Tqguo17
         1LOA==
X-Gm-Message-State: APjAAAXnggke2M/sZF9UJ44zAncTXGi6KQA7s0vaFzGV9I2lVowHzT1e
        FLPNNLbEuUsXjkZQnYU3MBM=
X-Google-Smtp-Source: APXvYqyIQFzQNCJzpwCJ4MiClLrIPj/lcQNwCnZ335IGacM0xM2T8DQIC+FbKlpxmErLOgp8QNIEnw==
X-Received: by 2002:adf:f68f:: with SMTP id v15mr14435612wrp.171.1572705932280;
        Sat, 02 Nov 2019 07:45:32 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id t134sm13522661wmt.24.2019.11.02.07.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 07:45:31 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/8] ARM: tegra: Core changes for v5.5-rc1
Date:   Sat,  2 Nov 2019 15:45:18 +0100
Message-Id: <20191102144521.3863321-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102144521.3863321-1-thierry.reding@gmail.com>
References: <20191102144521.3863321-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-arm-core

for you to fetch changes up to 91d7ff5aa7e3edd9ab99a424099476ed5667b152:

  ARM: tegra: Use WFE for power-gating on Tegra30 (2019-10-29 14:32:01 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v5.5-rc1

Contains two fixes for CPU idle and suspend/resume on early Tegra SoCs.

----------------------------------------------------------------
Dmitry Osipenko (2):
      ARM: tegra: Fix FLOW_CTLR_HALT register clobbering by tegra_resume()
      ARM: tegra: Use WFE for power-gating on Tegra30

 arch/arm/mach-tegra/reset-handler.S |  6 +++---
 arch/arm/mach-tegra/sleep-tegra30.S |  4 +++-
 drivers/soc/tegra/flowctrl.c        | 19 +++++++++++++++++--
 3 files changed, 23 insertions(+), 6 deletions(-)
