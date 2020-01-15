Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1AEA13C8B5
	for <lists+linux-tegra@lfdr.de>; Wed, 15 Jan 2020 17:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgAOQFT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 15 Jan 2020 11:05:19 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:32922 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbgAOQFT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Jan 2020 11:05:19 -0500
Received: by mail-ot1-f66.google.com with SMTP id b18so16580181otp.0
        for <linux-tegra@vger.kernel.org>; Wed, 15 Jan 2020 08:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AIn1O5GCmKw7dugKJey6e6TvKV2y4GDiW1xXQSe2Ay0=;
        b=KzzAT4eFTTOW5h62roG0mwmxDRSdIl5vKzXJygcn7ZlZYv0OUB+e+ITa98vJvA6cev
         a2YQ3q9mFRvotM6uM0M9Akwnr2+U2lxFMKrJZwSVxXsyB2smmCnIQxV7SrUhqyQI2cXZ
         NY+aXMB/U8EhwkjyiDHoXZhRPPhzdRW8R5nDMQuIyK/pfyyYegQreGK3sFHrTrnZLPDk
         zJvLp6w0aD09yY88r+97H+wS6vUrV1bGkcVHdUA7yKPqJ8yWq3CKo4bURZ8mVrEtQ2/u
         8AXaS01dXH41bA28zaPztMKm+DQ0LiRzzDcXUWqrksWHqOVeOzavBzxDOkKdLY6SbrqV
         yJNw==
X-Gm-Message-State: APjAAAUOp2Io9coRHc2v1TRFFwgsrYBihpHLgxaD8zjTjzkwmE7Hb054
        gsujRQs5xfGmqypoU0RL4qzBaf8=
X-Google-Smtp-Source: APXvYqwPIokLPO+8Kjk4Ty5TyGv/9dDG7P2fQuY33Rbc3cgmcgiULJ1MkYzHc2pJhpPkYFAx0KV2Nw==
X-Received: by 2002:a9d:7342:: with SMTP id l2mr3236207otk.98.1579104317926;
        Wed, 15 Jan 2020 08:05:17 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e13sm5835239oie.0.2020.01.15.08.05.16
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 08:05:17 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22040c
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 10:05:16 -0600
Date:   Wed, 15 Jan 2020 10:05:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        robh@kernel.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, felipe.balbi@linux.intel.com,
        JC Kuo <jckuo@nvidia.com>
Subject: Re: [PATCH v1] dt-binding: usb: add "super-speed-plus"
Message-ID: <20200115160516.GA18911@bogus>
References: <20200113060046.14448-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113060046.14448-1-jckuo@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 13 Jan 2020 14:00:46 +0800, JC Kuo wrote:
> This commit adds "super-speed-plus" to valid argument list of
> "maximum-speed" property.
> 
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
>  Documentation/devicetree/bindings/usb/generic.txt | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Applied, thanks.

Rob
