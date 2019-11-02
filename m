Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0F24ECF3E
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Nov 2019 15:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfKBOp2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Nov 2019 10:45:28 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:32784 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbfKBOp2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Nov 2019 10:45:28 -0400
Received: by mail-wr1-f66.google.com with SMTP id s1so12477161wro.0
        for <linux-tegra@vger.kernel.org>; Sat, 02 Nov 2019 07:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uIJKIjYCPlBHk4DNKC7Nuhb+JB+uMa/Qa+51TF1mf/o=;
        b=DFMS56MvP6bXLcOl8XeucYLRueXyFQfDIMLgjAD9tRO1V8s1truoh3IfMlzjqhIUPN
         F+4vFCwz/EsCjiZIYqhq2RbngBLxRFOSlqLuXtY/QTQs/iAgg8ozfm44iHnRkl09Zvnk
         hICpZTOzCl6rrmbu/H8+r0XDctznYAM/sU/D9exi0vOOBQ9ClxNmzjTEzH/hC9hJ7u0U
         M9x3M8or8FdzGSqSucC4y333YQpZ4K3bHJRyutptQCvITVqrTWdZid+c6lKf0/T2CFRc
         gCYvgQ92uXJZksWn91fHYaEkVsgJxCHBm+pTpVy7L8Om4eTqAEoddWMKsrdEjuHfVPj/
         q+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uIJKIjYCPlBHk4DNKC7Nuhb+JB+uMa/Qa+51TF1mf/o=;
        b=E1MTllhTUDZ0cYdaGq2Kh6IM1SLVlsBmWC+Nq9+sWe71kQ8WjjtXY1QKPwSmjTgRUL
         gVTPkB/pGljXxhqGRpAvVgdrR1ZYEh76RIV8+uQpNMUzjPxN4ZsDR8G+TgJ4AKbgAaiA
         Po9YUNj0EwG7unWJWNFAwlYvw+APKtM/PTSy0HCp8gsBERHyQ8vElX/QDbVtj5AR9htA
         MP5l50CCPABvZ/gviqzVa419T0lr7gNkYKEys3OhkS68/qQDETNFUaCBArRURLSU0GM+
         JxEdGZD6GHQ1noOr74DCq+ayZNP6Noef/A1J+utCglmVqiN8zg+AB4hWOT7XptAJBBmG
         2SlQ==
X-Gm-Message-State: APjAAAVK4LJc0shb7UjhPfiET9icJ5GaKOdrdH/J3ucjb4He12pezhoT
        pxYwuD9N8Vz+I9AFDM7nFWYk/PSo
X-Google-Smtp-Source: APXvYqzzFurzv0uf5mrazs3VzK2UtgCQwneM9JKgkLcW+cgU9KJVnQ+tZbrIZqh5ZRJQt5FpaSfZzQ==
X-Received: by 2002:adf:9ec7:: with SMTP id b7mr15694814wrf.221.1572705926256;
        Sat, 02 Nov 2019 07:45:26 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id w81sm11048840wmg.5.2019.11.02.07.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 07:45:24 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/8] firmware: tegra: Changes for v5.5-rc1
Date:   Sat,  2 Nov 2019 15:45:15 +0100
Message-Id: <20191102144521.3863321-2-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-firmware

for you to fetch changes up to befc1bab91171d25de22dbcbf41309582a63ecd7:

  firmware: tegra: Move BPMP resume to noirq phase (2019-10-01 16:38:45 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.5-rc1

This contains a single fix for suspend/resume on Tegra194.

----------------------------------------------------------------
Vidya Sagar (1):
      firmware: tegra: Move BPMP resume to noirq phase

 drivers/firmware/tegra/bpmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
